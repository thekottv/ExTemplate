private static bool IsTextAllowed(string Text, string AllowedRegex) // Handling wrong symbols in textboxes to prevent type conflicts
{
    try
    {
        var regex = new Regex(AllowedRegex);
        return !regex.IsMatch(Text);
    }
    catch
    {
        return true;
    }
}

private void TBX_BAR_PreviewTextInput(object sender, TextCompositionEventArgs e)
{
    e.Handled = IsTextAllowed(e.Text, "^[0-9]+$"); //symbol restriction
    e.Handled = TBX_BAR.Text.Length > 13; //length restriction
}