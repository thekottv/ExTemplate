using ExTemplate.Model;
using ExTemplate.Windows;
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

namespace ExTemplate
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public static class Globals
        {
            public static string Role;
            public static string Name;
        }
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void BTN_LoginButton_Click(object sender, RoutedEventArgs e)
        {
            TBX_Login.IsEnabled = false;
            TBX_PWord.IsEnabled = false;
            BTN_LoginButton.IsEnabled = false;

            var CurrentUser = AppData.db.Users.FirstOrDefault(u => u.login == TBX_Login.Text && u.password == TBX_PWord.Password);
            if (CurrentUser != null)
            {
                Globals.Role = CurrentUser.Roles.RoleName;
                Globals.Name = CurrentUser.name;
                switch (CurrentUser.Roles.RoleName)
                {
                    case "Admin":
                        {
                            AdminWindow adminwindow = new AdminWindow();
                            adminwindow.Show();
                            this.Close();

                            break;
                        }
                    case "User":
                        {
                            UserWindow userwindow = new UserWindow();
                            userwindow.Show();
                            this.Close();

                            break;
                        }
                    case "Spectator":
                        {
                            SpecWindow specwindow = new SpecWindow();
                            specwindow.Show();
                            this.Close();

                            break;
                        }
                }
            }
            else
            {
                MessageBox.Show("Неправильный логин или пароль.");
                CaptchaGenerator();
            }
        }

        string captchaCode;
        private void CaptchaGenerator()
        {
            TBX_CaptchaEnter.Text = null;
            TB_Captchascreen.Text = null;
            captchaCode = null;

            TBX_Login.IsEnabled = false;
            TBX_PWord.IsEnabled = false;
            BTN_LoginButton.IsEnabled = false;

            Random random = new Random();
            string[] charlist = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };

            for (int i = 0; i < 6; i++)
            {
                captchaCode += charlist[random.Next(0, charlist.Length)];
            }

            TB_Captchascreen.Text = captchaCode;

            G_Captcha.Visibility = Visibility.Visible;
        }
        private void BTN_CaptchaEnter_Click(object sender, RoutedEventArgs e)
        {
            if (TBX_CaptchaEnter.Text == captchaCode)
            {
                TBX_Login.IsEnabled = true;
                TBX_PWord.IsEnabled = true;
                BTN_LoginButton.IsEnabled = true;
                G_Captcha.Visibility = Visibility.Hidden;
            }
            else
            {
                MessageBox.Show("Попробуйте еще раз.");
                CaptchaGenerator();
            }
        }
    }
}
