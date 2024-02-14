using ExTemplate.Model;
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
using System.Windows.Shapes;

namespace ExTemplate.Windows
{
    /// <summary>
    /// Логика взаимодействия для SpecWindow.xaml
    /// </summary>
    public partial class SpecWindow : Window
    {
        public SpecWindow()
        {
            InitializeComponent();

            TB_User.Text = $"Здравствуйте, {LoginWindow.Globals.Name}!";
            TB_Role.Text = $"Ваша роль: {LoginWindow.Globals.Role}";

            DGrid_Requests.ItemsSource = extemplateEntities.GetContext().Somedata.ToList();
            DataContext = extemplateEntities.GetContext();
        }

        private void BTN_ChangeUser_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
