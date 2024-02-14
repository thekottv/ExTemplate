using BarcodeStandard;
using SkiaSharp;

private BitmapImage GenerateBarcode(string digicode)
{
    ///Генерирует крутой баркод
    ///IMG_Bar.ImageSource = GenerateBarcode(TBX_BAR.Text);
    ///LB_Bar_Code.Content = TBX_BAR.Text; //строчка под баркодом
    BarcodeStandard.Barcode barcode = new BarcodeStandard.Barcode()
    {
        IncludeLabel = false, //true
        Alignment = AlignmentPositions.Center,
        Width = 370,
        Height = 45,
        BackColor = SkiaSharp.SKColor.Parse("#fafafa"),
        ForeColor = SkiaSharp.SKColor.Parse("#222222"),
    };
    var img = barcode.Encode(BarcodeStandard.Type.Code39, digicode).Encode().AsStream(); // Магия превращения SKImage в Stream
    BitmapImage barcodeBmp = ImageConverter.StreamToImage(img);                         // И потом в BitmapImage
    return barcodeBmp;
}

private string ReturnActualBarcode()
{
    ///Генерирует строчку баркода
    ///LB_BAR_Tip.Content = ReturnActualBarcode();
    string datepart = DateTime.Today.Day.ToString("00") +
          DateTime.Today.Month.ToString("00") +
          DateTime.Today.Year.ToString("00");
    string idpart = (lab20Entities.GetContext().order.ToList().Last().ID + 1).ToString("000000"); // Определение в скобках позволит получить ID последнего айтема в таблице, увеличенный на 1.
    string contatenatedbar = datepart + idpart;

    return contatenatedbar;
}
private void BTN_GenerateBar_Click(object sender, RoutedEventArgs e)
{
    TBX_BAR.Text = ReturnActualBarcode();
}