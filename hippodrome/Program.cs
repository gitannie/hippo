using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Configuration;
namespace hippodrome
{
    static class Program
    {
        /// <summary>
        /// Point d'entrée principal de l'application.
        /// </summary>
        [STAThread]
       
        static void Main()
        {

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Fgeneral());
        }
    }
}