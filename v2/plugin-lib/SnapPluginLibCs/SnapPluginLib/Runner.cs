﻿using System;
using System.Runtime.InteropServices;

namespace SnapPluginLib
{
    public static class Runner
    {
        public static PluginBase _collector;

        private delegate void DefineHandler();

        private delegate void CollectHandler(string taskId);

        private delegate void LoadHandler(string taskId);

        private delegate void UnloadHandler(string taskId);

        private static void DefineHandlerFn()
        {
            _collector.DefinePlugin();
        }

        private static void CollectHandlerFn(string taskId)
        {
            _collector.Collect();
        }

        private static void LoadHandlerFn(string taskId)
        {
            _collector.Load();
        }

        private static void UnloadHandlerFn(string taskId)
        {
            _collector.Unload();
        }

        [DllImport("plugin-lib.dll", CharSet = CharSet.Ansi, SetLastError = true)]
        private static extern void start_collector(
            CollectHandler collectHandler,
            LoadHandler loadHandler,
            UnloadHandler unloadHandler,
            DefineHandler defineHandler,
            string name,
            string version
        );

        public static void StartCollector(PluginBase collector)
        {
            _collector = collector;

            start_collector(
                CollectHandlerFn, LoadHandlerFn, UnloadHandlerFn, DefineHandlerFn,
                collector.Name, collector.Version);
        }
    }
}