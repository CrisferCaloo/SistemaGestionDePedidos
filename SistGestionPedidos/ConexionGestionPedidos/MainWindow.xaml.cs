using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ConexionGestionPedidos
{
   
    public partial class MainWindow : Window
    {
        //1ra clase a usar: SqlConnection 
        SqlConnection miConexionSql;//campo de clase


        public MainWindow() //Metodo MAIN
        {
            InitializeComponent();
            //Establecer cadena de conexion desde la aplicacion grafica   con la B/D
            string miConexion = ConfigurationManager.ConnectionStrings["ConexionGestionPedidos.Properties.Settings.GestionPedidosConnectionString"].ConnectionString;

            //conectar con nuestro origen de datos
            //rescatar la informacion que hay en la tabla CLIENTES, campo Nombre
            //llevarla a la lista

            miConexionSql = new SqlConnection(miConexion);
            muestraClientes();
        }

        private void muestraClientes()
        {
            string consulta ="select * from cliente";

            SqlDataAdapter miAdaptadorSql = new SqlDataAdapter(consulta, miConexionSql);

            using (miAdaptadorSql)
            {
                DataTable clientesTabla = new DataTable();

                miAdaptadorSql.Fill(clientesTabla);
                listaClientes.DisplayMemberPath = "nombre";
                listaClientes.SelectedValuePath = "id_cliente";
                listaClientes.ItemsSource = clientesTabla.DefaultView;
            }
        }

        private void listaClientes_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MessageBox.Show("Has dado clic en un cliente");
        }
    }
}
