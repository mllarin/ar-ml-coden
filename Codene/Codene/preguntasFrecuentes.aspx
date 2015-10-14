<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="preguntasFrecuentes.aspx.cs" Inherits="Codene.preguntasFrecuentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">--%>
    <%--<script src="Scripts/jquery-1.8.2.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <%--<section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h3>Preguntas Frecuentes</h3>
            </hgroup>
        </div>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Preguntas Frecuentes</h2>
    <div id="accordion">
        <h3>&iquest;Qu&eacute; es Codene?</h3>
        <div>
            <p>Codene clearing de cr&eacute;ditos, es una empresa privada que brinda servicios de informaci&oacute;n crediticia y gesti&oacute;n de cobranzas. La base de datos de Codene permite que las empresas puedan consultar los movimientos crediticios de sus clientes y observar sus condiciones y compromisos de pago.</p>
        </div>

        <h3>&iquest;Quienes est&aacute;n en la base de datos de Codene?</h3>
        <div>
            <p>Nuestra base de datos esta conformada por personas f&iacute;sicas y jur&iacute;dicas que est&aacute;n en condiciones de formar parte de la poblaci&oacute;n econ&oacute;micamente activa.</p>
        </div>

        <h3>&iquest;Qu&eacute; es un informe de cr&eacute;dito?</h3>
        <div>
            <p>
                El informe de cr&eacute;dito es una herramienta favorable para el desarrollo de la actividad econ&oacute;mica del pa&iacute;s. 
Su funci&oacute;n es proteger al consumidor evitando que contraiga m&aacute;s obligaciones de las que realmente est&aacute;n en condiciones de afrontar. 
Protege a su vez a las empresas de las personas que su poder adquisitivo no les permiten endeudarse y se exceden de sus solicitudes de cr&eacute;dito, que luego no est&aacute;n en condiciones de cumplir con los compromisos de pago.
            </p>
        </div>

        <h3>&iquest;C&oacute;mo puedo recibir informaci&oacute;n sobre mi situaci&oacute;n en Codene?</h3>
        <div>
            <p>Acerc&aacute;ndose con su DNI a nuestras oficinas en Neuqu&eacute;n Capital o en la ciudad de Trelew, provincia de Chubut y solicitar informaci&oacute;n personalmente. Codene no otorga informaci&oacute;n a terceras personas. Ley 25.326 de Habeas Data. </p>
        </div>

        <h3>&iquest;Qu&eacute; es un libre deuda de Codene?</h3>
        <div>
            <p>Un libre deuda de Codene es un documento que sirve para comprobar que el solicitante de cr&eacute;ditos no mantienen deuda con ninguna de las empresas adheridas al sistema de Codene. Este documento tiene validez por 10 d&iacute;as y podr&aacute; ser presentado en el comercio que lo requiera.</p>
        </div>

        <h3>&iquest;C&oacute;mo actualizo mis datos?</h3>
        <div>
            <p>Usted podr&aacute; actualizar sus datos acerc&aacute;ndose a nuestras oficinas en Neuqu&eacute;n Capital o en la Ciudad de Trelew, provincia de Chubut, ingresando a nuestra pagina Web o simplemente enviando sus datos a nuestro email codene@ciudad.com.ar.</p>
        </div>

        <h3>&iquest;C&oacute;mo se hace para salir de Codene?</h3>
        <div>
            <p>Si usted mantiene mora con alguna empresa adherida al sistema Codene, deber&aacute; presentarse en la misma y regularizar su deuda.</p>
            <br />
            <p>Una vez cancelada, el mismo comercio ingresar&aacute; a la pagina de Codene e inmediatamente dar&aacute; de baja su mora.</p>
        </div>

        <h3>&iquest;Una vez cancelada mi deuda por cuanto tiempo figuro en Codene?</h3>
        <div>
            <p>La ley 25.326 (Habeas Data) y la Direcci&oacute;n Nacional de Protecci&oacute;n de datos personales, establecen el tiempo en el que deben permanecer los antecedentes en las bases de datos. Para aquellas deudas que han sido canceladas la condici&oacute;n permanecer&aacute; por 2 (dos) años a partir de la fecha de cancelaci&oacute;n que se registra. </p>
        </div>

        <h3>&iquest;Qu&eacute; puedo hacer si pierdo mi DNI?</h3>
        <div>
            <p>Si usted tiene alg&uacute;n problema con su DNI, deber&aacute; realizar la denuncia correspondiente en el destacamento policial m&aacute;s cercano a su domicilio. Una vez efectuado el tr&aacute;mite podr&aacute; informarlo enviando una copia de la denuncia a Codene como medida preventiva de futuros fraudes.</p>
        </div>

        <h3>&iquest;Qu&eacute; es el Habeas Data?</h3>
        <div>
            <p>El Habeas Data es la ley 25.326 de Protecci&oacute;n de datos personales sancionada en el año 2000. Dicha ley tiene por objeto la protecci&oacute;n integral de los datos personales asentados en archivos, registros, bancos de datos, u otros medios t&eacute;cnicos de tratamiento de datos, sean &eacute;stos p&uacute;blicos, o privados destinados a dar informes, para garantizar el derecho al honor y a la intimidad de las personas, as&iacute; como tambi&eacute;n el acceso a la informaci&oacute;n que sobre las mismas se registre, de conformidad a lo establecido en el art&iacute;culo 43, p&aacute;rrafo tercero de la Constituci&oacute;n Nacional.</p>
        </div>

        <h3>&iquest;Es obligaci&oacute;n del comerciante informar la deuda al cliente?</h3>
        <div>
            <p>No existe ning&uacute;n reglamento cuando se trata de t&iacute;tulos ejecutivos de informar extrajudicialmente los compromisos al deudor.</p>
            <br />
            <p>El solicitante de cr&eacute;dito sabe expl&iacute;citamente de su compromiso el cual deber&aacute; cumplirlo seg&uacute;n las fechas establecidas por ambas partes. En caso contrario el acredor decidir&aacute; intimar o no, las deudas en los plazos correspondientes a los atrasos de pago.</p>
        </div>

        <h3>&iquest;Cuanto tiempo debe permanecer mi deuda en el sistema?</h3>
        <div>
            <p>Seg&uacute;n lo establecido por el art&iacute;culo 26 inciso 4 de la ley de Habeas Data, las deudas permanecer&aacute;n en la base de datos por cinco años desde la fecha que ingreso al sistema.</p>
        </div>
    </div>
    <link href="Content/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui-1.8.24.js"></script>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>--%>
    <script type="text/javascript">
        $(function () {
            $("#accordion").accordion();
        });
    </script>
</asp:Content>
