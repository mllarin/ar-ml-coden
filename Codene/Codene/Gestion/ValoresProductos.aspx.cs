<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Objetos;

namespace Codene.Gestion
{
    public partial class ValoresProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nValor unValorN = new nValor();
                oValor unValorO = new oValor();

                string sError = unValorN.Buscar_Uno(ref unValorO);
                txtMiCodene.Text = unValorO.Verde.ToString();
                txtDeTercerosCodene.Text = unValorO.Amarillo.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            nValor unValorN = new nValor();
            oValor unValorO = new oValor();

            unValorO.Verde = decimal.Parse(txtMiCodene.Text.Replace('.', ','));
            unValorO.Amarillo = decimal.Parse(txtDeTercerosCodene.Text.Replace('.', ','));

            string sError = unValorN.Alta(ref unValorO);

            txtMiCodene.Text = unValorO.Verde.ToString();
            txtDeTercerosCodene.Text = unValorO.Amarillo.ToString();
        }
    }
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Objetos;

namespace Codene.Gestion
{
    public partial class ValoresProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nValor unValorN = new nValor();
                oValor unValorO = new oValor();

                string sError = unValorN.Buscar_Uno(ref unValorO);
                txtMiCodene.Text = unValorO.Verde.ToString();
                txtDeTercerosCodene.Text = unValorO.Amarillo.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            nValor unValorN = new nValor();
            oValor unValorO = new oValor();

            unValorO.Verde = decimal.Parse(txtMiCodene.Text.Replace('.', ','));
            unValorO.Amarillo = decimal.Parse(txtDeTercerosCodene.Text.Replace('.', ','));

            string sError = unValorN.Alta(ref unValorO);

            txtMiCodene.Text = unValorO.Verde.ToString();
            txtDeTercerosCodene.Text = unValorO.Amarillo.ToString();
        }
    }
>>>>>>> refs/remotes/origin/mllarin
}