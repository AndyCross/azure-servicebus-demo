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
using Microsoft.ServiceBus.Messaging;

namespace SQLWriter
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent runCompleteEvent = new ManualResetEvent(false);

        public override void Run()
        {
            Trace.TraceInformation("SQLWriter is running");

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

            Trace.TraceInformation("SQLWriter has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("SQLWriter is stopping");

            this.cancellationTokenSource.Cancel();
            this.runCompleteEvent.WaitOne();

            base.OnStop();

            Trace.TraceInformation("SQLWriter has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            // TODO: Replace the following with your own logic.
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Working");

                var connectionString = CloudConfigurationManager.GetSetting("SB.Rangers.ReadOnly");

                var subscriptionClient = SubscriptionClient.CreateFromConnectionString(connectionString, "TestTopic", "SqlWriter");

                var message = subscriptionClient.Receive();

                if (message != null)
                {
                    try
                    {
                        Trace.TraceInformation(message.GetBody<string>());
                        Trace.TraceInformation(message.CorrelationId);

                        message.Complete();
                    }
                    catch
                    {
                        if (message.DeliveryCount > 3)
                        {
                            message.DeadLetter();
                        }
                        else
                        {
                            message.Abandon();
                        }
                    }
                }

            }
        }
    }
}
