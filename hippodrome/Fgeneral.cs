using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace hippodrome
{
    public partial class Fgeneral : Form
    {
        public Fgeneral()
        {
            InitializeComponent();
        }
        // on déclare un objet de la classe LienBdd
        internal LienBdd uneCn;
        private DataTable dt= new DataTable();
        private int i=0;
        private int noLigne;
        private void Fgeneral_Load(object sender, EventArgs e)
        {
            // connection à la bdd hippo sous sqlserver
            uneCn = new LienBdd();
        }
        // ***************************** onglet Cheval **************************************

        
// ***************************** onglet Courses **************************************
        private void tabCourse_Enter(object sender, EventArgs e)
        {
            try
            {
                // remplissage de la data grid view
                dt = uneCn.ObtenirCourses();  // on appelle la méthode ObtenirCourses de la classe LienBdd
                this.dgCourses.DataSource = dt;
                this.dgCourses.DataMember = dt.TableName;
                this.dgCourses.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }  
        }

          private void dgCourses_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            noLigne = e.RowIndex;// n° de la ligne sélectionnée dans le dataGridView     
            this.dgCourses.SelectionMode = DataGridViewSelectionMode.FullRowSelect; // oblige la sélection pleine ligne
            // on remplit les textbox avec le contenu de la ligne sélectionné     
            this.tbIdCourse.Text=this.dgCourses[0,noLigne].Value.ToString();
            this.tbHippodrome.Text = this.dgCourses[1, noLigne].Value.ToString();
            this.tbDate.Text=this.dgCourses[2, noLigne].Value.ToString();
            this.tbDistance.Text=this.dgCourses[3, noLigne].Value.ToString();
          
        }
       
        private void btModifierCourse_Click(object sender, EventArgs e)
        {
            //modifie dans la DataTable puis sauve ds la Bdd
            uneCn.MajCourse(noLigne, this.tbHippodrome.Text, DateTime.Parse( this.tbDate.Text),int.Parse(this.tbDistance.Text));
        }

        private void btAjoutCourse_Click(object sender, EventArgs e)
        {

        }              
     }       
    }

