<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Objetos;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class dValor
    {
        Connection oCon = new Connection();

        public string Alta(ref oValor pE_Valor)
        {
            try
            {
                string[,] strParameters = { { "@pE_codeneVerde", pE_Valor.Verde.ToString().Replace(',', '.') },
                                            { "@pE_codeneAmarillo", pE_Valor.Amarillo.ToString().Replace(',', '.')},
                                            { "@pE_codeneRojo", pE_Valor.Rojo.ToString().Replace(',', '.')}};

                oCon.ExecNonQuery("web_Valores_Alta", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Buscar_Uno(ref oValor pS_Valor)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                dr = oCon.ExecReader("web_Valores_Buscar", CommandType.StoredProcedure);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Valor.Verde = Convert.ToDecimal(dr["codeneVerde"].ToString());
                        pS_Valor.Amarillo = Convert.ToDecimal(dr["codeneAmarillo"].ToString());
                        pS_Valor.Rojo = Convert.ToDecimal(dr["codeneRojo"].ToString());
                    }
                }
                else
                {
                    throw new Exception("El valor seleccionado no existe");
                }

                dr.Close();
                dr = null;
            }
            catch (Exception ex)
            {
                sError = ex.Message;
            }

            return sError;

        }
    }
}
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Objetos;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class dValor
    {
        Connection oCon = new Connection();

        public string Alta(ref oValor pE_Valor)
        {
            try
            {
                string[,] strParameters = { { "@pE_codeneVerde", pE_Valor.Verde.ToString().Replace(',', '.') },
                                            { "@pE_codeneAmarillo", pE_Valor.Amarillo.ToString().Replace(',', '.')},
                                            { "@pE_codeneRojo", pE_Valor.Rojo.ToString().Replace(',', '.')}};

                oCon.ExecNonQuery("web_Valores_Alta", CommandType.StoredProcedure, strParameters);

                return "";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Buscar_Uno(ref oValor pS_Valor)
        {
            string sError = "";
            try
            {
                SqlDataReader dr = null;

                dr = oCon.ExecReader("web_Valores_Buscar", CommandType.StoredProcedure);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        pS_Valor.Verde = Convert.ToDecimal(dr["codeneVerde"].ToString());
                        pS_Valor.Amarillo = Convert.ToDecimal(dr["codeneAmarillo"].ToString());
                        pS_Valor.Rojo = Convert.ToDecimal(dr["codeneRojo"].ToString());
                    }
                }
                else
                {
                    throw new Exception("El valor seleccionado no existe");
                }

                dr.Close();
                dr = null;
            }
            catch (Exception ex)
            {
                sError = ex.Message;
            }

            return sError;

        }
    }
}
>>>>>>> refs/remotes/origin/mllarin
