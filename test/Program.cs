using System;
using System.Diagnostics;
using System.Reflection;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
#if NETFX461
            Console.WriteLine("AppContext.TargetFrameworkName                  : (not available in .NET Framework 4.6.1)");
#else
            Console.WriteLine("AppContext.TargetFrameworkName                  : {0}", AppContext.TargetFrameworkName);
#endif
            Console.WriteLine("Assembly.GetEntryAssembly().Location            : {0}", Assembly.GetEntryAssembly().Location);
            Console.WriteLine("AppContext.BaseDirectory                        : {0}", AppContext.BaseDirectory);
            Console.WriteLine("Environment.GetCommandLineArgs()[0]             : {0}", Environment.GetCommandLineArgs()[0]);
            Console.WriteLine("Environment.CurrentDirectory                    : {0}", Environment.CurrentDirectory);
            Console.WriteLine("Process.GetCurrentProcess().MainModule.FileName : {0}", Process.GetCurrentProcess().MainModule.FileName);
        }
    }
}
