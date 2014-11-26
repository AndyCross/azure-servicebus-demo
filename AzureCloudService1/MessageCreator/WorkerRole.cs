using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;

namespace MessageCreator
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent runCompleteEvent = new ManualResetEvent(false);

        public override void Run()
        {
            Trace.TraceInformation("MessageCreator is running");

            try
            {
                this.RunAsync(this.cancellationTokenSource.Token).Wait();
            }
            finally
            {
                this.runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            bool result = base.OnStart();

            Trace.TraceInformation("MessageCreator has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("MessageCreator is stopping");

            this.cancellationTokenSource.Cancel();
            this.runCompleteEvent.WaitOne();

            base.OnStop();

            Trace.TraceInformation("MessageCreator has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            // TODO: Replace the following with your own logic.
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Write message to the Service Bus");

                string connectionString =
                    CloudConfigurationManager.GetSetting("SB.Rangers");

                // Configure Topic Settings
                TopicDescription td = new TopicDescription("TestTopic");
                td.MaxSizeInMegabytes = 5120;
                td.DefaultMessageTimeToLive = new TimeSpan(0, 1, 0);

                var namespaceManager =
                    NamespaceManager.CreateFromConnectionString(connectionString);

                if (!namespaceManager.TopicExists("TestTopic"))
                {
                    namespaceManager.CreateTopic(td);
                }

                if (!namespaceManager.SubscriptionExists("TestTopic", "SqlWriter"))
                {
                    // Create a "HighMessages" filtered subscription
                    SqlFilter processForSqlWriterFilter =
                       new SqlFilter("Process = 1");

                    namespaceManager.CreateSubscription("TestTopic",
                       "SqlWriter",
                       processForSqlWriterFilter);

                }
                if (!namespaceManager.SubscriptionExists("TestTopic", "AllMessages"))
                {
                    namespaceManager.CreateSubscription("TestTopic", "AllMessages");
                }


                TopicClient Client =
                    TopicClient.CreateFromConnectionString(connectionString, "TestTopic");

                var processId = Guid.NewGuid();

                var messageForSql = new BrokeredMessage("Hello, sql world!");
                messageForSql.Properties.Add("Process", 1);
                messageForSql.CorrelationId = processId.ToString('n');
                Client.Send(messageForSql);

                var messageForSomethingElse = new BrokeredMessage("Hello, not sql world!");
                messageForSomethingElse.Properties.Add("Process", 2);
                messageForSomethingElse.CorrelationId = processId.ToString('n');
                Client.Send(messageForSomethingElse);


                
                await Task.Delay(1000);
            }
        }
    }
}
