﻿using System.Web.UI.WebControls;

namespace Resto_Web
{
    public static class Validacion
    {
        public static bool validaTextoVacio(object control)
        {
            if (control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                    return true;
                else
                    return false;

            }
            return false;
        }

    }
}
