require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLoja_svg()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmLoja_svg");
    obj:setAlign("client");
    obj:setMargins({top=1});
    obj:setTheme("light");

    obj.ApresentaLoja = GUI.fromHandle(_obj_newObject("layout"));
    obj.ApresentaLoja:setParent(obj);
    obj.ApresentaLoja:setName("ApresentaLoja");
    obj.ApresentaLoja:setAlign("client");
    obj.ApresentaLoja:setVisible(true);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.ApresentaLoja);
    obj.image1:setSRC("images/BoasVindas.png");
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(652);
    obj.image1:setHeight(230);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.ApresentaLoja);
    obj.image2:setLeft(90.25);
    obj.image2:setTop(96.38);
    obj.image2:setWidth(155.25);
    obj.image2:setHeight(45.75);
    obj.image2:setCursor("handPoint");
    obj.image2:setHitTest(true);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.ApresentaLoja);
    obj.image3:setLeft(267.25);
    obj.image3:setTop(96.38);
    obj.image3:setWidth(141);
    obj.image3:setHeight(45.75);
    obj.image3:setCursor("handPoint");
    obj.image3:setHitTest(true);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.ApresentaLoja);
    obj.image4:setLeft(431.25);
    obj.image4:setTop(96.38);
    obj.image4:setWidth(123.25);
    obj.image4:setHeight(45.75);
    obj.image4:setCursor("handPoint");
    obj.image4:setHitTest(true);
    obj.image4:setName("image4");

    obj.LojaDeArmas = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaDeArmas:setParent(obj);
    obj.LojaDeArmas:setName("LojaDeArmas");
    obj.LojaDeArmas:setAlign("client");
    obj.LojaDeArmas:setVisible(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.LojaDeArmas);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setText("reset");
    obj.button1:setLeft(303);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setText("ADD");
    obj.button2:setLeft(303);
    obj.button2:setTop(20);
    obj.button2:setName("button2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout1);
    obj.image5:setSRC("images/dinheiroArma.png");
    obj.image5:setLeft(0);
    obj.image5:setTop(5);
    obj.image5:setWidth(180.37);
    obj.image5:setHeight(80.25);
    obj.image5:setName("image5");

    obj.labSoma2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma2:setParent(obj.layout1);
    obj.labSoma2:setLeft(26);
    obj.labSoma2:setTop(30);
    lfm_setPropAsString(obj.labSoma2, "fontStyle",  "bold");
    obj.labSoma2:setFontColor("white");
    obj.labSoma2:setFontSize(35);
    obj.labSoma2:setAutoSize(true);
    obj.labSoma2:setWordWrap(false);
    obj.labSoma2:setName("labSoma2");
    obj.labSoma2:setCursor("handPoint");
    obj.labSoma2:setHitTest(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.labSoma2);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox1);
    obj.image6:setLeft(0);
    obj.image6:setTop(0);
    obj.image6:setWidth(130.37);
    obj.image6:setHeight(62.25);
    obj.image6:setHint("Seu dinheiro");
    obj.image6:setCursor("handPoint");
    obj.image6:setHitTest(true);
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setSRC("images/botaoVoltar.png");
    obj.image7:setLeft(200);
    obj.image7:setTop(29);
    obj.image7:setWidth(50);
    obj.image7:setHeight(50);
    obj.image7:setCursor("handPoint");
    obj.image7:setHint("Clique aqui para voltar");
    obj.image7:setHitTest(true);
    obj.image7:setName("image7");

    obj.Arma1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma1:setParent(obj.scrollBox1);
    obj.Arma1:setName("Arma1");
    obj.Arma1:setWidth(480);
    obj.Arma1:setHeight(174);
    obj.Arma1:setLeft(0);
    obj.Arma1:setTop(88);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.Arma1);
    obj.image8:setSRC("images/Loja.png");
    obj.image8:setLeft(0);
    obj.image8:setTop(0);
    obj.image8:setWidth(399);
    obj.image8:setHeight(174);
    obj.image8:setName("image8");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.Arma1);
    obj.label1:setLeft(22.25);
    obj.label1:setTop(20.50);
    obj.label1:setWidth(107.25);
    obj.label1:setHeight(37.88);
    obj.label1:setFontSize(22);
    obj.label1:setHint("Preço da Arma");
    obj.label1:setField("Preco");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("yellow");
    obj.label1:setFontFamily("kalam");
    obj.label1:setCursor("handPoint");
    obj.label1:setHitTest(true);
    obj.label1:setName("label1");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.Arma1);
    obj.image9:setLeft(41.38);
    obj.image9:setTop(61.75);
    obj.image9:setWidth(67.88);
    obj.image9:setHeight(30);
    obj.image9:setCursor("handPoint");
    obj.image9:setHitTest(true);
    obj.image9:setHint("Clique aqui para comprar");
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.Arma1);
    obj.image10:setLeft(2.56);
    obj.image10:setTop(93.00);
    obj.image10:setWidth(136.69);
    obj.image10:setHeight(77.69);
    obj.image10:setStyle("proportional");
    obj.image10:setCenter(true);
    obj.image10:setEditable(true);
    obj.image10:setField("ImagemArma");
    obj.image10:setName("image10");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.Arma1);
    obj.label2:setLeft(197);
    obj.label2:setTop(10);
    obj.label2:setWidth(249.25);
    obj.label2:setHeight(39);
    obj.label2:setFontSize(22);
    obj.label2:setField("ItemNome");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("black");
    obj.label2:setFontFamily("kalam");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.Arma1);
    obj.label3:setLeft(207.88);
    obj.label3:setTop(51);
    obj.label3:setWidth(49.88);
    obj.label3:setHeight(31.38);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("Iniciativa");
    obj.label3:setFontSize(19);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("black");
    obj.label3:setFontFamily("kalam");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.Arma1);
    obj.label4:setLeft(182.88);
    obj.label4:setTop(90);
    obj.label4:setWidth(50.88);
    obj.label4:setHeight(31.38);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("DanoItem");
    obj.label4:setFontSize(19);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("black");
    obj.label4:setFontFamily("kalam");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.Arma1);
    obj.label5:setLeft(195.88);
    obj.label5:setTop(128);
    obj.label5:setWidth(50.88);
    obj.label5:setHeight(32);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("Alcance");
    obj.label5:setFontSize(15);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("black");
    obj.label5:setFontFamily("kalam");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.Arma1);
    obj.label6:setLeft(317.88);
    obj.label6:setTop(49);
    obj.label6:setWidth(68.88);
    obj.label6:setHeight(32);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setField("Cadencia");
    obj.label6:setFontSize(19);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("black");
    obj.label6:setFontFamily("kalam");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.Arma1);
    obj.label7:setLeft(317.88);
    obj.label7:setTop(89);
    obj.label7:setWidth(68.88);
    obj.label7:setHeight(32);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("Municao");
    obj.label7:setFontSize(19);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontColor("black");
    obj.label7:setFontFamily("kalam");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.Arma1);
    obj.label8:setLeft(317.88);
    obj.label8:setTop(125);
    obj.label8:setWidth(48.12);
    obj.label8:setHeight(32);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setField("ClasseDeDureza");
    obj.label8:setFontSize(19);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontColor("black");
    obj.label8:setFontFamily("kalam");
    obj.label8:setName("label8");

    obj.Arma2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma2:setParent(obj.scrollBox1);
    obj.Arma2:setName("Arma2");
    obj.Arma2:setWidth(480);
    obj.Arma2:setHeight(174);
    obj.Arma2:setLeft(0);
    obj.Arma2:setTop(270);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.Arma2);
    obj.image11:setSRC("images/Loja.png");
    obj.image11:setLeft(0);
    obj.image11:setTop(0);
    obj.image11:setWidth(399);
    obj.image11:setHeight(174);
    obj.image11:setName("image11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.Arma2);
    obj.label9:setLeft(22.25);
    obj.label9:setTop(20.50);
    obj.label9:setWidth(107.25);
    obj.label9:setHeight(37.88);
    obj.label9:setFontSize(22);
    obj.label9:setHint("Preço da Arma");
    obj.label9:setField("Preco2");
    obj.label9:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontColor("yellow");
    obj.label9:setFontFamily("kalam");
    obj.label9:setCursor("handPoint");
    obj.label9:setHitTest(true);
    obj.label9:setName("label9");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.Arma2);
    obj.image12:setLeft(41.38);
    obj.image12:setTop(61.75);
    obj.image12:setWidth(67.88);
    obj.image12:setHeight(30);
    obj.image12:setCursor("handPoint");
    obj.image12:setHitTest(true);
    obj.image12:setHint("Clique aqui para comprar");
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.Arma2);
    obj.image13:setLeft(2.56);
    obj.image13:setTop(93.00);
    obj.image13:setWidth(136.69);
    obj.image13:setHeight(77.69);
    obj.image13:setStyle("proportional");
    obj.image13:setCenter(true);
    obj.image13:setEditable(true);
    obj.image13:setField("ImagemArma2");
    obj.image13:setName("image13");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.Arma2);
    obj.label10:setLeft(197);
    obj.label10:setTop(10);
    obj.label10:setWidth(249.25);
    obj.label10:setHeight(39);
    obj.label10:setFontSize(22);
    obj.label10:setField("ItemNome2");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontColor("black");
    obj.label10:setFontFamily("kalam");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.Arma2);
    obj.label11:setLeft(207.88);
    obj.label11:setTop(51);
    obj.label11:setWidth(49.88);
    obj.label11:setHeight(31.38);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setField("Iniciativa2");
    obj.label11:setFontSize(19);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontColor("black");
    obj.label11:setFontFamily("kalam");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.Arma2);
    obj.label12:setLeft(182.88);
    obj.label12:setTop(90);
    obj.label12:setWidth(50.88);
    obj.label12:setHeight(31.38);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setField("DanoItem2");
    obj.label12:setFontSize(19);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setFontColor("black");
    obj.label12:setFontFamily("kalam");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.Arma2);
    obj.label13:setLeft(195.88);
    obj.label13:setTop(128);
    obj.label13:setWidth(50.88);
    obj.label13:setHeight(32);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("Alcance2");
    obj.label13:setFontSize(15);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontColor("black");
    obj.label13:setFontFamily("kalam");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.Arma2);
    obj.label14:setLeft(317.88);
    obj.label14:setTop(49);
    obj.label14:setWidth(68.88);
    obj.label14:setHeight(32);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setField("Cadencia2");
    obj.label14:setFontSize(19);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setFontColor("black");
    obj.label14:setFontFamily("kalam");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.Arma2);
    obj.label15:setLeft(317.88);
    obj.label15:setTop(89);
    obj.label15:setWidth(68.88);
    obj.label15:setHeight(32);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setField("Municao2");
    obj.label15:setFontSize(19);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setFontColor("black");
    obj.label15:setFontFamily("kalam");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.Arma2);
    obj.label16:setLeft(317.88);
    obj.label16:setTop(125);
    obj.label16:setWidth(48.12);
    obj.label16:setHeight(32);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("ClasseDeDureza2");
    obj.label16:setFontSize(19);
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setFontColor("black");
    obj.label16:setFontFamily("kalam");
    obj.label16:setName("label16");

    obj.Arma3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma3:setParent(obj.scrollBox1);
    obj.Arma3:setName("Arma3");
    obj.Arma3:setWidth(480);
    obj.Arma3:setHeight(174);
    obj.Arma3:setLeft(0);
    obj.Arma3:setTop(452);

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.Arma3);
    obj.image14:setSRC("images/Loja.png");
    obj.image14:setLeft(0);
    obj.image14:setTop(0);
    obj.image14:setWidth(399);
    obj.image14:setHeight(174);
    obj.image14:setName("image14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.Arma3);
    obj.label17:setLeft(22.25);
    obj.label17:setTop(20.50);
    obj.label17:setWidth(107.25);
    obj.label17:setHeight(37.88);
    obj.label17:setFontSize(22);
    obj.label17:setHint("Preço da Arma");
    obj.label17:setField("Preco3");
    obj.label17:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setFontColor("yellow");
    obj.label17:setFontFamily("kalam");
    obj.label17:setCursor("handPoint");
    obj.label17:setHitTest(true);
    obj.label17:setName("label17");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.Arma3);
    obj.image15:setLeft(41.38);
    obj.image15:setTop(61.75);
    obj.image15:setWidth(67.88);
    obj.image15:setHeight(30);
    obj.image15:setCursor("handPoint");
    obj.image15:setHitTest(true);
    obj.image15:setHint("Clique aqui para comprar");
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.Arma3);
    obj.image16:setLeft(2.56);
    obj.image16:setTop(93.00);
    obj.image16:setWidth(136.69);
    obj.image16:setHeight(77.69);
    obj.image16:setStyle("proportional");
    obj.image16:setCenter(true);
    obj.image16:setEditable(true);
    obj.image16:setField("ImagemArma3");
    obj.image16:setName("image16");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.Arma3);
    obj.label18:setLeft(197);
    obj.label18:setTop(10);
    obj.label18:setWidth(249.25);
    obj.label18:setHeight(39);
    obj.label18:setFontSize(22);
    obj.label18:setField("ItemNome3");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setFontColor("black");
    obj.label18:setFontFamily("kalam");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.Arma3);
    obj.label19:setLeft(207.88);
    obj.label19:setTop(51);
    obj.label19:setWidth(49.88);
    obj.label19:setHeight(31.38);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setField("Iniciativa3");
    obj.label19:setFontSize(19);
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setFontColor("black");
    obj.label19:setFontFamily("kalam");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.Arma3);
    obj.label20:setLeft(182.88);
    obj.label20:setTop(90);
    obj.label20:setWidth(50.88);
    obj.label20:setHeight(31.38);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("DanoItem3");
    obj.label20:setFontSize(19);
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setFontColor("black");
    obj.label20:setFontFamily("kalam");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.Arma3);
    obj.label21:setLeft(195.88);
    obj.label21:setTop(128);
    obj.label21:setWidth(50.88);
    obj.label21:setHeight(32);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("Alcance3");
    obj.label21:setFontSize(15);
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setFontColor("black");
    obj.label21:setFontFamily("kalam");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.Arma3);
    obj.label22:setLeft(317.88);
    obj.label22:setTop(49);
    obj.label22:setWidth(68.88);
    obj.label22:setHeight(32);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setField("Cadencia3");
    obj.label22:setFontSize(19);
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setFontColor("black");
    obj.label22:setFontFamily("kalam");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.Arma3);
    obj.label23:setLeft(317.88);
    obj.label23:setTop(89);
    obj.label23:setWidth(68.88);
    obj.label23:setHeight(32);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("Municao3");
    obj.label23:setFontSize(19);
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setFontColor("black");
    obj.label23:setFontFamily("kalam");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.Arma3);
    obj.label24:setLeft(317.88);
    obj.label24:setTop(125);
    obj.label24:setWidth(48.12);
    obj.label24:setHeight(32);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("ClasseDeDureza3");
    obj.label24:setFontSize(19);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setFontColor("black");
    obj.label24:setFontFamily("kalam");
    obj.label24:setName("label24");

    obj.Arma4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma4:setParent(obj.scrollBox1);
    obj.Arma4:setName("Arma4");
    obj.Arma4:setWidth(480);
    obj.Arma4:setHeight(174);
    obj.Arma4:setLeft(0);
    obj.Arma4:setTop(634);

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.Arma4);
    obj.image17:setSRC("images/Loja.png");
    obj.image17:setLeft(0);
    obj.image17:setTop(0);
    obj.image17:setWidth(399);
    obj.image17:setHeight(174);
    obj.image17:setName("image17");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.Arma4);
    obj.label25:setLeft(22.25);
    obj.label25:setTop(20.50);
    obj.label25:setWidth(107.25);
    obj.label25:setHeight(37.88);
    obj.label25:setFontSize(22);
    obj.label25:setHint("Preço da Arma");
    obj.label25:setField("Preco4");
    obj.label25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setFontColor("yellow");
    obj.label25:setFontFamily("kalam");
    obj.label25:setCursor("handPoint");
    obj.label25:setHitTest(true);
    obj.label25:setName("label25");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.Arma4);
    obj.image18:setLeft(41.38);
    obj.image18:setTop(61.75);
    obj.image18:setWidth(67.88);
    obj.image18:setHeight(30);
    obj.image18:setCursor("handPoint");
    obj.image18:setHitTest(true);
    obj.image18:setHint("Clique aqui para comprar");
    obj.image18:setName("image18");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.Arma4);
    obj.image19:setLeft(2.56);
    obj.image19:setTop(93.00);
    obj.image19:setWidth(136.69);
    obj.image19:setHeight(77.69);
    obj.image19:setStyle("proportional");
    obj.image19:setCenter(true);
    obj.image19:setEditable(true);
    obj.image19:setField("ImagemArma4");
    obj.image19:setName("image19");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.Arma4);
    obj.label26:setLeft(197);
    obj.label26:setTop(10);
    obj.label26:setWidth(249.25);
    obj.label26:setHeight(39);
    obj.label26:setFontSize(22);
    obj.label26:setField("ItemNome4");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setFontColor("black");
    obj.label26:setFontFamily("kalam");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.Arma4);
    obj.label27:setLeft(207.88);
    obj.label27:setTop(51);
    obj.label27:setWidth(49.88);
    obj.label27:setHeight(31.38);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("Iniciativa4");
    obj.label27:setFontSize(19);
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setFontColor("black");
    obj.label27:setFontFamily("kalam");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.Arma4);
    obj.label28:setLeft(182.88);
    obj.label28:setTop(90);
    obj.label28:setWidth(50.88);
    obj.label28:setHeight(31.38);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("DanoItem4");
    obj.label28:setFontSize(19);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setFontColor("black");
    obj.label28:setFontFamily("kalam");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.Arma4);
    obj.label29:setLeft(195.88);
    obj.label29:setTop(128);
    obj.label29:setWidth(50.88);
    obj.label29:setHeight(32);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setField("Alcance4");
    obj.label29:setFontSize(15);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setFontColor("black");
    obj.label29:setFontFamily("kalam");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.Arma4);
    obj.label30:setLeft(317.88);
    obj.label30:setTop(49);
    obj.label30:setWidth(68.88);
    obj.label30:setHeight(32);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("Cadencia4");
    obj.label30:setFontSize(19);
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setFontColor("black");
    obj.label30:setFontFamily("kalam");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.Arma4);
    obj.label31:setLeft(317.88);
    obj.label31:setTop(89);
    obj.label31:setWidth(68.88);
    obj.label31:setHeight(32);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("Municao4");
    obj.label31:setFontSize(19);
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setFontColor("black");
    obj.label31:setFontFamily("kalam");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.Arma4);
    obj.label32:setLeft(317.88);
    obj.label32:setTop(125);
    obj.label32:setWidth(48.12);
    obj.label32:setHeight(32);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("ClasseDeDureza4");
    obj.label32:setFontSize(19);
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setFontColor("black");
    obj.label32:setFontFamily("kalam");
    obj.label32:setName("label32");

    obj.Arma5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma5:setParent(obj.scrollBox1);
    obj.Arma5:setName("Arma5");
    obj.Arma5:setWidth(480);
    obj.Arma5:setHeight(174);
    obj.Arma5:setLeft(0);
    obj.Arma5:setTop(816);

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.Arma5);
    obj.image20:setSRC("images/Loja.png");
    obj.image20:setLeft(0);
    obj.image20:setTop(0);
    obj.image20:setWidth(399);
    obj.image20:setHeight(174);
    obj.image20:setName("image20");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.Arma5);
    obj.label33:setLeft(22.25);
    obj.label33:setTop(20.50);
    obj.label33:setWidth(107.25);
    obj.label33:setHeight(37.88);
    obj.label33:setFontSize(22);
    obj.label33:setHint("Preço da Arma");
    obj.label33:setField("Preco5");
    obj.label33:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setFontColor("yellow");
    obj.label33:setFontFamily("kalam");
    obj.label33:setCursor("handPoint");
    obj.label33:setHitTest(true);
    obj.label33:setName("label33");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.Arma5);
    obj.image21:setLeft(41.38);
    obj.image21:setTop(61.75);
    obj.image21:setWidth(67.88);
    obj.image21:setHeight(30);
    obj.image21:setCursor("handPoint");
    obj.image21:setHitTest(true);
    obj.image21:setHint("Clique aqui para comprar");
    obj.image21:setName("image21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.Arma5);
    obj.image22:setLeft(2.56);
    obj.image22:setTop(93.00);
    obj.image22:setWidth(136.69);
    obj.image22:setHeight(77.69);
    obj.image22:setStyle("proportional");
    obj.image22:setCenter(true);
    obj.image22:setEditable(true);
    obj.image22:setField("ImagemArma5");
    obj.image22:setName("image22");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.Arma5);
    obj.label34:setLeft(197);
    obj.label34:setTop(10);
    obj.label34:setWidth(249.25);
    obj.label34:setHeight(39);
    obj.label34:setFontSize(22);
    obj.label34:setField("ItemNome5");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setFontColor("black");
    obj.label34:setFontFamily("kalam");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.Arma5);
    obj.label35:setLeft(207.88);
    obj.label35:setTop(51);
    obj.label35:setWidth(49.88);
    obj.label35:setHeight(31.38);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("Iniciativa5");
    obj.label35:setFontSize(19);
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setFontColor("black");
    obj.label35:setFontFamily("kalam");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.Arma5);
    obj.label36:setLeft(182.88);
    obj.label36:setTop(90);
    obj.label36:setWidth(50.88);
    obj.label36:setHeight(31.38);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setField("DanoItem5");
    obj.label36:setFontSize(19);
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setFontColor("black");
    obj.label36:setFontFamily("kalam");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.Arma5);
    obj.label37:setLeft(195.88);
    obj.label37:setTop(128);
    obj.label37:setWidth(50.88);
    obj.label37:setHeight(32);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("Alcance5");
    obj.label37:setFontSize(15);
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setFontColor("black");
    obj.label37:setFontFamily("kalam");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.Arma5);
    obj.label38:setLeft(317.88);
    obj.label38:setTop(49);
    obj.label38:setWidth(68.88);
    obj.label38:setHeight(32);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setField("Cadencia5");
    obj.label38:setFontSize(10);
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontColor("black");
    obj.label38:setFontFamily("kalam");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.Arma5);
    obj.label39:setLeft(317.88);
    obj.label39:setTop(89);
    obj.label39:setWidth(68.88);
    obj.label39:setHeight(32);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("Municao5");
    obj.label39:setFontSize(19);
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setFontColor("black");
    obj.label39:setFontFamily("kalam");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.Arma5);
    obj.label40:setLeft(317.88);
    obj.label40:setTop(125);
    obj.label40:setWidth(48.12);
    obj.label40:setHeight(32);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("ClasseDeDureza5");
    obj.label40:setFontSize(19);
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setFontColor("black");
    obj.label40:setFontFamily("kalam");
    obj.label40:setName("label40");

    obj.Arma6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma6:setParent(obj.scrollBox1);
    obj.Arma6:setName("Arma6");
    obj.Arma6:setWidth(480);
    obj.Arma6:setHeight(174);
    obj.Arma6:setLeft(0);
    obj.Arma6:setTop(998);

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.Arma6);
    obj.image23:setSRC("images/Loja.png");
    obj.image23:setLeft(0);
    obj.image23:setTop(0);
    obj.image23:setWidth(399);
    obj.image23:setHeight(174);
    obj.image23:setName("image23");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.Arma6);
    obj.label41:setLeft(22.25);
    obj.label41:setTop(20.50);
    obj.label41:setWidth(107.25);
    obj.label41:setHeight(37.88);
    obj.label41:setFontSize(22);
    obj.label41:setHint("Preço da Arma");
    obj.label41:setField("Preco6");
    obj.label41:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setFontColor("yellow");
    obj.label41:setFontFamily("kalam");
    obj.label41:setCursor("handPoint");
    obj.label41:setHitTest(true);
    obj.label41:setName("label41");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.Arma6);
    obj.image24:setLeft(41.38);
    obj.image24:setTop(61.75);
    obj.image24:setWidth(67.88);
    obj.image24:setHeight(30);
    obj.image24:setCursor("handPoint");
    obj.image24:setHitTest(true);
    obj.image24:setHint("Clique aqui para comprar");
    obj.image24:setName("image24");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.Arma6);
    obj.image25:setLeft(2.56);
    obj.image25:setTop(93.00);
    obj.image25:setWidth(136.69);
    obj.image25:setHeight(77.69);
    obj.image25:setStyle("proportional");
    obj.image25:setCenter(true);
    obj.image25:setEditable(true);
    obj.image25:setField("ImagemArma6");
    obj.image25:setName("image25");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.Arma6);
    obj.label42:setLeft(197);
    obj.label42:setTop(10);
    obj.label42:setWidth(249.25);
    obj.label42:setHeight(39);
    obj.label42:setFontSize(22);
    obj.label42:setField("ItemNome6");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setFontColor("black");
    obj.label42:setFontFamily("kalam");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.Arma6);
    obj.label43:setLeft(207.88);
    obj.label43:setTop(51);
    obj.label43:setWidth(49.88);
    obj.label43:setHeight(31.38);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("Iniciativa6");
    obj.label43:setFontSize(19);
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setFontColor("black");
    obj.label43:setFontFamily("kalam");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.Arma6);
    obj.label44:setLeft(182.88);
    obj.label44:setTop(90);
    obj.label44:setWidth(50.88);
    obj.label44:setHeight(31.38);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setField("DanoItem6");
    obj.label44:setFontSize(19);
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setFontColor("black");
    obj.label44:setFontFamily("kalam");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.Arma6);
    obj.label45:setLeft(195.88);
    obj.label45:setTop(128);
    obj.label45:setWidth(50.88);
    obj.label45:setHeight(32);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("Alcance6");
    obj.label45:setFontSize(15);
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setFontColor("black");
    obj.label45:setFontFamily("kalam");
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.Arma6);
    obj.label46:setLeft(317.88);
    obj.label46:setTop(49);
    obj.label46:setWidth(68.88);
    obj.label46:setHeight(32);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setField("Cadencia6");
    obj.label46:setFontSize(10);
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setFontColor("black");
    obj.label46:setFontFamily("kalam");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.Arma6);
    obj.label47:setLeft(317.88);
    obj.label47:setTop(89);
    obj.label47:setWidth(68.88);
    obj.label47:setHeight(32);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setField("Municao6");
    obj.label47:setFontSize(19);
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setFontColor("black");
    obj.label47:setFontFamily("kalam");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.Arma6);
    obj.label48:setLeft(317.88);
    obj.label48:setTop(125);
    obj.label48:setWidth(48.12);
    obj.label48:setHeight(32);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setField("ClasseDeDureza6");
    obj.label48:setFontSize(19);
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setFontColor("black");
    obj.label48:setFontFamily("kalam");
    obj.label48:setName("label48");

    obj.Arma7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma7:setParent(obj.scrollBox1);
    obj.Arma7:setName("Arma7");
    obj.Arma7:setWidth(480);
    obj.Arma7:setHeight(174);
    obj.Arma7:setLeft(0);
    obj.Arma7:setTop(1180);

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.Arma7);
    obj.image26:setSRC("images/Loja.png");
    obj.image26:setLeft(0);
    obj.image26:setTop(0);
    obj.image26:setWidth(399);
    obj.image26:setHeight(174);
    obj.image26:setName("image26");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.Arma7);
    obj.label49:setLeft(22.25);
    obj.label49:setTop(20.50);
    obj.label49:setWidth(107.25);
    obj.label49:setHeight(37.88);
    obj.label49:setFontSize(22);
    obj.label49:setHint("Preço da Arma");
    obj.label49:setField("Preco7");
    obj.label49:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setFontColor("yellow");
    obj.label49:setFontFamily("kalam");
    obj.label49:setCursor("handPoint");
    obj.label49:setHitTest(true);
    obj.label49:setName("label49");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.Arma7);
    obj.image27:setLeft(41.38);
    obj.image27:setTop(61.75);
    obj.image27:setWidth(67.88);
    obj.image27:setHeight(30);
    obj.image27:setCursor("handPoint");
    obj.image27:setHitTest(true);
    obj.image27:setHint("Clique aqui para comprar");
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.Arma7);
    obj.image28:setLeft(2.56);
    obj.image28:setTop(93.00);
    obj.image28:setWidth(136.69);
    obj.image28:setHeight(77.69);
    obj.image28:setStyle("proportional");
    obj.image28:setCenter(true);
    obj.image28:setEditable(true);
    obj.image28:setField("ImagemArma7");
    obj.image28:setName("image28");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.Arma7);
    obj.label50:setLeft(197);
    obj.label50:setTop(10);
    obj.label50:setWidth(249.25);
    obj.label50:setHeight(39);
    obj.label50:setFontSize(18);
    obj.label50:setField("ItemNome7");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setFontColor("black");
    obj.label50:setFontFamily("kalam");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.Arma7);
    obj.label51:setLeft(207.88);
    obj.label51:setTop(51);
    obj.label51:setWidth(49.88);
    obj.label51:setHeight(31.38);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setField("Iniciativa7");
    obj.label51:setFontSize(19);
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setFontColor("black");
    obj.label51:setFontFamily("kalam");
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.Arma7);
    obj.label52:setLeft(182.88);
    obj.label52:setTop(90);
    obj.label52:setWidth(50.88);
    obj.label52:setHeight(31.38);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setField("DanoItem7");
    obj.label52:setFontSize(19);
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setFontColor("black");
    obj.label52:setFontFamily("kalam");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.Arma7);
    obj.label53:setLeft(195.88);
    obj.label53:setTop(128);
    obj.label53:setWidth(50.88);
    obj.label53:setHeight(32);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setField("Alcance7");
    obj.label53:setFontSize(15);
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setFontColor("black");
    obj.label53:setFontFamily("kalam");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.Arma7);
    obj.label54:setLeft(317.88);
    obj.label54:setTop(49);
    obj.label54:setWidth(68.88);
    obj.label54:setHeight(32);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setField("Cadencia7");
    obj.label54:setFontSize(10);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setFontColor("black");
    obj.label54:setFontFamily("kalam");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.Arma7);
    obj.label55:setLeft(317.88);
    obj.label55:setTop(89);
    obj.label55:setWidth(68.88);
    obj.label55:setHeight(32);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("Municao7");
    obj.label55:setFontSize(19);
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setFontColor("black");
    obj.label55:setFontFamily("kalam");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.Arma7);
    obj.label56:setLeft(317.88);
    obj.label56:setTop(125);
    obj.label56:setWidth(48.12);
    obj.label56:setHeight(32);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("ClasseDeDureza7");
    obj.label56:setFontSize(19);
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setFontColor("black");
    obj.label56:setFontFamily("kalam");
    obj.label56:setName("label56");

    obj.Arma8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma8:setParent(obj.scrollBox1);
    obj.Arma8:setName("Arma8");
    obj.Arma8:setWidth(480);
    obj.Arma8:setHeight(174);
    obj.Arma8:setLeft(0);
    obj.Arma8:setTop(1362);

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.Arma8);
    obj.image29:setSRC("images/Loja.png");
    obj.image29:setLeft(0);
    obj.image29:setTop(0);
    obj.image29:setWidth(399);
    obj.image29:setHeight(174);
    obj.image29:setName("image29");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.Arma8);
    obj.label57:setLeft(22.25);
    obj.label57:setTop(20.50);
    obj.label57:setWidth(107.25);
    obj.label57:setHeight(37.88);
    obj.label57:setFontSize(22);
    obj.label57:setHint("Preço da Arma");
    obj.label57:setField("Preco8");
    obj.label57:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setFontColor("yellow");
    obj.label57:setFontFamily("kalam");
    obj.label57:setCursor("handPoint");
    obj.label57:setHitTest(true);
    obj.label57:setName("label57");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.Arma8);
    obj.image30:setLeft(41.38);
    obj.image30:setTop(61.75);
    obj.image30:setWidth(67.88);
    obj.image30:setHeight(30);
    obj.image30:setCursor("handPoint");
    obj.image30:setHitTest(true);
    obj.image30:setHint("Clique aqui para comprar");
    obj.image30:setName("image30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.Arma8);
    obj.image31:setLeft(2.56);
    obj.image31:setTop(93.00);
    obj.image31:setWidth(136.69);
    obj.image31:setHeight(77.69);
    obj.image31:setStyle("proportional");
    obj.image31:setCenter(true);
    obj.image31:setEditable(true);
    obj.image31:setField("ImagemArma8");
    obj.image31:setName("image31");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.Arma8);
    obj.label58:setLeft(197);
    obj.label58:setTop(10);
    obj.label58:setWidth(249.25);
    obj.label58:setHeight(39);
    obj.label58:setFontSize(18);
    obj.label58:setField("ItemNome8");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setFontColor("black");
    obj.label58:setFontFamily("kalam");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.Arma8);
    obj.label59:setLeft(207.88);
    obj.label59:setTop(51);
    obj.label59:setWidth(49.88);
    obj.label59:setHeight(31.38);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("Iniciativa8");
    obj.label59:setFontSize(19);
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setFontColor("black");
    obj.label59:setFontFamily("kalam");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.Arma8);
    obj.label60:setLeft(182.88);
    obj.label60:setTop(90);
    obj.label60:setWidth(50.88);
    obj.label60:setHeight(31.38);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setField("DanoItem8");
    obj.label60:setFontSize(19);
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setFontColor("black");
    obj.label60:setFontFamily("kalam");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.Arma8);
    obj.label61:setLeft(195.88);
    obj.label61:setTop(128);
    obj.label61:setWidth(50.88);
    obj.label61:setHeight(32);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setField("Alcance8");
    obj.label61:setFontSize(15);
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setFontColor("black");
    obj.label61:setFontFamily("kalam");
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.Arma8);
    obj.label62:setLeft(317.88);
    obj.label62:setTop(49);
    obj.label62:setWidth(68.88);
    obj.label62:setHeight(32);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setField("Cadencia8");
    obj.label62:setFontSize(19);
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setFontColor("black");
    obj.label62:setFontFamily("kalam");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.Arma8);
    obj.label63:setLeft(317.88);
    obj.label63:setTop(89);
    obj.label63:setWidth(68.88);
    obj.label63:setHeight(32);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setField("Municao8");
    obj.label63:setFontSize(19);
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setFontColor("black");
    obj.label63:setFontFamily("kalam");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.Arma8);
    obj.label64:setLeft(317.88);
    obj.label64:setTop(125);
    obj.label64:setWidth(48.12);
    obj.label64:setHeight(32);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setField("ClasseDeDureza8");
    obj.label64:setFontSize(19);
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setFontColor("black");
    obj.label64:setFontFamily("kalam");
    obj.label64:setName("label64");

    obj.Arma9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma9:setParent(obj.scrollBox1);
    obj.Arma9:setName("Arma9");
    obj.Arma9:setWidth(480);
    obj.Arma9:setHeight(174);
    obj.Arma9:setLeft(0);
    obj.Arma9:setTop(1544);

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.Arma9);
    obj.image32:setSRC("images/Loja.png");
    obj.image32:setLeft(0);
    obj.image32:setTop(0);
    obj.image32:setWidth(399);
    obj.image32:setHeight(174);
    obj.image32:setName("image32");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.Arma9);
    obj.label65:setLeft(22.25);
    obj.label65:setTop(20.50);
    obj.label65:setWidth(107.25);
    obj.label65:setHeight(37.88);
    obj.label65:setFontSize(22);
    obj.label65:setHint("Preço da Arma");
    obj.label65:setField("Preco9");
    obj.label65:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setFontColor("yellow");
    obj.label65:setFontFamily("kalam");
    obj.label65:setCursor("handPoint");
    obj.label65:setHitTest(true);
    obj.label65:setName("label65");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.Arma9);
    obj.image33:setLeft(41.38);
    obj.image33:setTop(61.75);
    obj.image33:setWidth(67.88);
    obj.image33:setHeight(30);
    obj.image33:setCursor("handPoint");
    obj.image33:setHitTest(true);
    obj.image33:setHint("Clique aqui para comprar");
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.Arma9);
    obj.image34:setLeft(2.56);
    obj.image34:setTop(93.00);
    obj.image34:setWidth(136.69);
    obj.image34:setHeight(77.69);
    obj.image34:setStyle("proportional");
    obj.image34:setCenter(true);
    obj.image34:setEditable(true);
    obj.image34:setField("ImagemArma9");
    obj.image34:setName("image34");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.Arma9);
    obj.label66:setLeft(197);
    obj.label66:setTop(10);
    obj.label66:setWidth(249.25);
    obj.label66:setHeight(39);
    obj.label66:setFontSize(22);
    obj.label66:setField("ItemNome9");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setFontColor("black");
    obj.label66:setFontFamily("kalam");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.Arma9);
    obj.label67:setLeft(207.88);
    obj.label67:setTop(51);
    obj.label67:setWidth(49.88);
    obj.label67:setHeight(31.38);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setField("Iniciativa9");
    obj.label67:setFontSize(19);
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setFontColor("black");
    obj.label67:setFontFamily("kalam");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.Arma9);
    obj.label68:setLeft(182.88);
    obj.label68:setTop(90);
    obj.label68:setWidth(50.88);
    obj.label68:setHeight(31.38);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setField("DanoItem9");
    obj.label68:setFontSize(19);
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setFontColor("black");
    obj.label68:setFontFamily("kalam");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.Arma9);
    obj.label69:setLeft(195.88);
    obj.label69:setTop(128);
    obj.label69:setWidth(50.88);
    obj.label69:setHeight(32);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setField("Alcance9");
    obj.label69:setFontSize(15);
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setFontColor("black");
    obj.label69:setFontFamily("kalam");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.Arma9);
    obj.label70:setLeft(317.88);
    obj.label70:setTop(49);
    obj.label70:setWidth(68.88);
    obj.label70:setHeight(32);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setField("Cadencia9");
    obj.label70:setFontSize(19);
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setFontColor("black");
    obj.label70:setFontFamily("kalam");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.Arma9);
    obj.label71:setLeft(317.88);
    obj.label71:setTop(89);
    obj.label71:setWidth(68.88);
    obj.label71:setHeight(32);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setField("Municao9");
    obj.label71:setFontSize(19);
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setFontColor("black");
    obj.label71:setFontFamily("kalam");
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.Arma9);
    obj.label72:setLeft(317.88);
    obj.label72:setTop(125);
    obj.label72:setWidth(48.12);
    obj.label72:setHeight(32);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setField("ClasseDeDureza9");
    obj.label72:setFontSize(19);
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setFontColor("black");
    obj.label72:setFontFamily("kalam");
    obj.label72:setName("label72");

    obj.Arma10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma10:setParent(obj.scrollBox1);
    obj.Arma10:setName("Arma10");
    obj.Arma10:setWidth(480);
    obj.Arma10:setHeight(174);
    obj.Arma10:setLeft(0);
    obj.Arma10:setTop(1726);

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.Arma10);
    obj.image35:setSRC("images/Loja.png");
    obj.image35:setLeft(0);
    obj.image35:setTop(0);
    obj.image35:setWidth(399);
    obj.image35:setHeight(174);
    obj.image35:setName("image35");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.Arma10);
    obj.label73:setLeft(22.25);
    obj.label73:setTop(20.50);
    obj.label73:setWidth(107.25);
    obj.label73:setHeight(37.88);
    obj.label73:setFontSize(22);
    obj.label73:setHint("Preço da Arma");
    obj.label73:setField("Preco10");
    obj.label73:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setFontColor("yellow");
    obj.label73:setFontFamily("kalam");
    obj.label73:setCursor("handPoint");
    obj.label73:setHitTest(true);
    obj.label73:setName("label73");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.Arma10);
    obj.image36:setLeft(41.38);
    obj.image36:setTop(61.75);
    obj.image36:setWidth(67.88);
    obj.image36:setHeight(30);
    obj.image36:setCursor("handPoint");
    obj.image36:setHitTest(true);
    obj.image36:setHint("Clique aqui para comprar");
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.Arma10);
    obj.image37:setLeft(2.56);
    obj.image37:setTop(93.00);
    obj.image37:setWidth(136.69);
    obj.image37:setHeight(77.69);
    obj.image37:setStyle("proportional");
    obj.image37:setCenter(true);
    obj.image37:setEditable(true);
    obj.image37:setField("ImagemArma10");
    obj.image37:setName("image37");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.Arma10);
    obj.label74:setLeft(197);
    obj.label74:setTop(10);
    obj.label74:setWidth(249.25);
    obj.label74:setHeight(39);
    obj.label74:setFontSize(22);
    obj.label74:setField("ItemNome10");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setFontColor("black");
    obj.label74:setFontFamily("kalam");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.Arma10);
    obj.label75:setLeft(207.88);
    obj.label75:setTop(51);
    obj.label75:setWidth(49.88);
    obj.label75:setHeight(31.38);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setField("Iniciativa10");
    obj.label75:setFontSize(19);
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setFontColor("black");
    obj.label75:setFontFamily("kalam");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.Arma10);
    obj.label76:setLeft(182.88);
    obj.label76:setTop(90);
    obj.label76:setWidth(50.88);
    obj.label76:setHeight(31.38);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setField("DanoItem10");
    obj.label76:setFontSize(19);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setFontColor("black");
    obj.label76:setFontFamily("kalam");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.Arma10);
    obj.label77:setLeft(195.88);
    obj.label77:setTop(128);
    obj.label77:setWidth(50.88);
    obj.label77:setHeight(32);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setField("Alcance10");
    obj.label77:setFontSize(15);
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setFontColor("black");
    obj.label77:setFontFamily("kalam");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.Arma10);
    obj.label78:setLeft(317.88);
    obj.label78:setTop(49);
    obj.label78:setWidth(68.88);
    obj.label78:setHeight(32);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setField("Cadencia10");
    obj.label78:setFontSize(19);
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setFontColor("black");
    obj.label78:setFontFamily("kalam");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.Arma10);
    obj.label79:setLeft(317.88);
    obj.label79:setTop(89);
    obj.label79:setWidth(68.88);
    obj.label79:setHeight(32);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setField("Municao10");
    obj.label79:setFontSize(19);
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setFontColor("black");
    obj.label79:setFontFamily("kalam");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.Arma10);
    obj.label80:setLeft(317.88);
    obj.label80:setTop(128);
    obj.label80:setWidth(68.88);
    obj.label80:setHeight(32);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setField("Peso10");
    obj.label80:setFontSize(15);
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setFontColor("black");
    obj.label80:setFontFamily("kalam");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.Arma10);
    obj.label81:setLeft(317.88);
    obj.label81:setTop(125);
    obj.label81:setWidth(48.12);
    obj.label81:setHeight(32);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setField("ClasseDeDureza10");
    obj.label81:setFontSize(19);
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setFontColor("black");
    obj.label81:setFontFamily("kalam");
    obj.label81:setName("label81");

    obj.Arma11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma11:setParent(obj.scrollBox1);
    obj.Arma11:setName("Arma11");
    obj.Arma11:setWidth(480);
    obj.Arma11:setHeight(174);
    obj.Arma11:setLeft(0);
    obj.Arma11:setTop(1908);

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.Arma11);
    obj.image38:setSRC("images/Loja.png");
    obj.image38:setLeft(0);
    obj.image38:setTop(0);
    obj.image38:setWidth(399);
    obj.image38:setHeight(174);
    obj.image38:setName("image38");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.Arma11);
    obj.label82:setLeft(22.25);
    obj.label82:setTop(20.50);
    obj.label82:setWidth(107.25);
    obj.label82:setHeight(37.88);
    obj.label82:setFontSize(22);
    obj.label82:setHint("Preço da Arma");
    obj.label82:setField("Preco11");
    obj.label82:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setFontColor("yellow");
    obj.label82:setFontFamily("kalam");
    obj.label82:setCursor("handPoint");
    obj.label82:setHitTest(true);
    obj.label82:setName("label82");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.Arma11);
    obj.image39:setLeft(41.38);
    obj.image39:setTop(61.75);
    obj.image39:setWidth(67.88);
    obj.image39:setHeight(30);
    obj.image39:setCursor("handPoint");
    obj.image39:setHitTest(true);
    obj.image39:setHint("Clique aqui para comprar");
    obj.image39:setName("image39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.Arma11);
    obj.image40:setLeft(2.56);
    obj.image40:setTop(93.00);
    obj.image40:setWidth(136.69);
    obj.image40:setHeight(77.69);
    obj.image40:setStyle("proportional");
    obj.image40:setCenter(true);
    obj.image40:setEditable(true);
    obj.image40:setField("ImagemArma11");
    obj.image40:setName("image40");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.Arma11);
    obj.label83:setLeft(197);
    obj.label83:setTop(10);
    obj.label83:setWidth(249.25);
    obj.label83:setHeight(39);
    obj.label83:setFontSize(22);
    obj.label83:setField("ItemNome11");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setFontColor("black");
    obj.label83:setFontFamily("kalam");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.Arma11);
    obj.label84:setLeft(207.88);
    obj.label84:setTop(51);
    obj.label84:setWidth(49.88);
    obj.label84:setHeight(31.38);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("Iniciativa11");
    obj.label84:setFontSize(19);
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setFontColor("black");
    obj.label84:setFontFamily("kalam");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.Arma11);
    obj.label85:setLeft(182.88);
    obj.label85:setTop(90);
    obj.label85:setWidth(50.88);
    obj.label85:setHeight(31.38);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setField("DanoItem11");
    obj.label85:setFontSize(19);
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontColor("black");
    obj.label85:setFontFamily("kalam");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.Arma11);
    obj.label86:setLeft(195.88);
    obj.label86:setTop(128);
    obj.label86:setWidth(50.88);
    obj.label86:setHeight(32);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setField("Alcance11");
    obj.label86:setFontSize(15);
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setFontColor("black");
    obj.label86:setFontFamily("kalam");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.Arma11);
    obj.label87:setLeft(317.88);
    obj.label87:setTop(49);
    obj.label87:setWidth(68.88);
    obj.label87:setHeight(32);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("Cadencia11");
    obj.label87:setFontSize(19);
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setFontColor("black");
    obj.label87:setFontFamily("kalam");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.Arma11);
    obj.label88:setLeft(317.88);
    obj.label88:setTop(89);
    obj.label88:setWidth(68.88);
    obj.label88:setHeight(32);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setField("Municao11");
    obj.label88:setFontSize(19);
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setFontColor("black");
    obj.label88:setFontFamily("kalam");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.Arma11);
    obj.label89:setLeft(317.88);
    obj.label89:setTop(125);
    obj.label89:setWidth(48.12);
    obj.label89:setHeight(32);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setField("ClasseDeDureza11");
    obj.label89:setFontSize(19);
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setFontColor("black");
    obj.label89:setFontFamily("kalam");
    obj.label89:setName("label89");

    obj.Arma12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma12:setParent(obj.scrollBox1);
    obj.Arma12:setName("Arma12");
    obj.Arma12:setWidth(480);
    obj.Arma12:setHeight(174);
    obj.Arma12:setLeft(0);
    obj.Arma12:setTop(2090);

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.Arma12);
    obj.image41:setSRC("images/Loja.png");
    obj.image41:setLeft(0);
    obj.image41:setTop(0);
    obj.image41:setWidth(399);
    obj.image41:setHeight(174);
    obj.image41:setName("image41");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.Arma12);
    obj.label90:setLeft(22.25);
    obj.label90:setTop(20.50);
    obj.label90:setWidth(107.25);
    obj.label90:setHeight(37.88);
    obj.label90:setFontSize(22);
    obj.label90:setHint("Preço da Arma");
    obj.label90:setField("Preco12");
    obj.label90:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setFontColor("yellow");
    obj.label90:setFontFamily("kalam");
    obj.label90:setCursor("handPoint");
    obj.label90:setHitTest(true);
    obj.label90:setName("label90");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.Arma12);
    obj.image42:setLeft(41.38);
    obj.image42:setTop(61.75);
    obj.image42:setWidth(67.88);
    obj.image42:setHeight(30);
    obj.image42:setCursor("handPoint");
    obj.image42:setHitTest(true);
    obj.image42:setHint("Clique aqui para comprar");
    obj.image42:setName("image42");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.Arma12);
    obj.image43:setLeft(2.56);
    obj.image43:setTop(93.00);
    obj.image43:setWidth(136.69);
    obj.image43:setHeight(77.69);
    obj.image43:setStyle("proportional");
    obj.image43:setCenter(true);
    obj.image43:setEditable(true);
    obj.image43:setField("ImagemArma12");
    obj.image43:setName("image43");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.Arma12);
    obj.label91:setLeft(197);
    obj.label91:setTop(10);
    obj.label91:setWidth(249.25);
    obj.label91:setHeight(39);
    obj.label91:setFontSize(16);
    obj.label91:setField("ItemNome12");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontColor("black");
    obj.label91:setFontFamily("kalam");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.Arma12);
    obj.label92:setLeft(207.88);
    obj.label92:setTop(51);
    obj.label92:setWidth(49.88);
    obj.label92:setHeight(31.38);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setField("Iniciativa12");
    obj.label92:setFontSize(19);
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setFontColor("black");
    obj.label92:setFontFamily("kalam");
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.Arma12);
    obj.label93:setLeft(182.88);
    obj.label93:setTop(90);
    obj.label93:setWidth(50.88);
    obj.label93:setHeight(31.38);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setField("DanoItem12");
    obj.label93:setFontSize(19);
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setFontColor("black");
    obj.label93:setFontFamily("kalam");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.Arma12);
    obj.label94:setLeft(195.88);
    obj.label94:setTop(128);
    obj.label94:setWidth(50.88);
    obj.label94:setHeight(32);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setField("Alcance12");
    obj.label94:setFontSize(15);
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setFontColor("black");
    obj.label94:setFontFamily("kalam");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.Arma12);
    obj.label95:setLeft(317.88);
    obj.label95:setTop(49);
    obj.label95:setWidth(68.88);
    obj.label95:setHeight(32);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("Cadencia12");
    obj.label95:setFontSize(19);
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setFontColor("black");
    obj.label95:setFontFamily("kalam");
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.Arma12);
    obj.label96:setLeft(317.88);
    obj.label96:setTop(89);
    obj.label96:setWidth(68.88);
    obj.label96:setHeight(32);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setField("Municao12");
    obj.label96:setFontSize(19);
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setFontColor("black");
    obj.label96:setFontFamily("kalam");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.Arma12);
    obj.label97:setLeft(317.88);
    obj.label97:setTop(125);
    obj.label97:setWidth(48.12);
    obj.label97:setHeight(32);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setField("ClasseDeDureza12");
    obj.label97:setFontSize(19);
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setFontColor("black");
    obj.label97:setFontFamily("kalam");
    obj.label97:setName("label97");

    obj.Arma13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma13:setParent(obj.scrollBox1);
    obj.Arma13:setName("Arma13");
    obj.Arma13:setWidth(480);
    obj.Arma13:setHeight(174);
    obj.Arma13:setLeft(413);
    obj.Arma13:setTop(88);

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.Arma13);
    obj.image44:setSRC("images/Loja.png");
    obj.image44:setLeft(0);
    obj.image44:setTop(0);
    obj.image44:setWidth(399);
    obj.image44:setHeight(174);
    obj.image44:setName("image44");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.Arma13);
    obj.label98:setLeft(22.25);
    obj.label98:setTop(20.50);
    obj.label98:setWidth(107.25);
    obj.label98:setHeight(37.88);
    obj.label98:setFontSize(22);
    obj.label98:setHint("Preço da Arma");
    obj.label98:setField("Preco13");
    obj.label98:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");
    obj.label98:setFontColor("yellow");
    obj.label98:setFontFamily("kalam");
    obj.label98:setCursor("handPoint");
    obj.label98:setHitTest(true);
    obj.label98:setName("label98");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.Arma13);
    obj.image45:setLeft(41.38);
    obj.image45:setTop(61.75);
    obj.image45:setWidth(67.88);
    obj.image45:setHeight(30);
    obj.image45:setCursor("handPoint");
    obj.image45:setHitTest(true);
    obj.image45:setHint("Clique aqui para comprar");
    obj.image45:setName("image45");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.Arma13);
    obj.image46:setLeft(2.56);
    obj.image46:setTop(93.00);
    obj.image46:setWidth(136.69);
    obj.image46:setHeight(77.69);
    obj.image46:setStyle("proportional");
    obj.image46:setCenter(true);
    obj.image46:setEditable(true);
    obj.image46:setField("ImagemArma13");
    obj.image46:setName("image46");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.Arma13);
    obj.label99:setLeft(197);
    obj.label99:setTop(10);
    obj.label99:setWidth(249.25);
    obj.label99:setHeight(39);
    obj.label99:setFontSize(22);
    obj.label99:setField("ItemNome13");
    lfm_setPropAsString(obj.label99, "fontStyle",  "bold");
    obj.label99:setFontColor("black");
    obj.label99:setFontFamily("kalam");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.Arma13);
    obj.label100:setLeft(207.88);
    obj.label100:setTop(51);
    obj.label100:setWidth(49.88);
    obj.label100:setHeight(31.38);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setField("Iniciativa13");
    obj.label100:setFontSize(19);
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");
    obj.label100:setFontColor("black");
    obj.label100:setFontFamily("kalam");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.Arma13);
    obj.label101:setLeft(182.88);
    obj.label101:setTop(90);
    obj.label101:setWidth(50.88);
    obj.label101:setHeight(31.38);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setField("DanoItem13");
    obj.label101:setFontSize(19);
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setFontColor("black");
    obj.label101:setFontFamily("kalam");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.Arma13);
    obj.label102:setLeft(195.88);
    obj.label102:setTop(128);
    obj.label102:setWidth(50.88);
    obj.label102:setHeight(32);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setField("Alcance13");
    obj.label102:setFontSize(15);
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setFontColor("black");
    obj.label102:setFontFamily("kalam");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.Arma13);
    obj.label103:setLeft(317.88);
    obj.label103:setTop(49);
    obj.label103:setWidth(68.88);
    obj.label103:setHeight(32);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setField("Cadencia13");
    obj.label103:setFontSize(19);
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setFontColor("black");
    obj.label103:setFontFamily("kalam");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.Arma13);
    obj.label104:setLeft(317.88);
    obj.label104:setTop(89);
    obj.label104:setWidth(68.88);
    obj.label104:setHeight(32);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setField("Municao13");
    obj.label104:setFontSize(19);
    lfm_setPropAsString(obj.label104, "fontStyle",  "bold");
    obj.label104:setFontColor("black");
    obj.label104:setFontFamily("kalam");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.Arma13);
    obj.label105:setLeft(317.88);
    obj.label105:setTop(125);
    obj.label105:setWidth(48.12);
    obj.label105:setHeight(32);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setField("ClasseDeDureza13");
    obj.label105:setFontSize(19);
    lfm_setPropAsString(obj.label105, "fontStyle",  "bold");
    obj.label105:setFontColor("black");
    obj.label105:setFontFamily("kalam");
    obj.label105:setName("label105");

    obj.Arma14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma14:setParent(obj.scrollBox1);
    obj.Arma14:setName("Arma14");
    obj.Arma14:setWidth(480);
    obj.Arma14:setHeight(174);
    obj.Arma14:setLeft(413);
    obj.Arma14:setTop(270);

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.Arma14);
    obj.image47:setSRC("images/Loja.png");
    obj.image47:setLeft(0);
    obj.image47:setTop(0);
    obj.image47:setWidth(399);
    obj.image47:setHeight(174);
    obj.image47:setName("image47");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.Arma14);
    obj.label106:setLeft(22.25);
    obj.label106:setTop(20.50);
    obj.label106:setWidth(107.25);
    obj.label106:setHeight(37.88);
    obj.label106:setFontSize(22);
    obj.label106:setHint("Preço da Arma");
    obj.label106:setField("Preco14");
    obj.label106:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label106, "fontStyle",  "bold");
    obj.label106:setFontColor("yellow");
    obj.label106:setFontFamily("kalam");
    obj.label106:setCursor("handPoint");
    obj.label106:setHitTest(true);
    obj.label106:setName("label106");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.Arma14);
    obj.image48:setLeft(41.38);
    obj.image48:setTop(61.75);
    obj.image48:setWidth(67.88);
    obj.image48:setHeight(30);
    obj.image48:setCursor("handPoint");
    obj.image48:setHitTest(true);
    obj.image48:setHint("Clique aqui para comprar");
    obj.image48:setName("image48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.Arma14);
    obj.image49:setLeft(2.56);
    obj.image49:setTop(93.00);
    obj.image49:setWidth(136.69);
    obj.image49:setHeight(77.69);
    obj.image49:setStyle("proportional");
    obj.image49:setCenter(true);
    obj.image49:setEditable(true);
    obj.image49:setField("ImagemArma14");
    obj.image49:setName("image49");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.Arma14);
    obj.label107:setLeft(197);
    obj.label107:setTop(10);
    obj.label107:setWidth(249.25);
    obj.label107:setHeight(39);
    obj.label107:setFontSize(16);
    obj.label107:setField("ItemNome14");
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setFontColor("black");
    obj.label107:setFontFamily("kalam");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.Arma14);
    obj.label108:setLeft(207.88);
    obj.label108:setTop(51);
    obj.label108:setWidth(49.88);
    obj.label108:setHeight(31.38);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setField("Iniciativa14");
    obj.label108:setFontSize(19);
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");
    obj.label108:setFontColor("black");
    obj.label108:setFontFamily("kalam");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.Arma14);
    obj.label109:setLeft(182.88);
    obj.label109:setTop(90);
    obj.label109:setWidth(50.88);
    obj.label109:setHeight(31.38);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setField("DanoItem14");
    obj.label109:setFontSize(19);
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setFontColor("black");
    obj.label109:setFontFamily("kalam");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.Arma14);
    obj.label110:setLeft(195.88);
    obj.label110:setTop(128);
    obj.label110:setWidth(50.88);
    obj.label110:setHeight(32);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setField("Alcance14");
    obj.label110:setFontSize(15);
    lfm_setPropAsString(obj.label110, "fontStyle",  "bold");
    obj.label110:setFontColor("black");
    obj.label110:setFontFamily("kalam");
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.Arma14);
    obj.label111:setLeft(317.88);
    obj.label111:setTop(49);
    obj.label111:setWidth(68.88);
    obj.label111:setHeight(32);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setField("Cadencia14");
    obj.label111:setFontSize(19);
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setFontColor("black");
    obj.label111:setFontFamily("kalam");
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.Arma14);
    obj.label112:setLeft(317.88);
    obj.label112:setTop(89);
    obj.label112:setWidth(68.88);
    obj.label112:setHeight(32);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setField("Municao14");
    obj.label112:setFontSize(19);
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");
    obj.label112:setFontColor("black");
    obj.label112:setFontFamily("kalam");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.Arma14);
    obj.label113:setLeft(317.88);
    obj.label113:setTop(125);
    obj.label113:setWidth(48.12);
    obj.label113:setHeight(32);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setField("ClasseDeDureza14");
    obj.label113:setFontSize(19);
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setFontColor("black");
    obj.label113:setFontFamily("kalam");
    obj.label113:setName("label113");

    obj.Arma15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma15:setParent(obj.scrollBox1);
    obj.Arma15:setName("Arma15");
    obj.Arma15:setWidth(480);
    obj.Arma15:setHeight(174);
    obj.Arma15:setLeft(413);
    obj.Arma15:setTop(452);

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.Arma15);
    obj.image50:setSRC("images/Loja.png");
    obj.image50:setLeft(0);
    obj.image50:setTop(0);
    obj.image50:setWidth(399);
    obj.image50:setHeight(174);
    obj.image50:setName("image50");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.Arma15);
    obj.label114:setLeft(22.25);
    obj.label114:setTop(20.50);
    obj.label114:setWidth(107.25);
    obj.label114:setHeight(37.88);
    obj.label114:setFontSize(22);
    obj.label114:setHint("Preço da Arma");
    obj.label114:setField("Preco15");
    obj.label114:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");
    obj.label114:setFontColor("yellow");
    obj.label114:setFontFamily("kalam");
    obj.label114:setCursor("handPoint");
    obj.label114:setHitTest(true);
    obj.label114:setName("label114");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.Arma15);
    obj.image51:setLeft(41.38);
    obj.image51:setTop(61.75);
    obj.image51:setWidth(67.88);
    obj.image51:setHeight(30);
    obj.image51:setCursor("handPoint");
    obj.image51:setHitTest(true);
    obj.image51:setHint("Clique aqui para comprar");
    obj.image51:setName("image51");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.Arma15);
    obj.image52:setLeft(2.56);
    obj.image52:setTop(93.00);
    obj.image52:setWidth(136.69);
    obj.image52:setHeight(77.69);
    obj.image52:setStyle("proportional");
    obj.image52:setCenter(true);
    obj.image52:setEditable(true);
    obj.image52:setField("ImagemArma15");
    obj.image52:setName("image52");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.Arma15);
    obj.label115:setLeft(197);
    obj.label115:setTop(10);
    obj.label115:setWidth(249.25);
    obj.label115:setHeight(39);
    obj.label115:setFontSize(18);
    obj.label115:setField("ItemNome15");
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setFontColor("black");
    obj.label115:setFontFamily("kalam");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.Arma15);
    obj.label116:setLeft(207.88);
    obj.label116:setTop(51);
    obj.label116:setWidth(49.88);
    obj.label116:setHeight(31.38);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setField("Iniciativa15");
    obj.label116:setFontSize(19);
    lfm_setPropAsString(obj.label116, "fontStyle",  "bold");
    obj.label116:setFontColor("black");
    obj.label116:setFontFamily("kalam");
    obj.label116:setName("label116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.Arma15);
    obj.label117:setLeft(182.88);
    obj.label117:setTop(90);
    obj.label117:setWidth(50.88);
    obj.label117:setHeight(31.38);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setField("DanoItem15");
    obj.label117:setFontSize(19);
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setFontColor("black");
    obj.label117:setFontFamily("kalam");
    obj.label117:setName("label117");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.Arma15);
    obj.label118:setLeft(195.88);
    obj.label118:setTop(128);
    obj.label118:setWidth(50.88);
    obj.label118:setHeight(32);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setField("Alcance15");
    obj.label118:setFontSize(15);
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");
    obj.label118:setFontColor("black");
    obj.label118:setFontFamily("kalam");
    obj.label118:setName("label118");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.Arma15);
    obj.label119:setLeft(317.88);
    obj.label119:setTop(49);
    obj.label119:setWidth(68.88);
    obj.label119:setHeight(32);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setField("Cadencia15");
    obj.label119:setFontSize(19);
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setFontColor("black");
    obj.label119:setFontFamily("kalam");
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.Arma15);
    obj.label120:setLeft(317.88);
    obj.label120:setTop(89);
    obj.label120:setWidth(68.88);
    obj.label120:setHeight(32);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setField("Municao15");
    obj.label120:setFontSize(19);
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");
    obj.label120:setFontColor("black");
    obj.label120:setFontFamily("kalam");
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.Arma15);
    obj.label121:setLeft(317.88);
    obj.label121:setTop(125);
    obj.label121:setWidth(48.12);
    obj.label121:setHeight(32);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setField("ClasseDeDureza15");
    obj.label121:setFontSize(19);
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setFontColor("black");
    obj.label121:setFontFamily("kalam");
    obj.label121:setName("label121");

    obj.Arma16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma16:setParent(obj.scrollBox1);
    obj.Arma16:setName("Arma16");
    obj.Arma16:setWidth(480);
    obj.Arma16:setHeight(174);
    obj.Arma16:setLeft(413);
    obj.Arma16:setTop(634);

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.Arma16);
    obj.image53:setSRC("images/Loja.png");
    obj.image53:setLeft(0);
    obj.image53:setTop(0);
    obj.image53:setWidth(399);
    obj.image53:setHeight(174);
    obj.image53:setName("image53");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.Arma16);
    obj.label122:setLeft(22.25);
    obj.label122:setTop(20.50);
    obj.label122:setWidth(107.25);
    obj.label122:setHeight(37.88);
    obj.label122:setFontSize(22);
    obj.label122:setHint("Preço da Arma");
    obj.label122:setField("Preco16");
    obj.label122:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label122, "fontStyle",  "bold");
    obj.label122:setFontColor("yellow");
    obj.label122:setFontFamily("kalam");
    obj.label122:setCursor("handPoint");
    obj.label122:setHitTest(true);
    obj.label122:setName("label122");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.Arma16);
    obj.image54:setLeft(41.38);
    obj.image54:setTop(61.75);
    obj.image54:setWidth(67.88);
    obj.image54:setHeight(30);
    obj.image54:setCursor("handPoint");
    obj.image54:setHitTest(true);
    obj.image54:setHint("Clique aqui para comprar");
    obj.image54:setName("image54");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.Arma16);
    obj.image55:setLeft(2.56);
    obj.image55:setTop(93.00);
    obj.image55:setWidth(136.69);
    obj.image55:setHeight(77.69);
    obj.image55:setStyle("proportional");
    obj.image55:setCenter(true);
    obj.image55:setEditable(true);
    obj.image55:setField("ImagemArma16");
    obj.image55:setName("image55");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.Arma16);
    obj.label123:setLeft(197);
    obj.label123:setTop(10);
    obj.label123:setWidth(249.25);
    obj.label123:setHeight(39);
    obj.label123:setFontSize(19);
    obj.label123:setField("ItemNome16");
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");
    obj.label123:setFontColor("black");
    obj.label123:setFontFamily("kalam");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.Arma16);
    obj.label124:setLeft(207.88);
    obj.label124:setTop(51);
    obj.label124:setWidth(49.88);
    obj.label124:setHeight(31.38);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("Iniciativa16");
    obj.label124:setFontSize(19);
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setFontColor("black");
    obj.label124:setFontFamily("kalam");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.Arma16);
    obj.label125:setLeft(182.88);
    obj.label125:setTop(90);
    obj.label125:setWidth(50.88);
    obj.label125:setHeight(31.38);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setField("DanoItem16");
    obj.label125:setFontSize(19);
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");
    obj.label125:setFontColor("black");
    obj.label125:setFontFamily("kalam");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.Arma16);
    obj.label126:setLeft(195.88);
    obj.label126:setTop(128);
    obj.label126:setWidth(50.88);
    obj.label126:setHeight(32);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setField("Alcance16");
    obj.label126:setFontSize(15);
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setFontColor("black");
    obj.label126:setFontFamily("kalam");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.Arma16);
    obj.label127:setLeft(317.88);
    obj.label127:setTop(49);
    obj.label127:setWidth(68.88);
    obj.label127:setHeight(32);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setField("Cadencia16");
    obj.label127:setFontSize(19);
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");
    obj.label127:setFontColor("black");
    obj.label127:setFontFamily("kalam");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.Arma16);
    obj.label128:setLeft(317.88);
    obj.label128:setTop(89);
    obj.label128:setWidth(68.88);
    obj.label128:setHeight(32);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setField("Municao16");
    obj.label128:setFontSize(19);
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setFontColor("black");
    obj.label128:setFontFamily("kalam");
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.Arma16);
    obj.label129:setLeft(317.88);
    obj.label129:setTop(125);
    obj.label129:setWidth(48.12);
    obj.label129:setHeight(32);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setField("ClasseDeDureza16");
    obj.label129:setFontSize(19);
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");
    obj.label129:setFontColor("black");
    obj.label129:setFontFamily("kalam");
    obj.label129:setName("label129");

    obj.Arma17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma17:setParent(obj.scrollBox1);
    obj.Arma17:setName("Arma17");
    obj.Arma17:setWidth(480);
    obj.Arma17:setHeight(174);
    obj.Arma17:setLeft(413);
    obj.Arma17:setTop(816);

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.Arma17);
    obj.image56:setSRC("images/Loja.png");
    obj.image56:setLeft(0);
    obj.image56:setTop(0);
    obj.image56:setWidth(399);
    obj.image56:setHeight(174);
    obj.image56:setName("image56");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.Arma17);
    obj.label130:setLeft(22.25);
    obj.label130:setTop(20.50);
    obj.label130:setWidth(107.25);
    obj.label130:setHeight(37.88);
    obj.label130:setFontSize(22);
    obj.label130:setHint("Preço da Arma");
    obj.label130:setField("Preco17");
    obj.label130:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setFontColor("yellow");
    obj.label130:setFontFamily("kalam");
    obj.label130:setCursor("handPoint");
    obj.label130:setHitTest(true);
    obj.label130:setName("label130");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.Arma17);
    obj.image57:setLeft(41.38);
    obj.image57:setTop(61.75);
    obj.image57:setWidth(67.88);
    obj.image57:setHeight(30);
    obj.image57:setCursor("handPoint");
    obj.image57:setHitTest(true);
    obj.image57:setHint("Clique aqui para comprar");
    obj.image57:setName("image57");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.Arma17);
    obj.image58:setLeft(2.56);
    obj.image58:setTop(93.00);
    obj.image58:setWidth(136.69);
    obj.image58:setHeight(77.69);
    obj.image58:setStyle("proportional");
    obj.image58:setCenter(true);
    obj.image58:setEditable(true);
    obj.image58:setField("ImagemArma17");
    obj.image58:setName("image58");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.Arma17);
    obj.label131:setLeft(197);
    obj.label131:setTop(10);
    obj.label131:setWidth(249.25);
    obj.label131:setHeight(39);
    obj.label131:setFontSize(22);
    obj.label131:setField("ItemNome17");
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");
    obj.label131:setFontColor("black");
    obj.label131:setFontFamily("kalam");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.Arma17);
    obj.label132:setLeft(207.88);
    obj.label132:setTop(51);
    obj.label132:setWidth(49.88);
    obj.label132:setHeight(31.38);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setField("Iniciativa17");
    obj.label132:setFontSize(19);
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setFontColor("black");
    obj.label132:setFontFamily("kalam");
    obj.label132:setName("label132");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.Arma17);
    obj.label133:setLeft(182.88);
    obj.label133:setTop(90);
    obj.label133:setWidth(50.88);
    obj.label133:setHeight(31.38);
    obj.label133:setHorzTextAlign("center");
    obj.label133:setField("DanoItem17");
    obj.label133:setFontSize(19);
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");
    obj.label133:setFontColor("black");
    obj.label133:setFontFamily("kalam");
    obj.label133:setName("label133");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.Arma17);
    obj.label134:setLeft(195.88);
    obj.label134:setTop(128);
    obj.label134:setWidth(50.88);
    obj.label134:setHeight(32);
    obj.label134:setHorzTextAlign("center");
    obj.label134:setField("Alcance17");
    obj.label134:setFontSize(15);
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setFontColor("black");
    obj.label134:setFontFamily("kalam");
    obj.label134:setName("label134");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.Arma17);
    obj.label135:setLeft(317.88);
    obj.label135:setTop(49);
    obj.label135:setWidth(68.88);
    obj.label135:setHeight(32);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setField("Cadencia17");
    obj.label135:setFontSize(19);
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setFontColor("black");
    obj.label135:setFontFamily("kalam");
    obj.label135:setName("label135");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.Arma17);
    obj.label136:setLeft(317.88);
    obj.label136:setTop(89);
    obj.label136:setWidth(68.88);
    obj.label136:setHeight(32);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setField("Municao17");
    obj.label136:setFontSize(19);
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");
    obj.label136:setFontColor("black");
    obj.label136:setFontFamily("kalam");
    obj.label136:setName("label136");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.Arma17);
    obj.label137:setLeft(317.88);
    obj.label137:setTop(125);
    obj.label137:setWidth(48.12);
    obj.label137:setHeight(32);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setField("ClasseDeDureza17");
    obj.label137:setFontSize(19);
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");
    obj.label137:setFontColor("black");
    obj.label137:setFontFamily("kalam");
    obj.label137:setName("label137");

    obj.Arma18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma18:setParent(obj.scrollBox1);
    obj.Arma18:setName("Arma18");
    obj.Arma18:setWidth(480);
    obj.Arma18:setHeight(174);
    obj.Arma18:setLeft(413);
    obj.Arma18:setTop(998);

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.Arma18);
    obj.image59:setSRC("images/Loja.png");
    obj.image59:setLeft(0);
    obj.image59:setTop(0);
    obj.image59:setWidth(399);
    obj.image59:setHeight(174);
    obj.image59:setName("image59");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.Arma18);
    obj.label138:setLeft(22.25);
    obj.label138:setTop(20.50);
    obj.label138:setWidth(107.25);
    obj.label138:setHeight(37.88);
    obj.label138:setFontSize(22);
    obj.label138:setHint("Preço da Arma");
    obj.label138:setField("Preco18");
    obj.label138:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setFontColor("yellow");
    obj.label138:setFontFamily("kalam");
    obj.label138:setCursor("handPoint");
    obj.label138:setHitTest(true);
    obj.label138:setName("label138");

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.Arma18);
    obj.image60:setLeft(41.38);
    obj.image60:setTop(61.75);
    obj.image60:setWidth(67.88);
    obj.image60:setHeight(30);
    obj.image60:setCursor("handPoint");
    obj.image60:setHitTest(true);
    obj.image60:setHint("Clique aqui para comprar");
    obj.image60:setName("image60");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.Arma18);
    obj.image61:setLeft(2.56);
    obj.image61:setTop(93.00);
    obj.image61:setWidth(136.69);
    obj.image61:setHeight(77.69);
    obj.image61:setStyle("proportional");
    obj.image61:setCenter(true);
    obj.image61:setEditable(true);
    obj.image61:setField("ImagemArma18");
    obj.image61:setName("image61");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.Arma18);
    obj.label139:setLeft(197);
    obj.label139:setTop(10);
    obj.label139:setWidth(249.25);
    obj.label139:setHeight(39);
    obj.label139:setFontSize(22);
    obj.label139:setField("ItemNome18");
    lfm_setPropAsString(obj.label139, "fontStyle",  "bold");
    obj.label139:setFontColor("black");
    obj.label139:setFontFamily("kalam");
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.Arma18);
    obj.label140:setLeft(207.88);
    obj.label140:setTop(51);
    obj.label140:setWidth(49.88);
    obj.label140:setHeight(31.38);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setField("Iniciativa18");
    obj.label140:setFontSize(19);
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");
    obj.label140:setFontColor("black");
    obj.label140:setFontFamily("kalam");
    obj.label140:setName("label140");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.Arma18);
    obj.label141:setLeft(182.88);
    obj.label141:setTop(90);
    obj.label141:setWidth(50.88);
    obj.label141:setHeight(31.38);
    obj.label141:setHorzTextAlign("center");
    obj.label141:setField("DanoItem18");
    obj.label141:setFontSize(19);
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");
    obj.label141:setFontColor("black");
    obj.label141:setFontFamily("kalam");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.Arma18);
    obj.label142:setLeft(195.88);
    obj.label142:setTop(128);
    obj.label142:setWidth(50.88);
    obj.label142:setHeight(32);
    obj.label142:setHorzTextAlign("center");
    obj.label142:setField("Alcance18");
    obj.label142:setFontSize(15);
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");
    obj.label142:setFontColor("black");
    obj.label142:setFontFamily("kalam");
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.Arma18);
    obj.label143:setLeft(317.88);
    obj.label143:setTop(49);
    obj.label143:setWidth(68.88);
    obj.label143:setHeight(32);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setField("Cadencia18");
    obj.label143:setFontSize(19);
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");
    obj.label143:setFontColor("black");
    obj.label143:setFontFamily("kalam");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.Arma18);
    obj.label144:setLeft(317.88);
    obj.label144:setTop(89);
    obj.label144:setWidth(68.88);
    obj.label144:setHeight(32);
    obj.label144:setHorzTextAlign("center");
    obj.label144:setField("Municao18");
    obj.label144:setFontSize(19);
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");
    obj.label144:setFontColor("black");
    obj.label144:setFontFamily("kalam");
    obj.label144:setName("label144");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.Arma18);
    obj.label145:setLeft(317.88);
    obj.label145:setTop(125);
    obj.label145:setWidth(48.12);
    obj.label145:setHeight(32);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setField("ClasseDeDureza18");
    obj.label145:setFontSize(19);
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");
    obj.label145:setFontColor("black");
    obj.label145:setFontFamily("kalam");
    obj.label145:setName("label145");

    obj.Arma19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma19:setParent(obj.scrollBox1);
    obj.Arma19:setName("Arma19");
    obj.Arma19:setWidth(480);
    obj.Arma19:setHeight(174);
    obj.Arma19:setLeft(413);
    obj.Arma19:setTop(1180);

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.Arma19);
    obj.image62:setSRC("images/Loja.png");
    obj.image62:setLeft(0);
    obj.image62:setTop(0);
    obj.image62:setWidth(399);
    obj.image62:setHeight(174);
    obj.image62:setName("image62");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.Arma19);
    obj.label146:setLeft(22.25);
    obj.label146:setTop(20.50);
    obj.label146:setWidth(107.25);
    obj.label146:setHeight(37.88);
    obj.label146:setFontSize(22);
    obj.label146:setHint("Preço da Arma");
    obj.label146:setField("Preco19");
    obj.label146:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");
    obj.label146:setFontColor("yellow");
    obj.label146:setFontFamily("kalam");
    obj.label146:setCursor("handPoint");
    obj.label146:setHitTest(true);
    obj.label146:setName("label146");

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.Arma19);
    obj.image63:setLeft(41.38);
    obj.image63:setTop(61.75);
    obj.image63:setWidth(67.88);
    obj.image63:setHeight(30);
    obj.image63:setCursor("handPoint");
    obj.image63:setHitTest(true);
    obj.image63:setHint("Clique aqui para comprar");
    obj.image63:setName("image63");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.Arma19);
    obj.image64:setLeft(2.56);
    obj.image64:setTop(93.00);
    obj.image64:setWidth(136.69);
    obj.image64:setHeight(77.69);
    obj.image64:setStyle("proportional");
    obj.image64:setCenter(true);
    obj.image64:setEditable(true);
    obj.image64:setField("ImagemArma19");
    obj.image64:setName("image64");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.Arma19);
    obj.label147:setLeft(197);
    obj.label147:setTop(10);
    obj.label147:setWidth(249.25);
    obj.label147:setHeight(39);
    obj.label147:setFontSize(22);
    obj.label147:setField("ItemNome19");
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");
    obj.label147:setFontColor("black");
    obj.label147:setFontFamily("kalam");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.Arma19);
    obj.label148:setLeft(207.88);
    obj.label148:setTop(51);
    obj.label148:setWidth(49.88);
    obj.label148:setHeight(31.38);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setField("Iniciativa19");
    obj.label148:setFontSize(19);
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");
    obj.label148:setFontColor("black");
    obj.label148:setFontFamily("kalam");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.Arma19);
    obj.label149:setLeft(182.88);
    obj.label149:setTop(90);
    obj.label149:setWidth(50.88);
    obj.label149:setHeight(31.38);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setField("DanoItem19");
    obj.label149:setFontSize(19);
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");
    obj.label149:setFontColor("black");
    obj.label149:setFontFamily("kalam");
    obj.label149:setName("label149");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.Arma19);
    obj.label150:setLeft(195.88);
    obj.label150:setTop(128);
    obj.label150:setWidth(50.88);
    obj.label150:setHeight(32);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setField("Alcance19");
    obj.label150:setFontSize(15);
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setFontColor("black");
    obj.label150:setFontFamily("kalam");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.Arma19);
    obj.label151:setLeft(317.88);
    obj.label151:setTop(49);
    obj.label151:setWidth(68.88);
    obj.label151:setHeight(32);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setField("Cadencia19");
    obj.label151:setFontSize(19);
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");
    obj.label151:setFontColor("black");
    obj.label151:setFontFamily("kalam");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.Arma19);
    obj.label152:setLeft(317.88);
    obj.label152:setTop(89);
    obj.label152:setWidth(68.88);
    obj.label152:setHeight(32);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setField("Municao19");
    obj.label152:setFontSize(19);
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");
    obj.label152:setFontColor("black");
    obj.label152:setFontFamily("kalam");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.Arma19);
    obj.label153:setLeft(317.88);
    obj.label153:setTop(125);
    obj.label153:setWidth(48.12);
    obj.label153:setHeight(32);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setField("ClasseDeDureza19");
    obj.label153:setFontSize(19);
    lfm_setPropAsString(obj.label153, "fontStyle",  "bold");
    obj.label153:setFontColor("black");
    obj.label153:setFontFamily("kalam");
    obj.label153:setName("label153");

    obj.Arma20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma20:setParent(obj.scrollBox1);
    obj.Arma20:setName("Arma20");
    obj.Arma20:setWidth(480);
    obj.Arma20:setHeight(174);
    obj.Arma20:setLeft(413);
    obj.Arma20:setTop(1362);

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.Arma20);
    obj.image65:setSRC("images/Loja.png");
    obj.image65:setLeft(0);
    obj.image65:setTop(0);
    obj.image65:setWidth(399);
    obj.image65:setHeight(174);
    obj.image65:setName("image65");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.Arma20);
    obj.label154:setLeft(22.25);
    obj.label154:setTop(20.50);
    obj.label154:setWidth(107.25);
    obj.label154:setHeight(37.88);
    obj.label154:setFontSize(22);
    obj.label154:setHint("Preço da Arma");
    obj.label154:setField("Preco20");
    obj.label154:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label154, "fontStyle",  "bold");
    obj.label154:setFontColor("yellow");
    obj.label154:setFontFamily("kalam");
    obj.label154:setCursor("handPoint");
    obj.label154:setHitTest(true);
    obj.label154:setName("label154");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.Arma20);
    obj.image66:setLeft(41.38);
    obj.image66:setTop(61.75);
    obj.image66:setWidth(67.88);
    obj.image66:setHeight(30);
    obj.image66:setCursor("handPoint");
    obj.image66:setHitTest(true);
    obj.image66:setHint("Clique aqui para comprar");
    obj.image66:setName("image66");

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.Arma20);
    obj.image67:setLeft(2.56);
    obj.image67:setTop(93.00);
    obj.image67:setWidth(136.69);
    obj.image67:setHeight(77.69);
    obj.image67:setStyle("proportional");
    obj.image67:setCenter(true);
    obj.image67:setEditable(true);
    obj.image67:setField("ImagemArma20");
    obj.image67:setName("image67");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.Arma20);
    obj.label155:setLeft(197);
    obj.label155:setTop(10);
    obj.label155:setWidth(249.25);
    obj.label155:setHeight(39);
    obj.label155:setFontSize(22);
    obj.label155:setField("ItemNome20");
    lfm_setPropAsString(obj.label155, "fontStyle",  "bold");
    obj.label155:setFontColor("black");
    obj.label155:setFontFamily("kalam");
    obj.label155:setName("label155");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.Arma20);
    obj.label156:setLeft(207.88);
    obj.label156:setTop(51);
    obj.label156:setWidth(49.88);
    obj.label156:setHeight(31.38);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setField("Iniciativa20");
    obj.label156:setFontSize(19);
    lfm_setPropAsString(obj.label156, "fontStyle",  "bold");
    obj.label156:setFontColor("black");
    obj.label156:setFontFamily("kalam");
    obj.label156:setName("label156");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.Arma20);
    obj.label157:setLeft(182.88);
    obj.label157:setTop(90);
    obj.label157:setWidth(50.88);
    obj.label157:setHeight(31.38);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setField("DanoItem20");
    obj.label157:setFontSize(19);
    lfm_setPropAsString(obj.label157, "fontStyle",  "bold");
    obj.label157:setFontColor("black");
    obj.label157:setFontFamily("kalam");
    obj.label157:setName("label157");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.Arma20);
    obj.label158:setLeft(195.88);
    obj.label158:setTop(128);
    obj.label158:setWidth(50.88);
    obj.label158:setHeight(32);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setField("Alcance20");
    obj.label158:setFontSize(15);
    lfm_setPropAsString(obj.label158, "fontStyle",  "bold");
    obj.label158:setFontColor("black");
    obj.label158:setFontFamily("kalam");
    obj.label158:setName("label158");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.Arma20);
    obj.label159:setLeft(317.88);
    obj.label159:setTop(49);
    obj.label159:setWidth(68.88);
    obj.label159:setHeight(32);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setField("Cadencia20");
    obj.label159:setFontSize(19);
    lfm_setPropAsString(obj.label159, "fontStyle",  "bold");
    obj.label159:setFontColor("black");
    obj.label159:setFontFamily("kalam");
    obj.label159:setName("label159");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.Arma20);
    obj.label160:setLeft(317.88);
    obj.label160:setTop(89);
    obj.label160:setWidth(68.88);
    obj.label160:setHeight(32);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setField("Municao20");
    obj.label160:setFontSize(19);
    lfm_setPropAsString(obj.label160, "fontStyle",  "bold");
    obj.label160:setFontColor("black");
    obj.label160:setFontFamily("kalam");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.Arma20);
    obj.label161:setLeft(317.88);
    obj.label161:setTop(125);
    obj.label161:setWidth(48.12);
    obj.label161:setHeight(32);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setField("ClasseDeDureza20");
    obj.label161:setFontSize(19);
    lfm_setPropAsString(obj.label161, "fontStyle",  "bold");
    obj.label161:setFontColor("black");
    obj.label161:setFontFamily("kalam");
    obj.label161:setName("label161");

    obj.Arma21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma21:setParent(obj.scrollBox1);
    obj.Arma21:setName("Arma21");
    obj.Arma21:setWidth(480);
    obj.Arma21:setHeight(174);
    obj.Arma21:setLeft(413);
    obj.Arma21:setTop(1544);

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.Arma21);
    obj.image68:setSRC("images/Loja.png");
    obj.image68:setLeft(0);
    obj.image68:setTop(0);
    obj.image68:setWidth(399);
    obj.image68:setHeight(174);
    obj.image68:setName("image68");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.Arma21);
    obj.label162:setLeft(22.25);
    obj.label162:setTop(20.50);
    obj.label162:setWidth(107.25);
    obj.label162:setHeight(37.88);
    obj.label162:setFontSize(22);
    obj.label162:setHint("Preço da Arma");
    obj.label162:setField("Preco21");
    obj.label162:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label162, "fontStyle",  "bold");
    obj.label162:setFontColor("yellow");
    obj.label162:setFontFamily("kalam");
    obj.label162:setCursor("handPoint");
    obj.label162:setHitTest(true);
    obj.label162:setName("label162");

    obj.image69 = GUI.fromHandle(_obj_newObject("image"));
    obj.image69:setParent(obj.Arma21);
    obj.image69:setLeft(41.38);
    obj.image69:setTop(61.75);
    obj.image69:setWidth(67.88);
    obj.image69:setHeight(30);
    obj.image69:setCursor("handPoint");
    obj.image69:setHitTest(true);
    obj.image69:setHint("Clique aqui para comprar");
    obj.image69:setName("image69");

    obj.image70 = GUI.fromHandle(_obj_newObject("image"));
    obj.image70:setParent(obj.Arma21);
    obj.image70:setLeft(2.56);
    obj.image70:setTop(93.00);
    obj.image70:setWidth(136.69);
    obj.image70:setHeight(77.69);
    obj.image70:setStyle("proportional");
    obj.image70:setCenter(true);
    obj.image70:setEditable(true);
    obj.image70:setField("ImagemArma21");
    obj.image70:setName("image70");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.Arma21);
    obj.label163:setLeft(197);
    obj.label163:setTop(10);
    obj.label163:setWidth(249.25);
    obj.label163:setHeight(39);
    obj.label163:setFontSize(22);
    obj.label163:setField("ItemNome21");
    lfm_setPropAsString(obj.label163, "fontStyle",  "bold");
    obj.label163:setFontColor("black");
    obj.label163:setFontFamily("kalam");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.Arma21);
    obj.label164:setLeft(207.88);
    obj.label164:setTop(51);
    obj.label164:setWidth(49.88);
    obj.label164:setHeight(31.38);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setField("Iniciativa21");
    obj.label164:setFontSize(19);
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");
    obj.label164:setFontColor("black");
    obj.label164:setFontFamily("kalam");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.Arma21);
    obj.label165:setLeft(182.88);
    obj.label165:setTop(90);
    obj.label165:setWidth(50.88);
    obj.label165:setHeight(31.38);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setField("DanoItem21");
    obj.label165:setFontSize(19);
    lfm_setPropAsString(obj.label165, "fontStyle",  "bold");
    obj.label165:setFontColor("black");
    obj.label165:setFontFamily("kalam");
    obj.label165:setName("label165");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.Arma21);
    obj.label166:setLeft(195.88);
    obj.label166:setTop(128);
    obj.label166:setWidth(50.88);
    obj.label166:setHeight(32);
    obj.label166:setHorzTextAlign("center");
    obj.label166:setField("Alcance21");
    obj.label166:setFontSize(15);
    lfm_setPropAsString(obj.label166, "fontStyle",  "bold");
    obj.label166:setFontColor("black");
    obj.label166:setFontFamily("kalam");
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.Arma21);
    obj.label167:setLeft(317.88);
    obj.label167:setTop(49);
    obj.label167:setWidth(68.88);
    obj.label167:setHeight(32);
    obj.label167:setHorzTextAlign("center");
    obj.label167:setField("Cadencia21");
    obj.label167:setFontSize(19);
    lfm_setPropAsString(obj.label167, "fontStyle",  "bold");
    obj.label167:setFontColor("black");
    obj.label167:setFontFamily("kalam");
    obj.label167:setName("label167");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.Arma21);
    obj.label168:setLeft(317.88);
    obj.label168:setTop(89);
    obj.label168:setWidth(68.88);
    obj.label168:setHeight(32);
    obj.label168:setHorzTextAlign("center");
    obj.label168:setField("Municao21");
    obj.label168:setFontSize(19);
    lfm_setPropAsString(obj.label168, "fontStyle",  "bold");
    obj.label168:setFontColor("black");
    obj.label168:setFontFamily("kalam");
    obj.label168:setName("label168");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.Arma21);
    obj.label169:setLeft(317.88);
    obj.label169:setTop(125);
    obj.label169:setWidth(48.12);
    obj.label169:setHeight(32);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setField("ClasseDeDureza21");
    obj.label169:setFontSize(19);
    lfm_setPropAsString(obj.label169, "fontStyle",  "bold");
    obj.label169:setFontColor("black");
    obj.label169:setFontFamily("kalam");
    obj.label169:setName("label169");

    obj.Arma22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma22:setParent(obj.scrollBox1);
    obj.Arma22:setName("Arma22");
    obj.Arma22:setWidth(480);
    obj.Arma22:setHeight(174);
    obj.Arma22:setLeft(413);
    obj.Arma22:setTop(1726);

    obj.image71 = GUI.fromHandle(_obj_newObject("image"));
    obj.image71:setParent(obj.Arma22);
    obj.image71:setSRC("images/Loja.png");
    obj.image71:setLeft(0);
    obj.image71:setTop(0);
    obj.image71:setWidth(399);
    obj.image71:setHeight(174);
    obj.image71:setName("image71");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.Arma22);
    obj.label170:setLeft(22.25);
    obj.label170:setTop(20.50);
    obj.label170:setWidth(107.25);
    obj.label170:setHeight(37.88);
    obj.label170:setFontSize(22);
    obj.label170:setHint("Preço da Arma");
    obj.label170:setField("Preco22");
    obj.label170:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label170, "fontStyle",  "bold");
    obj.label170:setFontColor("yellow");
    obj.label170:setFontFamily("kalam");
    obj.label170:setCursor("handPoint");
    obj.label170:setHitTest(true);
    obj.label170:setName("label170");

    obj.image72 = GUI.fromHandle(_obj_newObject("image"));
    obj.image72:setParent(obj.Arma22);
    obj.image72:setLeft(41.38);
    obj.image72:setTop(61.75);
    obj.image72:setWidth(67.88);
    obj.image72:setHeight(30);
    obj.image72:setCursor("handPoint");
    obj.image72:setHitTest(true);
    obj.image72:setHint("Clique aqui para comprar");
    obj.image72:setName("image72");

    obj.image73 = GUI.fromHandle(_obj_newObject("image"));
    obj.image73:setParent(obj.Arma22);
    obj.image73:setLeft(2.56);
    obj.image73:setTop(93.00);
    obj.image73:setWidth(136.69);
    obj.image73:setHeight(77.69);
    obj.image73:setStyle("proportional");
    obj.image73:setCenter(true);
    obj.image73:setEditable(true);
    obj.image73:setField("ImagemArma22");
    obj.image73:setName("image73");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.Arma22);
    obj.label171:setLeft(197);
    obj.label171:setTop(10);
    obj.label171:setWidth(249.25);
    obj.label171:setHeight(39);
    obj.label171:setFontSize(22);
    obj.label171:setField("ItemNome22");
    lfm_setPropAsString(obj.label171, "fontStyle",  "bold");
    obj.label171:setFontColor("black");
    obj.label171:setFontFamily("kalam");
    obj.label171:setName("label171");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.Arma22);
    obj.label172:setLeft(207.88);
    obj.label172:setTop(51);
    obj.label172:setWidth(49.88);
    obj.label172:setHeight(31.38);
    obj.label172:setHorzTextAlign("center");
    obj.label172:setField("Iniciativa22");
    obj.label172:setFontSize(19);
    lfm_setPropAsString(obj.label172, "fontStyle",  "bold");
    obj.label172:setFontColor("black");
    obj.label172:setFontFamily("kalam");
    obj.label172:setName("label172");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.Arma22);
    obj.label173:setLeft(182.88);
    obj.label173:setTop(90);
    obj.label173:setWidth(50.88);
    obj.label173:setHeight(31.38);
    obj.label173:setHorzTextAlign("center");
    obj.label173:setField("DanoItem22");
    obj.label173:setFontSize(12);
    lfm_setPropAsString(obj.label173, "fontStyle",  "bold");
    obj.label173:setFontColor("black");
    obj.label173:setFontFamily("kalam");
    obj.label173:setName("label173");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.Arma22);
    obj.label174:setLeft(195.88);
    obj.label174:setTop(128);
    obj.label174:setWidth(50.88);
    obj.label174:setHeight(32);
    obj.label174:setHorzTextAlign("center");
    obj.label174:setField("Alcance22");
    obj.label174:setFontSize(15);
    lfm_setPropAsString(obj.label174, "fontStyle",  "bold");
    obj.label174:setFontColor("black");
    obj.label174:setFontFamily("kalam");
    obj.label174:setName("label174");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.Arma22);
    obj.label175:setLeft(317.88);
    obj.label175:setTop(49);
    obj.label175:setWidth(68.88);
    obj.label175:setHeight(32);
    obj.label175:setHorzTextAlign("center");
    obj.label175:setField("Cadencia22");
    obj.label175:setFontSize(19);
    lfm_setPropAsString(obj.label175, "fontStyle",  "bold");
    obj.label175:setFontColor("black");
    obj.label175:setFontFamily("kalam");
    obj.label175:setName("label175");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.Arma22);
    obj.label176:setLeft(317.88);
    obj.label176:setTop(89);
    obj.label176:setWidth(68.88);
    obj.label176:setHeight(32);
    obj.label176:setHorzTextAlign("center");
    obj.label176:setField("Municao22");
    obj.label176:setFontSize(19);
    lfm_setPropAsString(obj.label176, "fontStyle",  "bold");
    obj.label176:setFontColor("black");
    obj.label176:setFontFamily("kalam");
    obj.label176:setName("label176");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.Arma22);
    obj.label177:setLeft(317.88);
    obj.label177:setTop(125);
    obj.label177:setWidth(48.12);
    obj.label177:setHeight(32);
    obj.label177:setHorzTextAlign("center");
    obj.label177:setField("ClasseDeDureza22");
    obj.label177:setFontSize(19);
    lfm_setPropAsString(obj.label177, "fontStyle",  "bold");
    obj.label177:setFontColor("black");
    obj.label177:setFontFamily("kalam");
    obj.label177:setName("label177");

    obj.Arma23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma23:setParent(obj.scrollBox1);
    obj.Arma23:setName("Arma23");
    obj.Arma23:setWidth(480);
    obj.Arma23:setHeight(174);
    obj.Arma23:setLeft(413);
    obj.Arma23:setTop(1908);

    obj.image74 = GUI.fromHandle(_obj_newObject("image"));
    obj.image74:setParent(obj.Arma23);
    obj.image74:setSRC("images/Loja.png");
    obj.image74:setLeft(0);
    obj.image74:setTop(0);
    obj.image74:setWidth(399);
    obj.image74:setHeight(174);
    obj.image74:setName("image74");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.Arma23);
    obj.label178:setLeft(22.25);
    obj.label178:setTop(20.50);
    obj.label178:setWidth(107.25);
    obj.label178:setHeight(37.88);
    obj.label178:setFontSize(22);
    obj.label178:setHint("Preço da Arma");
    obj.label178:setField("Preco23");
    obj.label178:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label178, "fontStyle",  "bold");
    obj.label178:setFontColor("yellow");
    obj.label178:setFontFamily("kalam");
    obj.label178:setCursor("handPoint");
    obj.label178:setHitTest(true);
    obj.label178:setName("label178");

    obj.image75 = GUI.fromHandle(_obj_newObject("image"));
    obj.image75:setParent(obj.Arma23);
    obj.image75:setLeft(41.38);
    obj.image75:setTop(61.75);
    obj.image75:setWidth(67.88);
    obj.image75:setHeight(30);
    obj.image75:setCursor("handPoint");
    obj.image75:setHitTest(true);
    obj.image75:setHint("Clique aqui para comprar");
    obj.image75:setName("image75");

    obj.image76 = GUI.fromHandle(_obj_newObject("image"));
    obj.image76:setParent(obj.Arma23);
    obj.image76:setLeft(2.56);
    obj.image76:setTop(93.00);
    obj.image76:setWidth(136.69);
    obj.image76:setHeight(77.69);
    obj.image76:setStyle("proportional");
    obj.image76:setCenter(true);
    obj.image76:setEditable(true);
    obj.image76:setField("ImagemArma23");
    obj.image76:setName("image76");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.Arma23);
    obj.label179:setLeft(197);
    obj.label179:setTop(10);
    obj.label179:setWidth(249.25);
    obj.label179:setHeight(39);
    obj.label179:setFontSize(22);
    obj.label179:setField("ItemNome23");
    lfm_setPropAsString(obj.label179, "fontStyle",  "bold");
    obj.label179:setFontColor("black");
    obj.label179:setFontFamily("kalam");
    obj.label179:setName("label179");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.Arma23);
    obj.label180:setLeft(207.88);
    obj.label180:setTop(51);
    obj.label180:setWidth(49.88);
    obj.label180:setHeight(31.38);
    obj.label180:setHorzTextAlign("center");
    obj.label180:setField("Iniciativa23");
    obj.label180:setFontSize(19);
    lfm_setPropAsString(obj.label180, "fontStyle",  "bold");
    obj.label180:setFontColor("black");
    obj.label180:setFontFamily("kalam");
    obj.label180:setName("label180");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.Arma23);
    obj.label181:setLeft(182.88);
    obj.label181:setTop(90);
    obj.label181:setWidth(50.88);
    obj.label181:setHeight(31.38);
    obj.label181:setHorzTextAlign("center");
    obj.label181:setField("DanoItem23");
    obj.label181:setFontSize(12);
    lfm_setPropAsString(obj.label181, "fontStyle",  "bold");
    obj.label181:setFontColor("black");
    obj.label181:setFontFamily("kalam");
    obj.label181:setName("label181");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.Arma23);
    obj.label182:setLeft(195.88);
    obj.label182:setTop(128);
    obj.label182:setWidth(50.88);
    obj.label182:setHeight(32);
    obj.label182:setHorzTextAlign("center");
    obj.label182:setField("Alcance23");
    obj.label182:setFontSize(15);
    lfm_setPropAsString(obj.label182, "fontStyle",  "bold");
    obj.label182:setFontColor("black");
    obj.label182:setFontFamily("kalam");
    obj.label182:setName("label182");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.Arma23);
    obj.label183:setLeft(317.88);
    obj.label183:setTop(49);
    obj.label183:setWidth(68.88);
    obj.label183:setHeight(32);
    obj.label183:setHorzTextAlign("center");
    obj.label183:setField("Cadencia23");
    obj.label183:setFontSize(19);
    lfm_setPropAsString(obj.label183, "fontStyle",  "bold");
    obj.label183:setFontColor("black");
    obj.label183:setFontFamily("kalam");
    obj.label183:setName("label183");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.Arma23);
    obj.label184:setLeft(317.88);
    obj.label184:setTop(89);
    obj.label184:setWidth(68.88);
    obj.label184:setHeight(32);
    obj.label184:setHorzTextAlign("center");
    obj.label184:setField("Municao23");
    obj.label184:setFontSize(19);
    lfm_setPropAsString(obj.label184, "fontStyle",  "bold");
    obj.label184:setFontColor("black");
    obj.label184:setFontFamily("kalam");
    obj.label184:setName("label184");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.Arma23);
    obj.label185:setLeft(317.88);
    obj.label185:setTop(125);
    obj.label185:setWidth(48.12);
    obj.label185:setHeight(32);
    obj.label185:setHorzTextAlign("center");
    obj.label185:setField("ClasseDeDureza23");
    obj.label185:setFontSize(19);
    lfm_setPropAsString(obj.label185, "fontStyle",  "bold");
    obj.label185:setFontColor("black");
    obj.label185:setFontFamily("kalam");
    obj.label185:setName("label185");

    obj.Arma24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma24:setParent(obj.scrollBox1);
    obj.Arma24:setName("Arma24");
    obj.Arma24:setWidth(480);
    obj.Arma24:setHeight(174);
    obj.Arma24:setLeft(413);
    obj.Arma24:setTop(2090);

    obj.image77 = GUI.fromHandle(_obj_newObject("image"));
    obj.image77:setParent(obj.Arma24);
    obj.image77:setSRC("images/Loja.png");
    obj.image77:setLeft(0);
    obj.image77:setTop(0);
    obj.image77:setWidth(399);
    obj.image77:setHeight(174);
    obj.image77:setName("image77");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.Arma24);
    obj.label186:setLeft(22.25);
    obj.label186:setTop(20.50);
    obj.label186:setWidth(107.25);
    obj.label186:setHeight(37.88);
    obj.label186:setFontSize(22);
    obj.label186:setHint("Preço da Arma");
    obj.label186:setField("Preco24");
    obj.label186:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label186, "fontStyle",  "bold");
    obj.label186:setFontColor("yellow");
    obj.label186:setFontFamily("kalam");
    obj.label186:setCursor("handPoint");
    obj.label186:setHitTest(true);
    obj.label186:setName("label186");

    obj.image78 = GUI.fromHandle(_obj_newObject("image"));
    obj.image78:setParent(obj.Arma24);
    obj.image78:setLeft(41.38);
    obj.image78:setTop(61.75);
    obj.image78:setWidth(67.88);
    obj.image78:setHeight(30);
    obj.image78:setCursor("handPoint");
    obj.image78:setHitTest(true);
    obj.image78:setHint("Clique aqui para comprar");
    obj.image78:setName("image78");

    obj.image79 = GUI.fromHandle(_obj_newObject("image"));
    obj.image79:setParent(obj.Arma24);
    obj.image79:setLeft(2.56);
    obj.image79:setTop(93.00);
    obj.image79:setWidth(136.69);
    obj.image79:setHeight(77.69);
    obj.image79:setStyle("proportional");
    obj.image79:setCenter(true);
    obj.image79:setEditable(true);
    obj.image79:setField("ImagemArma24");
    obj.image79:setName("image79");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.Arma24);
    obj.label187:setLeft(197);
    obj.label187:setTop(10);
    obj.label187:setWidth(249.25);
    obj.label187:setHeight(39);
    obj.label187:setFontSize(22);
    obj.label187:setField("ItemNome24");
    lfm_setPropAsString(obj.label187, "fontStyle",  "bold");
    obj.label187:setFontColor("black");
    obj.label187:setFontFamily("kalam");
    obj.label187:setName("label187");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.Arma24);
    obj.label188:setLeft(207.88);
    obj.label188:setTop(51);
    obj.label188:setWidth(49.88);
    obj.label188:setHeight(31.38);
    obj.label188:setHorzTextAlign("center");
    obj.label188:setField("Iniciativa24");
    obj.label188:setFontSize(19);
    lfm_setPropAsString(obj.label188, "fontStyle",  "bold");
    obj.label188:setFontColor("black");
    obj.label188:setFontFamily("kalam");
    obj.label188:setName("label188");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.Arma24);
    obj.label189:setLeft(182.88);
    obj.label189:setTop(90);
    obj.label189:setWidth(50.88);
    obj.label189:setHeight(31.38);
    obj.label189:setHorzTextAlign("center");
    obj.label189:setField("DanoItem24");
    obj.label189:setFontSize(12);
    lfm_setPropAsString(obj.label189, "fontStyle",  "bold");
    obj.label189:setFontColor("black");
    obj.label189:setFontFamily("kalam");
    obj.label189:setName("label189");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.Arma24);
    obj.label190:setLeft(195.88);
    obj.label190:setTop(128);
    obj.label190:setWidth(50.88);
    obj.label190:setHeight(32);
    obj.label190:setHorzTextAlign("center");
    obj.label190:setField("Alcance24");
    obj.label190:setFontSize(15);
    lfm_setPropAsString(obj.label190, "fontStyle",  "bold");
    obj.label190:setFontColor("black");
    obj.label190:setFontFamily("kalam");
    obj.label190:setName("label190");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.Arma24);
    obj.label191:setLeft(317.88);
    obj.label191:setTop(49);
    obj.label191:setWidth(68.88);
    obj.label191:setHeight(32);
    obj.label191:setHorzTextAlign("center");
    obj.label191:setField("Cadencia24");
    obj.label191:setFontSize(19);
    lfm_setPropAsString(obj.label191, "fontStyle",  "bold");
    obj.label191:setFontColor("black");
    obj.label191:setFontFamily("kalam");
    obj.label191:setName("label191");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.Arma24);
    obj.label192:setLeft(317.88);
    obj.label192:setTop(89);
    obj.label192:setWidth(68.88);
    obj.label192:setHeight(32);
    obj.label192:setHorzTextAlign("center");
    obj.label192:setField("Municao24");
    obj.label192:setFontSize(19);
    lfm_setPropAsString(obj.label192, "fontStyle",  "bold");
    obj.label192:setFontColor("black");
    obj.label192:setFontFamily("kalam");
    obj.label192:setName("label192");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.Arma24);
    obj.label193:setLeft(317.88);
    obj.label193:setTop(125);
    obj.label193:setWidth(48.12);
    obj.label193:setHeight(32);
    obj.label193:setHorzTextAlign("center");
    obj.label193:setField("ClasseDeDureza24");
    obj.label193:setFontSize(19);
    lfm_setPropAsString(obj.label193, "fontStyle",  "bold");
    obj.label193:setFontColor("black");
    obj.label193:setFontFamily("kalam");
    obj.label193:setName("label193");

    obj.LojaCorpoACorpo = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaCorpoACorpo:setParent(obj);
    obj.LojaCorpoACorpo:setName("LojaCorpoACorpo");
    obj.LojaCorpoACorpo:setAlign("client");
    obj.LojaCorpoACorpo:setVisible(false);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.LojaCorpoACorpo);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox2);
    obj.button3:setText("reset");
    obj.button3:setLeft(303);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox2);
    obj.button4:setText("ADD");
    obj.button4:setLeft(303);
    obj.button4:setTop(20);
    obj.button4:setName("button4");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox2);
    obj.layout2:setAlign("client");
    obj.layout2:setName("layout2");

    obj.image80 = GUI.fromHandle(_obj_newObject("image"));
    obj.image80:setParent(obj.layout2);
    obj.image80:setSRC("images/dinheiroArma.png");
    obj.image80:setLeft(0);
    obj.image80:setTop(5);
    obj.image80:setWidth(180.37);
    obj.image80:setHeight(80.25);
    obj.image80:setName("image80");

    obj.labSoma4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma4:setParent(obj.layout2);
    obj.labSoma4:setLeft(26);
    obj.labSoma4:setTop(30);
    lfm_setPropAsString(obj.labSoma4, "fontStyle",  "bold");
    obj.labSoma4:setFontColor("white");
    obj.labSoma4:setFontSize(36);
    obj.labSoma4:setAutoSize(true);
    obj.labSoma4:setWordWrap(false);
    obj.labSoma4:setName("labSoma4");
    obj.labSoma4:setCursor("handPoint");
    obj.labSoma4:setHitTest(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.labSoma4);
    obj.dataLink2:setField("Soma");
    obj.dataLink2:setName("dataLink2");

    obj.image81 = GUI.fromHandle(_obj_newObject("image"));
    obj.image81:setParent(obj.scrollBox2);
    obj.image81:setLeft(0);
    obj.image81:setTop(0);
    obj.image81:setWidth(130.37);
    obj.image81:setHeight(62.25);
    obj.image81:setHint("Seu dinheiro");
    obj.image81:setCursor("handPoint");
    obj.image81:setHitTest(true);
    obj.image81:setName("image81");

    obj.image82 = GUI.fromHandle(_obj_newObject("image"));
    obj.image82:setParent(obj.scrollBox2);
    obj.image82:setSRC("images/botaoVoltar.png");
    obj.image82:setLeft(200);
    obj.image82:setTop(29);
    obj.image82:setWidth(50);
    obj.image82:setHeight(50);
    obj.image82:setCursor("handPoint");
    obj.image82:setHint("Clique aqui para voltar");
    obj.image82:setHitTest(true);
    obj.image82:setName("image82");

    obj.CorpoACorpo = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo:setParent(obj.scrollBox2);
    obj.CorpoACorpo:setName("CorpoACorpo");
    obj.CorpoACorpo:setWidth(480);
    obj.CorpoACorpo:setHeight(174);
    obj.CorpoACorpo:setLeft(0);
    obj.CorpoACorpo:setTop(88);

    obj.image83 = GUI.fromHandle(_obj_newObject("image"));
    obj.image83:setParent(obj.CorpoACorpo);
    obj.image83:setSRC("images/LojaCorpoACorpo.png");
    obj.image83:setLeft(0);
    obj.image83:setTop(0);
    obj.image83:setWidth(399);
    obj.image83:setHeight(174);
    obj.image83:setName("image83");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.CorpoACorpo);
    obj.label194:setLeft(22.25);
    obj.label194:setTop(20.50);
    obj.label194:setWidth(107.25);
    obj.label194:setHeight(37.88);
    obj.label194:setFontSize(22);
    obj.label194:setHint("Preço da Arma");
    obj.label194:setField("Preco25");
    obj.label194:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label194, "fontStyle",  "bold");
    obj.label194:setFontColor("yellow");
    obj.label194:setFontFamily("kalam");
    obj.label194:setCursor("handPoint");
    obj.label194:setHitTest(true);
    obj.label194:setName("label194");

    obj.Arma25 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma25:setParent(obj.CorpoACorpo);
    obj.Arma25:setLeft(41.38);
    obj.Arma25:setTop(61.75);
    obj.Arma25:setWidth(67.88);
    obj.Arma25:setHeight(30);
    obj.Arma25:setCursor("handPoint");
    obj.Arma25:setHitTest(true);
    obj.Arma25:setHint("Clique aqui para comprar");
    obj.Arma25:setName("Arma25");

    obj.image84 = GUI.fromHandle(_obj_newObject("image"));
    obj.image84:setParent(obj.CorpoACorpo);
    obj.image84:setLeft(2.56);
    obj.image84:setTop(93.00);
    obj.image84:setWidth(136.69);
    obj.image84:setHeight(77.69);
    obj.image84:setStyle("proportional");
    obj.image84:setCenter(true);
    obj.image84:setEditable(true);
    obj.image84:setField("ImagemArma25");
    obj.image84:setName("image84");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.CorpoACorpo);
    obj.label195:setLeft(197);
    obj.label195:setTop(10);
    obj.label195:setWidth(249.25);
    obj.label195:setHeight(39);
    obj.label195:setFontSize(22);
    obj.label195:setField("ItemNome25");
    lfm_setPropAsString(obj.label195, "fontStyle",  "bold");
    obj.label195:setFontColor("black");
    obj.label195:setFontFamily("kalam");
    obj.label195:setName("label195");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.CorpoACorpo);
    obj.label196:setLeft(207.88);
    obj.label196:setTop(51);
    obj.label196:setWidth(49.88);
    obj.label196:setHeight(31.38);
    obj.label196:setHorzTextAlign("center");
    obj.label196:setField("Iniciativa25");
    obj.label196:setFontSize(19);
    lfm_setPropAsString(obj.label196, "fontStyle",  "bold");
    obj.label196:setFontColor("black");
    obj.label196:setFontFamily("kalam");
    obj.label196:setName("label196");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.CorpoACorpo);
    obj.label197:setLeft(182.88);
    obj.label197:setTop(90);
    obj.label197:setWidth(50.88);
    obj.label197:setHeight(31.38);
    obj.label197:setHorzTextAlign("center");
    obj.label197:setField("DanoItem25");
    obj.label197:setFontSize(19);
    lfm_setPropAsString(obj.label197, "fontStyle",  "bold");
    obj.label197:setFontColor("black");
    obj.label197:setFontFamily("kalam");
    obj.label197:setName("label197");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.CorpoACorpo);
    obj.label198:setLeft(195.88);
    obj.label198:setTop(128);
    obj.label198:setWidth(50.88);
    obj.label198:setHeight(32);
    obj.label198:setHorzTextAlign("center");
    obj.label198:setField("Golpear25");
    obj.label198:setFontSize(15);
    lfm_setPropAsString(obj.label198, "fontStyle",  "bold");
    obj.label198:setFontColor("black");
    obj.label198:setFontFamily("kalam");
    obj.label198:setName("label198");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.CorpoACorpo);
    obj.label199:setLeft(317.88);
    obj.label199:setTop(49);
    obj.label199:setWidth(68.88);
    obj.label199:setHeight(32);
    obj.label199:setHorzTextAlign("center");
    obj.label199:setField("Aparar25");
    obj.label199:setFontSize(19);
    lfm_setPropAsString(obj.label199, "fontStyle",  "bold");
    obj.label199:setFontColor("black");
    obj.label199:setFontFamily("kalam");
    obj.label199:setName("label199");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.CorpoACorpo);
    obj.label200:setLeft(317.88);
    obj.label200:setTop(89);
    obj.label200:setWidth(68.88);
    obj.label200:setHeight(32);
    obj.label200:setHorzTextAlign("center");
    obj.label200:setField("CD25");
    obj.label200:setFontSize(19);
    lfm_setPropAsString(obj.label200, "fontStyle",  "bold");
    obj.label200:setFontColor("black");
    obj.label200:setFontFamily("kalam");
    obj.label200:setName("label200");

    obj.CorpoACorpo26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo26:setParent(obj.scrollBox2);
    obj.CorpoACorpo26:setName("CorpoACorpo26");
    obj.CorpoACorpo26:setWidth(480);
    obj.CorpoACorpo26:setHeight(174);
    obj.CorpoACorpo26:setLeft(0);
    obj.CorpoACorpo26:setTop(270);

    obj.image85 = GUI.fromHandle(_obj_newObject("image"));
    obj.image85:setParent(obj.CorpoACorpo26);
    obj.image85:setSRC("images/LojaCorpoACorpo.png");
    obj.image85:setLeft(0);
    obj.image85:setTop(0);
    obj.image85:setWidth(399);
    obj.image85:setHeight(174);
    obj.image85:setName("image85");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.CorpoACorpo26);
    obj.label201:setLeft(22.25);
    obj.label201:setTop(20.50);
    obj.label201:setWidth(107.25);
    obj.label201:setHeight(37.88);
    obj.label201:setFontSize(22);
    obj.label201:setHint("Preço da Arma");
    obj.label201:setField("Preco26");
    obj.label201:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label201, "fontStyle",  "bold");
    obj.label201:setFontColor("yellow");
    obj.label201:setFontFamily("kalam");
    obj.label201:setCursor("handPoint");
    obj.label201:setHitTest(true);
    obj.label201:setName("label201");

    obj.Arma26 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma26:setParent(obj.CorpoACorpo26);
    obj.Arma26:setLeft(41.38);
    obj.Arma26:setTop(61.75);
    obj.Arma26:setWidth(67.88);
    obj.Arma26:setHeight(30);
    obj.Arma26:setCursor("handPoint");
    obj.Arma26:setHitTest(true);
    obj.Arma26:setHint("Clique aqui para comprar");
    obj.Arma26:setName("Arma26");

    obj.image86 = GUI.fromHandle(_obj_newObject("image"));
    obj.image86:setParent(obj.CorpoACorpo26);
    obj.image86:setLeft(2.56);
    obj.image86:setTop(93.00);
    obj.image86:setWidth(136.69);
    obj.image86:setHeight(77.69);
    obj.image86:setStyle("proportional");
    obj.image86:setCenter(true);
    obj.image86:setEditable(true);
    obj.image86:setField("ImagemArma26");
    obj.image86:setName("image86");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.CorpoACorpo26);
    obj.label202:setLeft(197);
    obj.label202:setTop(10);
    obj.label202:setWidth(249.25);
    obj.label202:setHeight(39);
    obj.label202:setFontSize(22);
    obj.label202:setField("ItemNome26");
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold");
    obj.label202:setFontColor("black");
    obj.label202:setFontFamily("kalam");
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.CorpoACorpo26);
    obj.label203:setLeft(207.88);
    obj.label203:setTop(51);
    obj.label203:setWidth(49.88);
    obj.label203:setHeight(31.38);
    obj.label203:setHorzTextAlign("center");
    obj.label203:setField("Iniciativa26");
    obj.label203:setFontSize(19);
    lfm_setPropAsString(obj.label203, "fontStyle",  "bold");
    obj.label203:setFontColor("black");
    obj.label203:setFontFamily("kalam");
    obj.label203:setName("label203");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.CorpoACorpo26);
    obj.label204:setLeft(182.88);
    obj.label204:setTop(90);
    obj.label204:setWidth(50.88);
    obj.label204:setHeight(31.38);
    obj.label204:setHorzTextAlign("center");
    obj.label204:setField("DanoItem26");
    obj.label204:setFontSize(19);
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold");
    obj.label204:setFontColor("black");
    obj.label204:setFontFamily("kalam");
    obj.label204:setName("label204");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.CorpoACorpo26);
    obj.label205:setLeft(195.88);
    obj.label205:setTop(128);
    obj.label205:setWidth(50.88);
    obj.label205:setHeight(32);
    obj.label205:setHorzTextAlign("center");
    obj.label205:setField("Golpear26");
    obj.label205:setFontSize(15);
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold");
    obj.label205:setFontColor("black");
    obj.label205:setFontFamily("kalam");
    obj.label205:setName("label205");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.CorpoACorpo26);
    obj.label206:setLeft(317.88);
    obj.label206:setTop(49);
    obj.label206:setWidth(68.88);
    obj.label206:setHeight(32);
    obj.label206:setHorzTextAlign("center");
    obj.label206:setField("Aparar26");
    obj.label206:setFontSize(19);
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold");
    obj.label206:setFontColor("black");
    obj.label206:setFontFamily("kalam");
    obj.label206:setName("label206");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.CorpoACorpo26);
    obj.label207:setLeft(317.88);
    obj.label207:setTop(89);
    obj.label207:setWidth(68.88);
    obj.label207:setHeight(32);
    obj.label207:setHorzTextAlign("center");
    obj.label207:setField("CD26");
    obj.label207:setFontSize(19);
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold");
    obj.label207:setFontColor("black");
    obj.label207:setFontFamily("kalam");
    obj.label207:setName("label207");

    obj.CorpoACorpo27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo27:setParent(obj.scrollBox2);
    obj.CorpoACorpo27:setName("CorpoACorpo27");
    obj.CorpoACorpo27:setWidth(480);
    obj.CorpoACorpo27:setHeight(174);
    obj.CorpoACorpo27:setLeft(0);
    obj.CorpoACorpo27:setTop(452);

    obj.image87 = GUI.fromHandle(_obj_newObject("image"));
    obj.image87:setParent(obj.CorpoACorpo27);
    obj.image87:setSRC("images/LojaCorpoACorpo.png");
    obj.image87:setLeft(0);
    obj.image87:setTop(0);
    obj.image87:setWidth(399);
    obj.image87:setHeight(174);
    obj.image87:setName("image87");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.CorpoACorpo27);
    obj.label208:setLeft(22.25);
    obj.label208:setTop(20.50);
    obj.label208:setWidth(107.25);
    obj.label208:setHeight(37.88);
    obj.label208:setFontSize(22);
    obj.label208:setHint("Preço da Arma");
    obj.label208:setField("Preco27");
    obj.label208:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold");
    obj.label208:setFontColor("yellow");
    obj.label208:setFontFamily("kalam");
    obj.label208:setCursor("handPoint");
    obj.label208:setHitTest(true);
    obj.label208:setName("label208");

    obj.Arma27 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma27:setParent(obj.CorpoACorpo27);
    obj.Arma27:setLeft(41.38);
    obj.Arma27:setTop(61.75);
    obj.Arma27:setWidth(67.88);
    obj.Arma27:setHeight(30);
    obj.Arma27:setCursor("handPoint");
    obj.Arma27:setHitTest(true);
    obj.Arma27:setHint("Clique aqui para comprar");
    obj.Arma27:setName("Arma27");

    obj.image88 = GUI.fromHandle(_obj_newObject("image"));
    obj.image88:setParent(obj.CorpoACorpo27);
    obj.image88:setLeft(2.56);
    obj.image88:setTop(93.00);
    obj.image88:setWidth(136.69);
    obj.image88:setHeight(77.69);
    obj.image88:setStyle("proportional");
    obj.image88:setCenter(true);
    obj.image88:setEditable(true);
    obj.image88:setField("ImagemArma27");
    obj.image88:setName("image88");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.CorpoACorpo27);
    obj.label209:setLeft(197);
    obj.label209:setTop(10);
    obj.label209:setWidth(249.25);
    obj.label209:setHeight(39);
    obj.label209:setFontSize(16.8);
    obj.label209:setField("ItemNome27");
    lfm_setPropAsString(obj.label209, "fontStyle",  "bold");
    obj.label209:setFontColor("black");
    obj.label209:setFontFamily("kalam");
    obj.label209:setName("label209");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.CorpoACorpo27);
    obj.label210:setLeft(207.88);
    obj.label210:setTop(51);
    obj.label210:setWidth(49.88);
    obj.label210:setHeight(31.38);
    obj.label210:setHorzTextAlign("center");
    obj.label210:setField("Iniciativa27");
    obj.label210:setFontSize(19);
    lfm_setPropAsString(obj.label210, "fontStyle",  "bold");
    obj.label210:setFontColor("black");
    obj.label210:setFontFamily("kalam");
    obj.label210:setName("label210");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.CorpoACorpo27);
    obj.label211:setLeft(182.88);
    obj.label211:setTop(90);
    obj.label211:setWidth(50.88);
    obj.label211:setHeight(31.38);
    obj.label211:setHorzTextAlign("center");
    obj.label211:setField("DanoItem27");
    obj.label211:setFontSize(19);
    lfm_setPropAsString(obj.label211, "fontStyle",  "bold");
    obj.label211:setFontColor("black");
    obj.label211:setFontFamily("kalam");
    obj.label211:setName("label211");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.CorpoACorpo27);
    obj.label212:setLeft(195.88);
    obj.label212:setTop(128);
    obj.label212:setWidth(50.88);
    obj.label212:setHeight(32);
    obj.label212:setHorzTextAlign("center");
    obj.label212:setField("Golpear27");
    obj.label212:setFontSize(15);
    lfm_setPropAsString(obj.label212, "fontStyle",  "bold");
    obj.label212:setFontColor("black");
    obj.label212:setFontFamily("kalam");
    obj.label212:setName("label212");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.CorpoACorpo27);
    obj.label213:setLeft(317.88);
    obj.label213:setTop(49);
    obj.label213:setWidth(68.88);
    obj.label213:setHeight(32);
    obj.label213:setHorzTextAlign("center");
    obj.label213:setField("Aparar27");
    obj.label213:setFontSize(19);
    lfm_setPropAsString(obj.label213, "fontStyle",  "bold");
    obj.label213:setFontColor("black");
    obj.label213:setFontFamily("kalam");
    obj.label213:setName("label213");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.CorpoACorpo27);
    obj.label214:setLeft(317.88);
    obj.label214:setTop(89);
    obj.label214:setWidth(68.88);
    obj.label214:setHeight(32);
    obj.label214:setHorzTextAlign("center");
    obj.label214:setField("CD27");
    obj.label214:setFontSize(19);
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold");
    obj.label214:setFontColor("black");
    obj.label214:setFontFamily("kalam");
    obj.label214:setName("label214");

    obj.CorpoACorpo28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo28:setParent(obj.scrollBox2);
    obj.CorpoACorpo28:setName("CorpoACorpo28");
    obj.CorpoACorpo28:setWidth(480);
    obj.CorpoACorpo28:setHeight(174);
    obj.CorpoACorpo28:setLeft(0);
    obj.CorpoACorpo28:setTop(634);

    obj.image89 = GUI.fromHandle(_obj_newObject("image"));
    obj.image89:setParent(obj.CorpoACorpo28);
    obj.image89:setSRC("images/LojaCorpoACorpo.png");
    obj.image89:setLeft(0);
    obj.image89:setTop(0);
    obj.image89:setWidth(399);
    obj.image89:setHeight(174);
    obj.image89:setName("image89");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.CorpoACorpo28);
    obj.label215:setLeft(22.25);
    obj.label215:setTop(20.50);
    obj.label215:setWidth(107.25);
    obj.label215:setHeight(37.88);
    obj.label215:setFontSize(22);
    obj.label215:setHint("Preço da Arma");
    obj.label215:setField("Preco28");
    obj.label215:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold");
    obj.label215:setFontColor("yellow");
    obj.label215:setFontFamily("kalam");
    obj.label215:setCursor("handPoint");
    obj.label215:setHitTest(true);
    obj.label215:setName("label215");

    obj.Arma28 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma28:setParent(obj.CorpoACorpo28);
    obj.Arma28:setLeft(41.38);
    obj.Arma28:setTop(61.75);
    obj.Arma28:setWidth(67.88);
    obj.Arma28:setHeight(30);
    obj.Arma28:setCursor("handPoint");
    obj.Arma28:setHitTest(true);
    obj.Arma28:setHint("Clique aqui para comprar");
    obj.Arma28:setName("Arma28");

    obj.image90 = GUI.fromHandle(_obj_newObject("image"));
    obj.image90:setParent(obj.CorpoACorpo28);
    obj.image90:setLeft(2.56);
    obj.image90:setTop(93.00);
    obj.image90:setWidth(136.69);
    obj.image90:setHeight(77.69);
    obj.image90:setStyle("proportional");
    obj.image90:setCenter(true);
    obj.image90:setEditable(true);
    obj.image90:setField("ImagemArma28");
    obj.image90:setName("image90");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.CorpoACorpo28);
    obj.label216:setLeft(197);
    obj.label216:setTop(10);
    obj.label216:setWidth(249.25);
    obj.label216:setHeight(39);
    obj.label216:setFontSize(19);
    obj.label216:setField("ItemNome28");
    lfm_setPropAsString(obj.label216, "fontStyle",  "bold");
    obj.label216:setFontColor("black");
    obj.label216:setFontFamily("kalam");
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.CorpoACorpo28);
    obj.label217:setLeft(207.88);
    obj.label217:setTop(51);
    obj.label217:setWidth(49.88);
    obj.label217:setHeight(31.38);
    obj.label217:setHorzTextAlign("center");
    obj.label217:setField("Iniciativa28");
    obj.label217:setFontSize(19);
    lfm_setPropAsString(obj.label217, "fontStyle",  "bold");
    obj.label217:setFontColor("black");
    obj.label217:setFontFamily("kalam");
    obj.label217:setName("label217");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.CorpoACorpo28);
    obj.label218:setLeft(182.88);
    obj.label218:setTop(90);
    obj.label218:setWidth(50.88);
    obj.label218:setHeight(31.38);
    obj.label218:setHorzTextAlign("center");
    obj.label218:setField("DanoItem28");
    obj.label218:setFontSize(19);
    lfm_setPropAsString(obj.label218, "fontStyle",  "bold");
    obj.label218:setFontColor("black");
    obj.label218:setFontFamily("kalam");
    obj.label218:setName("label218");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.CorpoACorpo28);
    obj.label219:setLeft(195.88);
    obj.label219:setTop(128);
    obj.label219:setWidth(50.88);
    obj.label219:setHeight(32);
    obj.label219:setHorzTextAlign("center");
    obj.label219:setField("Golpear28");
    obj.label219:setFontSize(15);
    lfm_setPropAsString(obj.label219, "fontStyle",  "bold");
    obj.label219:setFontColor("black");
    obj.label219:setFontFamily("kalam");
    obj.label219:setName("label219");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.CorpoACorpo28);
    obj.label220:setLeft(317.88);
    obj.label220:setTop(49);
    obj.label220:setWidth(68.88);
    obj.label220:setHeight(32);
    obj.label220:setHorzTextAlign("center");
    obj.label220:setField("Aparar28");
    obj.label220:setFontSize(19);
    lfm_setPropAsString(obj.label220, "fontStyle",  "bold");
    obj.label220:setFontColor("black");
    obj.label220:setFontFamily("kalam");
    obj.label220:setName("label220");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.CorpoACorpo28);
    obj.label221:setLeft(317.88);
    obj.label221:setTop(89);
    obj.label221:setWidth(68.88);
    obj.label221:setHeight(32);
    obj.label221:setHorzTextAlign("center");
    obj.label221:setField("CD28");
    obj.label221:setFontSize(19);
    lfm_setPropAsString(obj.label221, "fontStyle",  "bold");
    obj.label221:setFontColor("black");
    obj.label221:setFontFamily("kalam");
    obj.label221:setName("label221");

    obj.CorpoACorpo29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo29:setParent(obj.scrollBox2);
    obj.CorpoACorpo29:setName("CorpoACorpo29");
    obj.CorpoACorpo29:setWidth(480);
    obj.CorpoACorpo29:setHeight(174);
    obj.CorpoACorpo29:setLeft(0);
    obj.CorpoACorpo29:setTop(816);

    obj.image91 = GUI.fromHandle(_obj_newObject("image"));
    obj.image91:setParent(obj.CorpoACorpo29);
    obj.image91:setSRC("images/LojaCorpoACorpo.png");
    obj.image91:setLeft(0);
    obj.image91:setTop(0);
    obj.image91:setWidth(399);
    obj.image91:setHeight(174);
    obj.image91:setName("image91");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.CorpoACorpo29);
    obj.label222:setLeft(22.25);
    obj.label222:setTop(20.50);
    obj.label222:setWidth(107.25);
    obj.label222:setHeight(37.88);
    obj.label222:setFontSize(22);
    obj.label222:setHint("Preço da Arma");
    obj.label222:setField("Preco29");
    obj.label222:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label222, "fontStyle",  "bold");
    obj.label222:setFontColor("yellow");
    obj.label222:setFontFamily("kalam");
    obj.label222:setCursor("handPoint");
    obj.label222:setHitTest(true);
    obj.label222:setName("label222");

    obj.Arma29 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma29:setParent(obj.CorpoACorpo29);
    obj.Arma29:setLeft(41.38);
    obj.Arma29:setTop(61.75);
    obj.Arma29:setWidth(67.88);
    obj.Arma29:setHeight(30);
    obj.Arma29:setCursor("handPoint");
    obj.Arma29:setHitTest(true);
    obj.Arma29:setHint("Clique aqui para comprar");
    obj.Arma29:setName("Arma29");

    obj.image92 = GUI.fromHandle(_obj_newObject("image"));
    obj.image92:setParent(obj.CorpoACorpo29);
    obj.image92:setLeft(2.56);
    obj.image92:setTop(93.00);
    obj.image92:setWidth(136.69);
    obj.image92:setHeight(77.69);
    obj.image92:setStyle("proportional");
    obj.image92:setCenter(true);
    obj.image92:setEditable(true);
    obj.image92:setField("ImagemArma29");
    obj.image92:setName("image92");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.CorpoACorpo29);
    obj.label223:setLeft(197);
    obj.label223:setTop(10);
    obj.label223:setWidth(249.25);
    obj.label223:setHeight(39);
    obj.label223:setFontSize(22);
    obj.label223:setField("ItemNome29");
    lfm_setPropAsString(obj.label223, "fontStyle",  "bold");
    obj.label223:setFontColor("black");
    obj.label223:setFontFamily("kalam");
    obj.label223:setName("label223");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.CorpoACorpo29);
    obj.label224:setLeft(207.88);
    obj.label224:setTop(51);
    obj.label224:setWidth(49.88);
    obj.label224:setHeight(31.38);
    obj.label224:setHorzTextAlign("center");
    obj.label224:setField("Iniciativa29");
    obj.label224:setFontSize(19);
    lfm_setPropAsString(obj.label224, "fontStyle",  "bold");
    obj.label224:setFontColor("black");
    obj.label224:setFontFamily("kalam");
    obj.label224:setName("label224");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.CorpoACorpo29);
    obj.label225:setLeft(182.88);
    obj.label225:setTop(90);
    obj.label225:setWidth(50.88);
    obj.label225:setHeight(31.38);
    obj.label225:setHorzTextAlign("center");
    obj.label225:setField("DanoItem29");
    obj.label225:setFontSize(19);
    lfm_setPropAsString(obj.label225, "fontStyle",  "bold");
    obj.label225:setFontColor("black");
    obj.label225:setFontFamily("kalam");
    obj.label225:setName("label225");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.CorpoACorpo29);
    obj.label226:setLeft(195.88);
    obj.label226:setTop(128);
    obj.label226:setWidth(50.88);
    obj.label226:setHeight(32);
    obj.label226:setHorzTextAlign("center");
    obj.label226:setField("Golpear29");
    obj.label226:setFontSize(15);
    lfm_setPropAsString(obj.label226, "fontStyle",  "bold");
    obj.label226:setFontColor("black");
    obj.label226:setFontFamily("kalam");
    obj.label226:setName("label226");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.CorpoACorpo29);
    obj.label227:setLeft(317.88);
    obj.label227:setTop(49);
    obj.label227:setWidth(68.88);
    obj.label227:setHeight(32);
    obj.label227:setHorzTextAlign("center");
    obj.label227:setField("Aparar29");
    obj.label227:setFontSize(19);
    lfm_setPropAsString(obj.label227, "fontStyle",  "bold");
    obj.label227:setFontColor("black");
    obj.label227:setFontFamily("kalam");
    obj.label227:setName("label227");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.CorpoACorpo29);
    obj.label228:setLeft(317.88);
    obj.label228:setTop(89);
    obj.label228:setWidth(68.88);
    obj.label228:setHeight(32);
    obj.label228:setHorzTextAlign("center");
    obj.label228:setField("CD29");
    obj.label228:setFontSize(19);
    lfm_setPropAsString(obj.label228, "fontStyle",  "bold");
    obj.label228:setFontColor("black");
    obj.label228:setFontFamily("kalam");
    obj.label228:setName("label228");

    obj.CorpoACorpo30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo30:setParent(obj.scrollBox2);
    obj.CorpoACorpo30:setName("CorpoACorpo30");
    obj.CorpoACorpo30:setWidth(480);
    obj.CorpoACorpo30:setHeight(174);
    obj.CorpoACorpo30:setLeft(0);
    obj.CorpoACorpo30:setTop(998);

    obj.image93 = GUI.fromHandle(_obj_newObject("image"));
    obj.image93:setParent(obj.CorpoACorpo30);
    obj.image93:setSRC("images/LojaCorpoACorpo.png");
    obj.image93:setLeft(0);
    obj.image93:setTop(0);
    obj.image93:setWidth(399);
    obj.image93:setHeight(174);
    obj.image93:setName("image93");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.CorpoACorpo30);
    obj.label229:setLeft(22.25);
    obj.label229:setTop(20.50);
    obj.label229:setWidth(107.25);
    obj.label229:setHeight(37.88);
    obj.label229:setFontSize(22);
    obj.label229:setHint("Preço da Arma");
    obj.label229:setField("Preco30");
    obj.label229:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label229, "fontStyle",  "bold");
    obj.label229:setFontColor("yellow");
    obj.label229:setFontFamily("kalam");
    obj.label229:setCursor("handPoint");
    obj.label229:setHitTest(true);
    obj.label229:setName("label229");

    obj.Arma30 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma30:setParent(obj.CorpoACorpo30);
    obj.Arma30:setLeft(41.38);
    obj.Arma30:setTop(61.75);
    obj.Arma30:setWidth(67.88);
    obj.Arma30:setHeight(30);
    obj.Arma30:setCursor("handPoint");
    obj.Arma30:setHitTest(true);
    obj.Arma30:setHint("Clique aqui para comprar");
    obj.Arma30:setName("Arma30");

    obj.image94 = GUI.fromHandle(_obj_newObject("image"));
    obj.image94:setParent(obj.CorpoACorpo30);
    obj.image94:setLeft(2.56);
    obj.image94:setTop(93.00);
    obj.image94:setWidth(136.69);
    obj.image94:setHeight(77.69);
    obj.image94:setStyle("proportional");
    obj.image94:setCenter(true);
    obj.image94:setEditable(true);
    obj.image94:setField("ImagemArma30");
    obj.image94:setName("image94");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.CorpoACorpo30);
    obj.label230:setLeft(197);
    obj.label230:setTop(10);
    obj.label230:setWidth(249.25);
    obj.label230:setHeight(39);
    obj.label230:setFontSize(22);
    obj.label230:setField("ItemNome30");
    lfm_setPropAsString(obj.label230, "fontStyle",  "bold");
    obj.label230:setFontColor("black");
    obj.label230:setFontFamily("kalam");
    obj.label230:setName("label230");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.CorpoACorpo30);
    obj.label231:setLeft(207.88);
    obj.label231:setTop(51);
    obj.label231:setWidth(49.88);
    obj.label231:setHeight(31.38);
    obj.label231:setHorzTextAlign("center");
    obj.label231:setField("Iniciativa30");
    obj.label231:setFontSize(19);
    lfm_setPropAsString(obj.label231, "fontStyle",  "bold");
    obj.label231:setFontColor("black");
    obj.label231:setFontFamily("kalam");
    obj.label231:setName("label231");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.CorpoACorpo30);
    obj.label232:setLeft(182.88);
    obj.label232:setTop(90);
    obj.label232:setWidth(50.88);
    obj.label232:setHeight(31.38);
    obj.label232:setHorzTextAlign("center");
    obj.label232:setField("DanoItem30");
    obj.label232:setFontSize(19);
    lfm_setPropAsString(obj.label232, "fontStyle",  "bold");
    obj.label232:setFontColor("black");
    obj.label232:setFontFamily("kalam");
    obj.label232:setName("label232");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.CorpoACorpo30);
    obj.label233:setLeft(195.88);
    obj.label233:setTop(128);
    obj.label233:setWidth(50.88);
    obj.label233:setHeight(32);
    obj.label233:setHorzTextAlign("center");
    obj.label233:setField("Golpear30");
    obj.label233:setFontSize(15);
    lfm_setPropAsString(obj.label233, "fontStyle",  "bold");
    obj.label233:setFontColor("black");
    obj.label233:setFontFamily("kalam");
    obj.label233:setName("label233");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.CorpoACorpo30);
    obj.label234:setLeft(317.88);
    obj.label234:setTop(49);
    obj.label234:setWidth(68.88);
    obj.label234:setHeight(32);
    obj.label234:setHorzTextAlign("center");
    obj.label234:setField("Aparar30");
    obj.label234:setFontSize(19);
    lfm_setPropAsString(obj.label234, "fontStyle",  "bold");
    obj.label234:setFontColor("black");
    obj.label234:setFontFamily("kalam");
    obj.label234:setName("label234");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.CorpoACorpo30);
    obj.label235:setLeft(317.88);
    obj.label235:setTop(89);
    obj.label235:setWidth(68.88);
    obj.label235:setHeight(32);
    obj.label235:setHorzTextAlign("center");
    obj.label235:setField("CD30");
    obj.label235:setFontSize(19);
    lfm_setPropAsString(obj.label235, "fontStyle",  "bold");
    obj.label235:setFontColor("black");
    obj.label235:setFontFamily("kalam");
    obj.label235:setName("label235");

    obj.CorpoACorpo31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo31:setParent(obj.scrollBox2);
    obj.CorpoACorpo31:setName("CorpoACorpo31");
    obj.CorpoACorpo31:setWidth(480);
    obj.CorpoACorpo31:setHeight(174);
    obj.CorpoACorpo31:setLeft(0);
    obj.CorpoACorpo31:setTop(1180);

    obj.image95 = GUI.fromHandle(_obj_newObject("image"));
    obj.image95:setParent(obj.CorpoACorpo31);
    obj.image95:setSRC("images/LojaCorpoACorpo.png");
    obj.image95:setLeft(0);
    obj.image95:setTop(0);
    obj.image95:setWidth(399);
    obj.image95:setHeight(174);
    obj.image95:setName("image95");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.CorpoACorpo31);
    obj.label236:setLeft(22.25);
    obj.label236:setTop(20.50);
    obj.label236:setWidth(107.25);
    obj.label236:setHeight(37.88);
    obj.label236:setFontSize(22);
    obj.label236:setHint("Preço da Arma");
    obj.label236:setField("Preco31");
    obj.label236:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label236, "fontStyle",  "bold");
    obj.label236:setFontColor("yellow");
    obj.label236:setFontFamily("kalam");
    obj.label236:setCursor("handPoint");
    obj.label236:setHitTest(true);
    obj.label236:setName("label236");

    obj.Arma31 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma31:setParent(obj.CorpoACorpo31);
    obj.Arma31:setLeft(41.38);
    obj.Arma31:setTop(61.75);
    obj.Arma31:setWidth(67.88);
    obj.Arma31:setHeight(30);
    obj.Arma31:setCursor("handPoint");
    obj.Arma31:setHitTest(true);
    obj.Arma31:setHint("Clique aqui para comprar");
    obj.Arma31:setName("Arma31");

    obj.image96 = GUI.fromHandle(_obj_newObject("image"));
    obj.image96:setParent(obj.CorpoACorpo31);
    obj.image96:setLeft(2.56);
    obj.image96:setTop(93.00);
    obj.image96:setWidth(136.69);
    obj.image96:setHeight(77.69);
    obj.image96:setStyle("proportional");
    obj.image96:setCenter(true);
    obj.image96:setEditable(true);
    obj.image96:setField("ImagemArma31");
    obj.image96:setName("image96");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.CorpoACorpo31);
    obj.label237:setLeft(197);
    obj.label237:setTop(10);
    obj.label237:setWidth(249.25);
    obj.label237:setHeight(39);
    obj.label237:setFontSize(22);
    obj.label237:setField("ItemNome31");
    lfm_setPropAsString(obj.label237, "fontStyle",  "bold");
    obj.label237:setFontColor("black");
    obj.label237:setFontFamily("kalam");
    obj.label237:setName("label237");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.CorpoACorpo31);
    obj.label238:setLeft(207.88);
    obj.label238:setTop(51);
    obj.label238:setWidth(49.88);
    obj.label238:setHeight(31.38);
    obj.label238:setHorzTextAlign("center");
    obj.label238:setField("Iniciativa31");
    obj.label238:setFontSize(19);
    lfm_setPropAsString(obj.label238, "fontStyle",  "bold");
    obj.label238:setFontColor("black");
    obj.label238:setFontFamily("kalam");
    obj.label238:setName("label238");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.CorpoACorpo31);
    obj.label239:setLeft(182.88);
    obj.label239:setTop(90);
    obj.label239:setWidth(50.88);
    obj.label239:setHeight(31.38);
    obj.label239:setHorzTextAlign("center");
    obj.label239:setField("DanoItem31");
    obj.label239:setFontSize(19);
    lfm_setPropAsString(obj.label239, "fontStyle",  "bold");
    obj.label239:setFontColor("black");
    obj.label239:setFontFamily("kalam");
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.CorpoACorpo31);
    obj.label240:setLeft(195.88);
    obj.label240:setTop(128);
    obj.label240:setWidth(50.88);
    obj.label240:setHeight(32);
    obj.label240:setHorzTextAlign("center");
    obj.label240:setField("Golpear31");
    obj.label240:setFontSize(15);
    lfm_setPropAsString(obj.label240, "fontStyle",  "bold");
    obj.label240:setFontColor("black");
    obj.label240:setFontFamily("kalam");
    obj.label240:setName("label240");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.CorpoACorpo31);
    obj.label241:setLeft(317.88);
    obj.label241:setTop(49);
    obj.label241:setWidth(68.88);
    obj.label241:setHeight(32);
    obj.label241:setHorzTextAlign("center");
    obj.label241:setField("Aparar31");
    obj.label241:setFontSize(19);
    lfm_setPropAsString(obj.label241, "fontStyle",  "bold");
    obj.label241:setFontColor("black");
    obj.label241:setFontFamily("kalam");
    obj.label241:setName("label241");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.CorpoACorpo31);
    obj.label242:setLeft(317.88);
    obj.label242:setTop(89);
    obj.label242:setWidth(68.88);
    obj.label242:setHeight(32);
    obj.label242:setHorzTextAlign("center");
    obj.label242:setField("CD31");
    obj.label242:setFontSize(19);
    lfm_setPropAsString(obj.label242, "fontStyle",  "bold");
    obj.label242:setFontColor("black");
    obj.label242:setFontFamily("kalam");
    obj.label242:setName("label242");

    obj.CorpoACorpo32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo32:setParent(obj.scrollBox2);
    obj.CorpoACorpo32:setName("CorpoACorpo32");
    obj.CorpoACorpo32:setWidth(480);
    obj.CorpoACorpo32:setHeight(174);
    obj.CorpoACorpo32:setLeft(0);
    obj.CorpoACorpo32:setTop(1362);

    obj.image97 = GUI.fromHandle(_obj_newObject("image"));
    obj.image97:setParent(obj.CorpoACorpo32);
    obj.image97:setSRC("images/LojaCorpoACorpo.png");
    obj.image97:setLeft(0);
    obj.image97:setTop(0);
    obj.image97:setWidth(399);
    obj.image97:setHeight(174);
    obj.image97:setName("image97");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.CorpoACorpo32);
    obj.label243:setLeft(22.25);
    obj.label243:setTop(20.50);
    obj.label243:setWidth(107.25);
    obj.label243:setHeight(37.88);
    obj.label243:setFontSize(22);
    obj.label243:setHint("Preço da Arma");
    obj.label243:setField("Preco32");
    obj.label243:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label243, "fontStyle",  "bold");
    obj.label243:setFontColor("yellow");
    obj.label243:setFontFamily("kalam");
    obj.label243:setCursor("handPoint");
    obj.label243:setHitTest(true);
    obj.label243:setName("label243");

    obj.Arma32 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma32:setParent(obj.CorpoACorpo32);
    obj.Arma32:setLeft(41.38);
    obj.Arma32:setTop(61.75);
    obj.Arma32:setWidth(67.88);
    obj.Arma32:setHeight(30);
    obj.Arma32:setCursor("handPoint");
    obj.Arma32:setHitTest(true);
    obj.Arma32:setHint("Clique aqui para comprar");
    obj.Arma32:setName("Arma32");

    obj.image98 = GUI.fromHandle(_obj_newObject("image"));
    obj.image98:setParent(obj.CorpoACorpo32);
    obj.image98:setLeft(2.56);
    obj.image98:setTop(93.00);
    obj.image98:setWidth(136.69);
    obj.image98:setHeight(77.69);
    obj.image98:setStyle("proportional");
    obj.image98:setCenter(true);
    obj.image98:setEditable(true);
    obj.image98:setField("ImagemArma32");
    obj.image98:setName("image98");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.CorpoACorpo32);
    obj.label244:setLeft(197);
    obj.label244:setTop(10);
    obj.label244:setWidth(249.25);
    obj.label244:setHeight(39);
    obj.label244:setFontSize(22);
    obj.label244:setField("ItemNome32");
    lfm_setPropAsString(obj.label244, "fontStyle",  "bold");
    obj.label244:setFontColor("black");
    obj.label244:setFontFamily("kalam");
    obj.label244:setName("label244");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.CorpoACorpo32);
    obj.label245:setLeft(207.88);
    obj.label245:setTop(51);
    obj.label245:setWidth(49.88);
    obj.label245:setHeight(31.38);
    obj.label245:setHorzTextAlign("center");
    obj.label245:setField("Iniciativa32");
    obj.label245:setFontSize(19);
    lfm_setPropAsString(obj.label245, "fontStyle",  "bold");
    obj.label245:setFontColor("black");
    obj.label245:setFontFamily("kalam");
    obj.label245:setName("label245");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.CorpoACorpo32);
    obj.label246:setLeft(182.88);
    obj.label246:setTop(90);
    obj.label246:setWidth(50.88);
    obj.label246:setHeight(31.38);
    obj.label246:setHorzTextAlign("center");
    obj.label246:setField("DanoItem32");
    obj.label246:setFontSize(19);
    lfm_setPropAsString(obj.label246, "fontStyle",  "bold");
    obj.label246:setFontColor("black");
    obj.label246:setFontFamily("kalam");
    obj.label246:setName("label246");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.CorpoACorpo32);
    obj.label247:setLeft(195.88);
    obj.label247:setTop(128);
    obj.label247:setWidth(50.88);
    obj.label247:setHeight(32);
    obj.label247:setHorzTextAlign("center");
    obj.label247:setField("Golpear32");
    obj.label247:setFontSize(15);
    lfm_setPropAsString(obj.label247, "fontStyle",  "bold");
    obj.label247:setFontColor("black");
    obj.label247:setFontFamily("kalam");
    obj.label247:setName("label247");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.CorpoACorpo32);
    obj.label248:setLeft(317.88);
    obj.label248:setTop(49);
    obj.label248:setWidth(68.88);
    obj.label248:setHeight(32);
    obj.label248:setHorzTextAlign("center");
    obj.label248:setField("Aparar32");
    obj.label248:setFontSize(19);
    lfm_setPropAsString(obj.label248, "fontStyle",  "bold");
    obj.label248:setFontColor("black");
    obj.label248:setFontFamily("kalam");
    obj.label248:setName("label248");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.CorpoACorpo32);
    obj.label249:setLeft(317.88);
    obj.label249:setTop(89);
    obj.label249:setWidth(68.88);
    obj.label249:setHeight(32);
    obj.label249:setHorzTextAlign("center");
    obj.label249:setField("CD32");
    obj.label249:setFontSize(19);
    lfm_setPropAsString(obj.label249, "fontStyle",  "bold");
    obj.label249:setFontColor("black");
    obj.label249:setFontFamily("kalam");
    obj.label249:setName("label249");

    obj.CorpoACorpo33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo33:setParent(obj.scrollBox2);
    obj.CorpoACorpo33:setName("CorpoACorpo33");
    obj.CorpoACorpo33:setWidth(480);
    obj.CorpoACorpo33:setHeight(174);
    obj.CorpoACorpo33:setLeft(0);
    obj.CorpoACorpo33:setTop(1544);

    obj.image99 = GUI.fromHandle(_obj_newObject("image"));
    obj.image99:setParent(obj.CorpoACorpo33);
    obj.image99:setSRC("images/LojaCorpoACorpo.png");
    obj.image99:setLeft(0);
    obj.image99:setTop(0);
    obj.image99:setWidth(399);
    obj.image99:setHeight(174);
    obj.image99:setName("image99");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.CorpoACorpo33);
    obj.label250:setLeft(22.25);
    obj.label250:setTop(20.50);
    obj.label250:setWidth(107.25);
    obj.label250:setHeight(37.88);
    obj.label250:setFontSize(22);
    obj.label250:setHint("Preço da Arma");
    obj.label250:setField("Preco33");
    obj.label250:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label250, "fontStyle",  "bold");
    obj.label250:setFontColor("yellow");
    obj.label250:setFontFamily("kalam");
    obj.label250:setCursor("handPoint");
    obj.label250:setHitTest(true);
    obj.label250:setName("label250");

    obj.Arma33 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma33:setParent(obj.CorpoACorpo33);
    obj.Arma33:setLeft(41.38);
    obj.Arma33:setTop(61.75);
    obj.Arma33:setWidth(67.88);
    obj.Arma33:setHeight(30);
    obj.Arma33:setCursor("handPoint");
    obj.Arma33:setHitTest(true);
    obj.Arma33:setHint("Clique aqui para comprar");
    obj.Arma33:setName("Arma33");

    obj.image100 = GUI.fromHandle(_obj_newObject("image"));
    obj.image100:setParent(obj.CorpoACorpo33);
    obj.image100:setLeft(2.56);
    obj.image100:setTop(93.00);
    obj.image100:setWidth(136.69);
    obj.image100:setHeight(77.69);
    obj.image100:setStyle("proportional");
    obj.image100:setCenter(true);
    obj.image100:setEditable(true);
    obj.image100:setField("ImagemArma33");
    obj.image100:setName("image100");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.CorpoACorpo33);
    obj.label251:setLeft(197);
    obj.label251:setTop(10);
    obj.label251:setWidth(249.25);
    obj.label251:setHeight(39);
    obj.label251:setFontSize(18);
    obj.label251:setField("ItemNome33");
    lfm_setPropAsString(obj.label251, "fontStyle",  "bold");
    obj.label251:setFontColor("black");
    obj.label251:setFontFamily("kalam");
    obj.label251:setName("label251");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.CorpoACorpo33);
    obj.label252:setLeft(207.88);
    obj.label252:setTop(51);
    obj.label252:setWidth(49.88);
    obj.label252:setHeight(31.38);
    obj.label252:setHorzTextAlign("center");
    obj.label252:setField("Iniciativa33");
    obj.label252:setFontSize(19);
    lfm_setPropAsString(obj.label252, "fontStyle",  "bold");
    obj.label252:setFontColor("black");
    obj.label252:setFontFamily("kalam");
    obj.label252:setName("label252");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.CorpoACorpo33);
    obj.label253:setLeft(182.88);
    obj.label253:setTop(90);
    obj.label253:setWidth(50.88);
    obj.label253:setHeight(31.38);
    obj.label253:setHorzTextAlign("center");
    obj.label253:setField("DanoItem33");
    obj.label253:setFontSize(19);
    lfm_setPropAsString(obj.label253, "fontStyle",  "bold");
    obj.label253:setFontColor("black");
    obj.label253:setFontFamily("kalam");
    obj.label253:setName("label253");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.CorpoACorpo33);
    obj.label254:setLeft(195.88);
    obj.label254:setTop(128);
    obj.label254:setWidth(50.88);
    obj.label254:setHeight(32);
    obj.label254:setHorzTextAlign("center");
    obj.label254:setField("Golpear33");
    obj.label254:setFontSize(15);
    lfm_setPropAsString(obj.label254, "fontStyle",  "bold");
    obj.label254:setFontColor("black");
    obj.label254:setFontFamily("kalam");
    obj.label254:setName("label254");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.CorpoACorpo33);
    obj.label255:setLeft(317.88);
    obj.label255:setTop(49);
    obj.label255:setWidth(68.88);
    obj.label255:setHeight(32);
    obj.label255:setHorzTextAlign("center");
    obj.label255:setField("Aparar33");
    obj.label255:setFontSize(19);
    lfm_setPropAsString(obj.label255, "fontStyle",  "bold");
    obj.label255:setFontColor("black");
    obj.label255:setFontFamily("kalam");
    obj.label255:setName("label255");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.CorpoACorpo33);
    obj.label256:setLeft(317.88);
    obj.label256:setTop(89);
    obj.label256:setWidth(68.88);
    obj.label256:setHeight(32);
    obj.label256:setHorzTextAlign("center");
    obj.label256:setField("CD33");
    obj.label256:setFontSize(19);
    lfm_setPropAsString(obj.label256, "fontStyle",  "bold");
    obj.label256:setFontColor("black");
    obj.label256:setFontFamily("kalam");
    obj.label256:setName("label256");

    obj.CorpoACorpo34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo34:setParent(obj.scrollBox2);
    obj.CorpoACorpo34:setName("CorpoACorpo34");
    obj.CorpoACorpo34:setWidth(480);
    obj.CorpoACorpo34:setHeight(174);
    obj.CorpoACorpo34:setLeft(413);
    obj.CorpoACorpo34:setTop(1544);

    obj.image101 = GUI.fromHandle(_obj_newObject("image"));
    obj.image101:setParent(obj.CorpoACorpo34);
    obj.image101:setSRC("images/LojaCorpoACorpo.png");
    obj.image101:setLeft(0);
    obj.image101:setTop(0);
    obj.image101:setWidth(399);
    obj.image101:setHeight(174);
    obj.image101:setName("image101");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.CorpoACorpo34);
    obj.label257:setLeft(22.25);
    obj.label257:setTop(20.50);
    obj.label257:setWidth(107.25);
    obj.label257:setHeight(37.88);
    obj.label257:setFontSize(22);
    obj.label257:setHint("Preço da Arma");
    obj.label257:setField("Preco34");
    obj.label257:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label257, "fontStyle",  "bold");
    obj.label257:setFontColor("yellow");
    obj.label257:setFontFamily("kalam");
    obj.label257:setCursor("handPoint");
    obj.label257:setHitTest(true);
    obj.label257:setName("label257");

    obj.Arma34 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma34:setParent(obj.CorpoACorpo34);
    obj.Arma34:setLeft(41.38);
    obj.Arma34:setTop(61.75);
    obj.Arma34:setWidth(67.88);
    obj.Arma34:setHeight(30);
    obj.Arma34:setCursor("handPoint");
    obj.Arma34:setHitTest(true);
    obj.Arma34:setHint("Clique aqui para comprar");
    obj.Arma34:setName("Arma34");

    obj.image102 = GUI.fromHandle(_obj_newObject("image"));
    obj.image102:setParent(obj.CorpoACorpo34);
    obj.image102:setLeft(2.56);
    obj.image102:setTop(93.00);
    obj.image102:setWidth(136.69);
    obj.image102:setHeight(77.69);
    obj.image102:setStyle("proportional");
    obj.image102:setCenter(true);
    obj.image102:setEditable(true);
    obj.image102:setField("ImagemArma34");
    obj.image102:setName("image102");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.CorpoACorpo34);
    obj.label258:setLeft(197);
    obj.label258:setTop(10);
    obj.label258:setWidth(249.25);
    obj.label258:setHeight(39);
    obj.label258:setFontSize(22);
    obj.label258:setField("ItemNome34");
    lfm_setPropAsString(obj.label258, "fontStyle",  "bold");
    obj.label258:setFontColor("black");
    obj.label258:setFontFamily("kalam");
    obj.label258:setName("label258");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.CorpoACorpo34);
    obj.label259:setLeft(207.88);
    obj.label259:setTop(51);
    obj.label259:setWidth(49.88);
    obj.label259:setHeight(31.38);
    obj.label259:setHorzTextAlign("center");
    obj.label259:setField("Iniciativa34");
    obj.label259:setFontSize(19);
    lfm_setPropAsString(obj.label259, "fontStyle",  "bold");
    obj.label259:setFontColor("black");
    obj.label259:setFontFamily("kalam");
    obj.label259:setName("label259");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.CorpoACorpo34);
    obj.label260:setLeft(182.88);
    obj.label260:setTop(90);
    obj.label260:setWidth(50.88);
    obj.label260:setHeight(31.38);
    obj.label260:setHorzTextAlign("center");
    obj.label260:setField("DanoItem34");
    obj.label260:setFontSize(19);
    lfm_setPropAsString(obj.label260, "fontStyle",  "bold");
    obj.label260:setFontColor("black");
    obj.label260:setFontFamily("kalam");
    obj.label260:setName("label260");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.CorpoACorpo34);
    obj.label261:setLeft(195.88);
    obj.label261:setTop(128);
    obj.label261:setWidth(50.88);
    obj.label261:setHeight(32);
    obj.label261:setHorzTextAlign("center");
    obj.label261:setField("Golpear34");
    obj.label261:setFontSize(15);
    lfm_setPropAsString(obj.label261, "fontStyle",  "bold");
    obj.label261:setFontColor("black");
    obj.label261:setFontFamily("kalam");
    obj.label261:setName("label261");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.CorpoACorpo34);
    obj.label262:setLeft(317.88);
    obj.label262:setTop(49);
    obj.label262:setWidth(68.88);
    obj.label262:setHeight(32);
    obj.label262:setHorzTextAlign("center");
    obj.label262:setField("Aparar34");
    obj.label262:setFontSize(19);
    lfm_setPropAsString(obj.label262, "fontStyle",  "bold");
    obj.label262:setFontColor("black");
    obj.label262:setFontFamily("kalam");
    obj.label262:setName("label262");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.CorpoACorpo34);
    obj.label263:setLeft(317.88);
    obj.label263:setTop(89);
    obj.label263:setWidth(68.88);
    obj.label263:setHeight(32);
    obj.label263:setHorzTextAlign("center");
    obj.label263:setField("CD34");
    obj.label263:setFontSize(19);
    lfm_setPropAsString(obj.label263, "fontStyle",  "bold");
    obj.label263:setFontColor("black");
    obj.label263:setFontFamily("kalam");
    obj.label263:setName("label263");

    obj.CorpoACorpo35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo35:setParent(obj.scrollBox2);
    obj.CorpoACorpo35:setName("CorpoACorpo35");
    obj.CorpoACorpo35:setWidth(480);
    obj.CorpoACorpo35:setHeight(174);
    obj.CorpoACorpo35:setLeft(413);
    obj.CorpoACorpo35:setTop(88);

    obj.image103 = GUI.fromHandle(_obj_newObject("image"));
    obj.image103:setParent(obj.CorpoACorpo35);
    obj.image103:setSRC("images/LojaCorpoACorpo.png");
    obj.image103:setLeft(0);
    obj.image103:setTop(0);
    obj.image103:setWidth(399);
    obj.image103:setHeight(174);
    obj.image103:setName("image103");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.CorpoACorpo35);
    obj.label264:setLeft(22.25);
    obj.label264:setTop(20.50);
    obj.label264:setWidth(107.25);
    obj.label264:setHeight(37.88);
    obj.label264:setFontSize(22);
    obj.label264:setHint("Preço da Arma");
    obj.label264:setField("Preco35");
    obj.label264:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label264, "fontStyle",  "bold");
    obj.label264:setFontColor("yellow");
    obj.label264:setFontFamily("kalam");
    obj.label264:setCursor("handPoint");
    obj.label264:setHitTest(true);
    obj.label264:setName("label264");

    obj.Arma35 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma35:setParent(obj.CorpoACorpo35);
    obj.Arma35:setLeft(41.38);
    obj.Arma35:setTop(61.75);
    obj.Arma35:setWidth(67.88);
    obj.Arma35:setHeight(30);
    obj.Arma35:setCursor("handPoint");
    obj.Arma35:setHitTest(true);
    obj.Arma35:setHint("Clique aqui para comprar");
    obj.Arma35:setName("Arma35");

    obj.image104 = GUI.fromHandle(_obj_newObject("image"));
    obj.image104:setParent(obj.CorpoACorpo35);
    obj.image104:setLeft(2.56);
    obj.image104:setTop(93.00);
    obj.image104:setWidth(136.69);
    obj.image104:setHeight(77.69);
    obj.image104:setStyle("proportional");
    obj.image104:setCenter(true);
    obj.image104:setEditable(true);
    obj.image104:setField("ImagemArma35");
    obj.image104:setName("image104");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.CorpoACorpo35);
    obj.label265:setLeft(197);
    obj.label265:setTop(10);
    obj.label265:setWidth(249.25);
    obj.label265:setHeight(39);
    obj.label265:setFontSize(22);
    obj.label265:setField("ItemNome35");
    lfm_setPropAsString(obj.label265, "fontStyle",  "bold");
    obj.label265:setFontColor("black");
    obj.label265:setFontFamily("kalam");
    obj.label265:setName("label265");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.CorpoACorpo35);
    obj.label266:setLeft(207.88);
    obj.label266:setTop(51);
    obj.label266:setWidth(49.88);
    obj.label266:setHeight(31.38);
    obj.label266:setHorzTextAlign("center");
    obj.label266:setField("Iniciativa35");
    obj.label266:setFontSize(19);
    lfm_setPropAsString(obj.label266, "fontStyle",  "bold");
    obj.label266:setFontColor("black");
    obj.label266:setFontFamily("kalam");
    obj.label266:setName("label266");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.CorpoACorpo35);
    obj.label267:setLeft(182.88);
    obj.label267:setTop(90);
    obj.label267:setWidth(50.88);
    obj.label267:setHeight(31.38);
    obj.label267:setHorzTextAlign("center");
    obj.label267:setField("DanoItem35");
    obj.label267:setFontSize(19);
    lfm_setPropAsString(obj.label267, "fontStyle",  "bold");
    obj.label267:setFontColor("black");
    obj.label267:setFontFamily("kalam");
    obj.label267:setName("label267");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.CorpoACorpo35);
    obj.label268:setLeft(195.88);
    obj.label268:setTop(128);
    obj.label268:setWidth(50.88);
    obj.label268:setHeight(32);
    obj.label268:setHorzTextAlign("center");
    obj.label268:setField("Golpear35");
    obj.label268:setFontSize(15);
    lfm_setPropAsString(obj.label268, "fontStyle",  "bold");
    obj.label268:setFontColor("black");
    obj.label268:setFontFamily("kalam");
    obj.label268:setName("label268");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.CorpoACorpo35);
    obj.label269:setLeft(317.88);
    obj.label269:setTop(49);
    obj.label269:setWidth(68.88);
    obj.label269:setHeight(32);
    obj.label269:setHorzTextAlign("center");
    obj.label269:setField("Aparar35");
    obj.label269:setFontSize(19);
    lfm_setPropAsString(obj.label269, "fontStyle",  "bold");
    obj.label269:setFontColor("black");
    obj.label269:setFontFamily("kalam");
    obj.label269:setName("label269");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.CorpoACorpo35);
    obj.label270:setLeft(317.88);
    obj.label270:setTop(89);
    obj.label270:setWidth(68.88);
    obj.label270:setHeight(32);
    obj.label270:setHorzTextAlign("center");
    obj.label270:setField("CD35");
    obj.label270:setFontSize(19);
    lfm_setPropAsString(obj.label270, "fontStyle",  "bold");
    obj.label270:setFontColor("black");
    obj.label270:setFontFamily("kalam");
    obj.label270:setName("label270");

    obj.CorpoACorpo36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo36:setParent(obj.scrollBox2);
    obj.CorpoACorpo36:setName("CorpoACorpo36");
    obj.CorpoACorpo36:setWidth(480);
    obj.CorpoACorpo36:setHeight(174);
    obj.CorpoACorpo36:setLeft(413);
    obj.CorpoACorpo36:setTop(270);

    obj.image105 = GUI.fromHandle(_obj_newObject("image"));
    obj.image105:setParent(obj.CorpoACorpo36);
    obj.image105:setSRC("images/LojaCorpoACorpo.png");
    obj.image105:setLeft(0);
    obj.image105:setTop(0);
    obj.image105:setWidth(399);
    obj.image105:setHeight(174);
    obj.image105:setName("image105");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.CorpoACorpo36);
    obj.label271:setLeft(22.25);
    obj.label271:setTop(20.50);
    obj.label271:setWidth(107.25);
    obj.label271:setHeight(37.88);
    obj.label271:setFontSize(22);
    obj.label271:setHint("Preço da Arma");
    obj.label271:setField("Preco36");
    obj.label271:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label271, "fontStyle",  "bold");
    obj.label271:setFontColor("yellow");
    obj.label271:setFontFamily("kalam");
    obj.label271:setCursor("handPoint");
    obj.label271:setHitTest(true);
    obj.label271:setName("label271");

    obj.Arma36 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma36:setParent(obj.CorpoACorpo36);
    obj.Arma36:setLeft(41.38);
    obj.Arma36:setTop(61.75);
    obj.Arma36:setWidth(67.88);
    obj.Arma36:setHeight(30);
    obj.Arma36:setCursor("handPoint");
    obj.Arma36:setHitTest(true);
    obj.Arma36:setHint("Clique aqui para comprar");
    obj.Arma36:setName("Arma36");

    obj.image106 = GUI.fromHandle(_obj_newObject("image"));
    obj.image106:setParent(obj.CorpoACorpo36);
    obj.image106:setLeft(2.56);
    obj.image106:setTop(93.00);
    obj.image106:setWidth(136.69);
    obj.image106:setHeight(77.69);
    obj.image106:setStyle("proportional");
    obj.image106:setCenter(true);
    obj.image106:setEditable(true);
    obj.image106:setField("ImagemArma36");
    obj.image106:setName("image106");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.CorpoACorpo36);
    obj.label272:setLeft(197);
    obj.label272:setTop(10);
    obj.label272:setWidth(249.25);
    obj.label272:setHeight(39);
    obj.label272:setFontSize(14.8);
    obj.label272:setField("ItemNome36");
    lfm_setPropAsString(obj.label272, "fontStyle",  "bold");
    obj.label272:setFontColor("black");
    obj.label272:setFontFamily("kalam");
    obj.label272:setName("label272");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.CorpoACorpo36);
    obj.label273:setLeft(207.88);
    obj.label273:setTop(51);
    obj.label273:setWidth(49.88);
    obj.label273:setHeight(31.38);
    obj.label273:setHorzTextAlign("center");
    obj.label273:setField("Iniciativa36");
    obj.label273:setFontSize(19);
    lfm_setPropAsString(obj.label273, "fontStyle",  "bold");
    obj.label273:setFontColor("black");
    obj.label273:setFontFamily("kalam");
    obj.label273:setName("label273");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.CorpoACorpo36);
    obj.label274:setLeft(182.88);
    obj.label274:setTop(90);
    obj.label274:setWidth(50.88);
    obj.label274:setHeight(31.38);
    obj.label274:setHorzTextAlign("center");
    obj.label274:setField("DanoItem36");
    obj.label274:setFontSize(19);
    lfm_setPropAsString(obj.label274, "fontStyle",  "bold");
    obj.label274:setFontColor("black");
    obj.label274:setFontFamily("kalam");
    obj.label274:setName("label274");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.CorpoACorpo36);
    obj.label275:setLeft(195.88);
    obj.label275:setTop(128);
    obj.label275:setWidth(50.88);
    obj.label275:setHeight(32);
    obj.label275:setHorzTextAlign("center");
    obj.label275:setField("Golpear36");
    obj.label275:setFontSize(15);
    lfm_setPropAsString(obj.label275, "fontStyle",  "bold");
    obj.label275:setFontColor("black");
    obj.label275:setFontFamily("kalam");
    obj.label275:setName("label275");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.CorpoACorpo36);
    obj.label276:setLeft(317.88);
    obj.label276:setTop(49);
    obj.label276:setWidth(68.88);
    obj.label276:setHeight(32);
    obj.label276:setHorzTextAlign("center");
    obj.label276:setField("Aparar36");
    obj.label276:setFontSize(19);
    lfm_setPropAsString(obj.label276, "fontStyle",  "bold");
    obj.label276:setFontColor("black");
    obj.label276:setFontFamily("kalam");
    obj.label276:setName("label276");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.CorpoACorpo36);
    obj.label277:setLeft(317.88);
    obj.label277:setTop(89);
    obj.label277:setWidth(68.88);
    obj.label277:setHeight(32);
    obj.label277:setHorzTextAlign("center");
    obj.label277:setField("CD36");
    obj.label277:setFontSize(19);
    lfm_setPropAsString(obj.label277, "fontStyle",  "bold");
    obj.label277:setFontColor("black");
    obj.label277:setFontFamily("kalam");
    obj.label277:setName("label277");

    obj.CorpoACorpo37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo37:setParent(obj.scrollBox2);
    obj.CorpoACorpo37:setName("CorpoACorpo37");
    obj.CorpoACorpo37:setWidth(480);
    obj.CorpoACorpo37:setHeight(174);
    obj.CorpoACorpo37:setLeft(413);
    obj.CorpoACorpo37:setTop(452);

    obj.image107 = GUI.fromHandle(_obj_newObject("image"));
    obj.image107:setParent(obj.CorpoACorpo37);
    obj.image107:setSRC("images/LojaCorpoACorpo.png");
    obj.image107:setLeft(0);
    obj.image107:setTop(0);
    obj.image107:setWidth(399);
    obj.image107:setHeight(174);
    obj.image107:setName("image107");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.CorpoACorpo37);
    obj.label278:setLeft(22.25);
    obj.label278:setTop(20.50);
    obj.label278:setWidth(107.25);
    obj.label278:setHeight(37.88);
    obj.label278:setFontSize(22);
    obj.label278:setHint("Preço da Arma");
    obj.label278:setField("Preco37");
    obj.label278:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label278, "fontStyle",  "bold");
    obj.label278:setFontColor("yellow");
    obj.label278:setFontFamily("kalam");
    obj.label278:setCursor("handPoint");
    obj.label278:setHitTest(true);
    obj.label278:setName("label278");

    obj.Arma37 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma37:setParent(obj.CorpoACorpo37);
    obj.Arma37:setLeft(41.38);
    obj.Arma37:setTop(61.75);
    obj.Arma37:setWidth(67.88);
    obj.Arma37:setHeight(30);
    obj.Arma37:setCursor("handPoint");
    obj.Arma37:setHitTest(true);
    obj.Arma37:setHint("Clique aqui para comprar");
    obj.Arma37:setName("Arma37");

    obj.image108 = GUI.fromHandle(_obj_newObject("image"));
    obj.image108:setParent(obj.CorpoACorpo37);
    obj.image108:setLeft(2.56);
    obj.image108:setTop(93.00);
    obj.image108:setWidth(136.69);
    obj.image108:setHeight(77.69);
    obj.image108:setStyle("proportional");
    obj.image108:setCenter(true);
    obj.image108:setEditable(true);
    obj.image108:setField("ImagemArma37");
    obj.image108:setName("image108");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.CorpoACorpo37);
    obj.label279:setLeft(197);
    obj.label279:setTop(10);
    obj.label279:setWidth(249.25);
    obj.label279:setHeight(39);
    obj.label279:setFontSize(22);
    obj.label279:setField("ItemNome37");
    lfm_setPropAsString(obj.label279, "fontStyle",  "bold");
    obj.label279:setFontColor("black");
    obj.label279:setFontFamily("kalam");
    obj.label279:setName("label279");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.CorpoACorpo37);
    obj.label280:setLeft(207.88);
    obj.label280:setTop(51);
    obj.label280:setWidth(49.88);
    obj.label280:setHeight(31.38);
    obj.label280:setHorzTextAlign("center");
    obj.label280:setField("Iniciativa37");
    obj.label280:setFontSize(19);
    lfm_setPropAsString(obj.label280, "fontStyle",  "bold");
    obj.label280:setFontColor("black");
    obj.label280:setFontFamily("kalam");
    obj.label280:setName("label280");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.CorpoACorpo37);
    obj.label281:setLeft(182.88);
    obj.label281:setTop(90);
    obj.label281:setWidth(50.88);
    obj.label281:setHeight(31.38);
    obj.label281:setHorzTextAlign("center");
    obj.label281:setField("DanoItem37");
    obj.label281:setFontSize(19);
    lfm_setPropAsString(obj.label281, "fontStyle",  "bold");
    obj.label281:setFontColor("black");
    obj.label281:setFontFamily("kalam");
    obj.label281:setName("label281");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.CorpoACorpo37);
    obj.label282:setLeft(195.88);
    obj.label282:setTop(128);
    obj.label282:setWidth(50.88);
    obj.label282:setHeight(32);
    obj.label282:setHorzTextAlign("center");
    obj.label282:setField("Golpear37");
    obj.label282:setFontSize(15);
    lfm_setPropAsString(obj.label282, "fontStyle",  "bold");
    obj.label282:setFontColor("black");
    obj.label282:setFontFamily("kalam");
    obj.label282:setName("label282");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.CorpoACorpo37);
    obj.label283:setLeft(317.88);
    obj.label283:setTop(49);
    obj.label283:setWidth(68.88);
    obj.label283:setHeight(32);
    obj.label283:setHorzTextAlign("center");
    obj.label283:setField("Aparar37");
    obj.label283:setFontSize(19);
    lfm_setPropAsString(obj.label283, "fontStyle",  "bold");
    obj.label283:setFontColor("black");
    obj.label283:setFontFamily("kalam");
    obj.label283:setName("label283");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.CorpoACorpo37);
    obj.label284:setLeft(317.88);
    obj.label284:setTop(89);
    obj.label284:setWidth(68.88);
    obj.label284:setHeight(32);
    obj.label284:setHorzTextAlign("center");
    obj.label284:setField("CD37");
    obj.label284:setFontSize(19);
    lfm_setPropAsString(obj.label284, "fontStyle",  "bold");
    obj.label284:setFontColor("black");
    obj.label284:setFontFamily("kalam");
    obj.label284:setName("label284");

    obj.CorpoACorpo38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo38:setParent(obj.scrollBox2);
    obj.CorpoACorpo38:setName("CorpoACorpo38");
    obj.CorpoACorpo38:setWidth(480);
    obj.CorpoACorpo38:setHeight(174);
    obj.CorpoACorpo38:setLeft(413);
    obj.CorpoACorpo38:setTop(634);

    obj.image109 = GUI.fromHandle(_obj_newObject("image"));
    obj.image109:setParent(obj.CorpoACorpo38);
    obj.image109:setSRC("images/LojaCorpoACorpo.png");
    obj.image109:setLeft(0);
    obj.image109:setTop(0);
    obj.image109:setWidth(399);
    obj.image109:setHeight(174);
    obj.image109:setName("image109");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.CorpoACorpo38);
    obj.label285:setLeft(22.25);
    obj.label285:setTop(20.50);
    obj.label285:setWidth(107.25);
    obj.label285:setHeight(37.88);
    obj.label285:setFontSize(22);
    obj.label285:setHint("Preço da Arma");
    obj.label285:setField("Preco38");
    obj.label285:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label285, "fontStyle",  "bold");
    obj.label285:setFontColor("yellow");
    obj.label285:setFontFamily("kalam");
    obj.label285:setCursor("handPoint");
    obj.label285:setHitTest(true);
    obj.label285:setName("label285");

    obj.Arma38 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma38:setParent(obj.CorpoACorpo38);
    obj.Arma38:setLeft(41.38);
    obj.Arma38:setTop(61.75);
    obj.Arma38:setWidth(67.88);
    obj.Arma38:setHeight(30);
    obj.Arma38:setCursor("handPoint");
    obj.Arma38:setHitTest(true);
    obj.Arma38:setHint("Clique aqui para comprar");
    obj.Arma38:setName("Arma38");

    obj.image110 = GUI.fromHandle(_obj_newObject("image"));
    obj.image110:setParent(obj.CorpoACorpo38);
    obj.image110:setLeft(2.56);
    obj.image110:setTop(93.00);
    obj.image110:setWidth(136.69);
    obj.image110:setHeight(77.69);
    obj.image110:setStyle("proportional");
    obj.image110:setCenter(true);
    obj.image110:setEditable(true);
    obj.image110:setField("ImagemArma38");
    obj.image110:setName("image110");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.CorpoACorpo38);
    obj.label286:setLeft(197);
    obj.label286:setTop(10);
    obj.label286:setWidth(249.25);
    obj.label286:setHeight(39);
    obj.label286:setFontSize(22);
    obj.label286:setField("ItemNome38");
    lfm_setPropAsString(obj.label286, "fontStyle",  "bold");
    obj.label286:setFontColor("black");
    obj.label286:setFontFamily("kalam");
    obj.label286:setName("label286");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.CorpoACorpo38);
    obj.label287:setLeft(207.88);
    obj.label287:setTop(51);
    obj.label287:setWidth(49.88);
    obj.label287:setHeight(31.38);
    obj.label287:setHorzTextAlign("center");
    obj.label287:setField("Iniciativa38");
    obj.label287:setFontSize(19);
    lfm_setPropAsString(obj.label287, "fontStyle",  "bold");
    obj.label287:setFontColor("black");
    obj.label287:setFontFamily("kalam");
    obj.label287:setName("label287");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.CorpoACorpo38);
    obj.label288:setLeft(182.88);
    obj.label288:setTop(90);
    obj.label288:setWidth(50.88);
    obj.label288:setHeight(31.38);
    obj.label288:setHorzTextAlign("center");
    obj.label288:setField("DanoItem38");
    obj.label288:setFontSize(19);
    lfm_setPropAsString(obj.label288, "fontStyle",  "bold");
    obj.label288:setFontColor("black");
    obj.label288:setFontFamily("kalam");
    obj.label288:setName("label288");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.CorpoACorpo38);
    obj.label289:setLeft(195.88);
    obj.label289:setTop(128);
    obj.label289:setWidth(50.88);
    obj.label289:setHeight(32);
    obj.label289:setHorzTextAlign("center");
    obj.label289:setField("Golpear38");
    obj.label289:setFontSize(15);
    lfm_setPropAsString(obj.label289, "fontStyle",  "bold");
    obj.label289:setFontColor("black");
    obj.label289:setFontFamily("kalam");
    obj.label289:setName("label289");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.CorpoACorpo38);
    obj.label290:setLeft(317.88);
    obj.label290:setTop(49);
    obj.label290:setWidth(68.88);
    obj.label290:setHeight(32);
    obj.label290:setHorzTextAlign("center");
    obj.label290:setField("Aparar38");
    obj.label290:setFontSize(19);
    lfm_setPropAsString(obj.label290, "fontStyle",  "bold");
    obj.label290:setFontColor("black");
    obj.label290:setFontFamily("kalam");
    obj.label290:setName("label290");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.CorpoACorpo38);
    obj.label291:setLeft(317.88);
    obj.label291:setTop(89);
    obj.label291:setWidth(68.88);
    obj.label291:setHeight(32);
    obj.label291:setHorzTextAlign("center");
    obj.label291:setField("CD38");
    obj.label291:setFontSize(19);
    lfm_setPropAsString(obj.label291, "fontStyle",  "bold");
    obj.label291:setFontColor("black");
    obj.label291:setFontFamily("kalam");
    obj.label291:setName("label291");

    obj.CorpoACorpo39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo39:setParent(obj.scrollBox2);
    obj.CorpoACorpo39:setName("CorpoACorpo39");
    obj.CorpoACorpo39:setWidth(480);
    obj.CorpoACorpo39:setHeight(174);
    obj.CorpoACorpo39:setLeft(413);
    obj.CorpoACorpo39:setTop(816);

    obj.image111 = GUI.fromHandle(_obj_newObject("image"));
    obj.image111:setParent(obj.CorpoACorpo39);
    obj.image111:setSRC("images/LojaCorpoACorpo.png");
    obj.image111:setLeft(0);
    obj.image111:setTop(0);
    obj.image111:setWidth(399);
    obj.image111:setHeight(174);
    obj.image111:setName("image111");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.CorpoACorpo39);
    obj.label292:setLeft(22.25);
    obj.label292:setTop(20.50);
    obj.label292:setWidth(107.25);
    obj.label292:setHeight(37.88);
    obj.label292:setFontSize(22);
    obj.label292:setHint("Preço da Arma");
    obj.label292:setField("Preco39");
    obj.label292:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label292, "fontStyle",  "bold");
    obj.label292:setFontColor("yellow");
    obj.label292:setFontFamily("kalam");
    obj.label292:setCursor("handPoint");
    obj.label292:setHitTest(true);
    obj.label292:setName("label292");

    obj.Arma39 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma39:setParent(obj.CorpoACorpo39);
    obj.Arma39:setLeft(41.38);
    obj.Arma39:setTop(61.75);
    obj.Arma39:setWidth(67.88);
    obj.Arma39:setHeight(30);
    obj.Arma39:setCursor("handPoint");
    obj.Arma39:setHitTest(true);
    obj.Arma39:setHint("Clique aqui para comprar");
    obj.Arma39:setName("Arma39");

    obj.image112 = GUI.fromHandle(_obj_newObject("image"));
    obj.image112:setParent(obj.CorpoACorpo39);
    obj.image112:setLeft(2.56);
    obj.image112:setTop(93.00);
    obj.image112:setWidth(136.69);
    obj.image112:setHeight(77.69);
    obj.image112:setStyle("proportional");
    obj.image112:setCenter(true);
    obj.image112:setEditable(true);
    obj.image112:setField("ImagemArma39");
    obj.image112:setName("image112");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.CorpoACorpo39);
    obj.label293:setLeft(197);
    obj.label293:setTop(10);
    obj.label293:setWidth(249.25);
    obj.label293:setHeight(39);
    obj.label293:setFontSize(22);
    obj.label293:setField("ItemNome39");
    lfm_setPropAsString(obj.label293, "fontStyle",  "bold");
    obj.label293:setFontColor("black");
    obj.label293:setFontFamily("kalam");
    obj.label293:setName("label293");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.CorpoACorpo39);
    obj.label294:setLeft(207.88);
    obj.label294:setTop(51);
    obj.label294:setWidth(49.88);
    obj.label294:setHeight(31.38);
    obj.label294:setHorzTextAlign("center");
    obj.label294:setField("Iniciativa39");
    obj.label294:setFontSize(19);
    lfm_setPropAsString(obj.label294, "fontStyle",  "bold");
    obj.label294:setFontColor("black");
    obj.label294:setFontFamily("kalam");
    obj.label294:setName("label294");

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.CorpoACorpo39);
    obj.label295:setLeft(182.88);
    obj.label295:setTop(90);
    obj.label295:setWidth(50.88);
    obj.label295:setHeight(31.38);
    obj.label295:setHorzTextAlign("center");
    obj.label295:setField("DanoItem39");
    obj.label295:setFontSize(19);
    lfm_setPropAsString(obj.label295, "fontStyle",  "bold");
    obj.label295:setFontColor("black");
    obj.label295:setFontFamily("kalam");
    obj.label295:setName("label295");

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.CorpoACorpo39);
    obj.label296:setLeft(195.88);
    obj.label296:setTop(128);
    obj.label296:setWidth(50.88);
    obj.label296:setHeight(32);
    obj.label296:setHorzTextAlign("center");
    obj.label296:setField("Golpear39");
    obj.label296:setFontSize(15);
    lfm_setPropAsString(obj.label296, "fontStyle",  "bold");
    obj.label296:setFontColor("black");
    obj.label296:setFontFamily("kalam");
    obj.label296:setName("label296");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.CorpoACorpo39);
    obj.label297:setLeft(317.88);
    obj.label297:setTop(49);
    obj.label297:setWidth(68.88);
    obj.label297:setHeight(32);
    obj.label297:setHorzTextAlign("center");
    obj.label297:setField("Aparar39");
    obj.label297:setFontSize(19);
    lfm_setPropAsString(obj.label297, "fontStyle",  "bold");
    obj.label297:setFontColor("black");
    obj.label297:setFontFamily("kalam");
    obj.label297:setName("label297");

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.CorpoACorpo39);
    obj.label298:setLeft(317.88);
    obj.label298:setTop(89);
    obj.label298:setWidth(68.88);
    obj.label298:setHeight(32);
    obj.label298:setHorzTextAlign("center");
    obj.label298:setField("CD39");
    obj.label298:setFontSize(19);
    lfm_setPropAsString(obj.label298, "fontStyle",  "bold");
    obj.label298:setFontColor("black");
    obj.label298:setFontFamily("kalam");
    obj.label298:setName("label298");

    obj.CorpoACorpo40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo40:setParent(obj.scrollBox2);
    obj.CorpoACorpo40:setName("CorpoACorpo40");
    obj.CorpoACorpo40:setWidth(480);
    obj.CorpoACorpo40:setHeight(174);
    obj.CorpoACorpo40:setLeft(413);
    obj.CorpoACorpo40:setTop(998);

    obj.image113 = GUI.fromHandle(_obj_newObject("image"));
    obj.image113:setParent(obj.CorpoACorpo40);
    obj.image113:setSRC("images/LojaCorpoACorpo.png");
    obj.image113:setLeft(0);
    obj.image113:setTop(0);
    obj.image113:setWidth(399);
    obj.image113:setHeight(174);
    obj.image113:setName("image113");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.CorpoACorpo40);
    obj.label299:setLeft(22.25);
    obj.label299:setTop(20.50);
    obj.label299:setWidth(107.25);
    obj.label299:setHeight(37.88);
    obj.label299:setFontSize(22);
    obj.label299:setHint("Preço da Arma");
    obj.label299:setField("Preco40");
    obj.label299:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label299, "fontStyle",  "bold");
    obj.label299:setFontColor("yellow");
    obj.label299:setFontFamily("kalam");
    obj.label299:setCursor("handPoint");
    obj.label299:setHitTest(true);
    obj.label299:setName("label299");

    obj.Arma40 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma40:setParent(obj.CorpoACorpo40);
    obj.Arma40:setLeft(41.38);
    obj.Arma40:setTop(61.75);
    obj.Arma40:setWidth(67.88);
    obj.Arma40:setHeight(30);
    obj.Arma40:setCursor("handPoint");
    obj.Arma40:setHitTest(true);
    obj.Arma40:setHint("Clique aqui para comprar");
    obj.Arma40:setName("Arma40");

    obj.image114 = GUI.fromHandle(_obj_newObject("image"));
    obj.image114:setParent(obj.CorpoACorpo40);
    obj.image114:setLeft(2.56);
    obj.image114:setTop(93.00);
    obj.image114:setWidth(136.69);
    obj.image114:setHeight(77.69);
    obj.image114:setStyle("proportional");
    obj.image114:setCenter(true);
    obj.image114:setEditable(true);
    obj.image114:setField("ImagemArma40");
    obj.image114:setName("image114");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.CorpoACorpo40);
    obj.label300:setLeft(197);
    obj.label300:setTop(10);
    obj.label300:setWidth(249.25);
    obj.label300:setHeight(39);
    obj.label300:setFontSize(22);
    obj.label300:setField("ItemNome40");
    lfm_setPropAsString(obj.label300, "fontStyle",  "bold");
    obj.label300:setFontColor("black");
    obj.label300:setFontFamily("kalam");
    obj.label300:setName("label300");

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.CorpoACorpo40);
    obj.label301:setLeft(207.88);
    obj.label301:setTop(51);
    obj.label301:setWidth(49.88);
    obj.label301:setHeight(31.38);
    obj.label301:setHorzTextAlign("center");
    obj.label301:setField("Iniciativa40");
    obj.label301:setFontSize(19);
    lfm_setPropAsString(obj.label301, "fontStyle",  "bold");
    obj.label301:setFontColor("black");
    obj.label301:setFontFamily("kalam");
    obj.label301:setName("label301");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.CorpoACorpo40);
    obj.label302:setLeft(182.88);
    obj.label302:setTop(90);
    obj.label302:setWidth(50.88);
    obj.label302:setHeight(31.38);
    obj.label302:setHorzTextAlign("center");
    obj.label302:setField("DanoItem40");
    obj.label302:setFontSize(19);
    lfm_setPropAsString(obj.label302, "fontStyle",  "bold");
    obj.label302:setFontColor("black");
    obj.label302:setFontFamily("kalam");
    obj.label302:setName("label302");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.CorpoACorpo40);
    obj.label303:setLeft(195.88);
    obj.label303:setTop(128);
    obj.label303:setWidth(50.88);
    obj.label303:setHeight(32);
    obj.label303:setHorzTextAlign("center");
    obj.label303:setField("Golpear40");
    obj.label303:setFontSize(15);
    lfm_setPropAsString(obj.label303, "fontStyle",  "bold");
    obj.label303:setFontColor("black");
    obj.label303:setFontFamily("kalam");
    obj.label303:setName("label303");

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.CorpoACorpo40);
    obj.label304:setLeft(317.88);
    obj.label304:setTop(49);
    obj.label304:setWidth(68.88);
    obj.label304:setHeight(32);
    obj.label304:setHorzTextAlign("center");
    obj.label304:setField("Aparar40");
    obj.label304:setFontSize(19);
    lfm_setPropAsString(obj.label304, "fontStyle",  "bold");
    obj.label304:setFontColor("black");
    obj.label304:setFontFamily("kalam");
    obj.label304:setName("label304");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.CorpoACorpo40);
    obj.label305:setLeft(317.88);
    obj.label305:setTop(89);
    obj.label305:setWidth(68.88);
    obj.label305:setHeight(32);
    obj.label305:setHorzTextAlign("center");
    obj.label305:setField("CD40");
    obj.label305:setFontSize(19);
    lfm_setPropAsString(obj.label305, "fontStyle",  "bold");
    obj.label305:setFontColor("black");
    obj.label305:setFontFamily("kalam");
    obj.label305:setName("label305");

    obj.CorpoACorpo41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo41:setParent(obj.scrollBox2);
    obj.CorpoACorpo41:setName("CorpoACorpo41");
    obj.CorpoACorpo41:setWidth(480);
    obj.CorpoACorpo41:setHeight(174);
    obj.CorpoACorpo41:setLeft(413);
    obj.CorpoACorpo41:setTop(1180);

    obj.image115 = GUI.fromHandle(_obj_newObject("image"));
    obj.image115:setParent(obj.CorpoACorpo41);
    obj.image115:setSRC("images/LojaCorpoACorpo.png");
    obj.image115:setLeft(0);
    obj.image115:setTop(0);
    obj.image115:setWidth(399);
    obj.image115:setHeight(174);
    obj.image115:setName("image115");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.CorpoACorpo41);
    obj.label306:setLeft(22.25);
    obj.label306:setTop(20.50);
    obj.label306:setWidth(107.25);
    obj.label306:setHeight(37.88);
    obj.label306:setFontSize(22);
    obj.label306:setHint("Preço da Arma");
    obj.label306:setField("Preco41");
    obj.label306:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label306, "fontStyle",  "bold");
    obj.label306:setFontColor("yellow");
    obj.label306:setFontFamily("kalam");
    obj.label306:setCursor("handPoint");
    obj.label306:setHitTest(true);
    obj.label306:setName("label306");

    obj.Arma41 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma41:setParent(obj.CorpoACorpo41);
    obj.Arma41:setLeft(41.38);
    obj.Arma41:setTop(61.75);
    obj.Arma41:setWidth(67.88);
    obj.Arma41:setHeight(30);
    obj.Arma41:setCursor("handPoint");
    obj.Arma41:setHitTest(true);
    obj.Arma41:setHint("Clique aqui para comprar");
    obj.Arma41:setName("Arma41");

    obj.image116 = GUI.fromHandle(_obj_newObject("image"));
    obj.image116:setParent(obj.CorpoACorpo41);
    obj.image116:setLeft(2.56);
    obj.image116:setTop(93.00);
    obj.image116:setWidth(136.69);
    obj.image116:setHeight(77.69);
    obj.image116:setStyle("proportional");
    obj.image116:setCenter(true);
    obj.image116:setEditable(true);
    obj.image116:setField("ImagemArma41");
    obj.image116:setName("image116");

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.CorpoACorpo41);
    obj.label307:setLeft(197);
    obj.label307:setTop(10);
    obj.label307:setWidth(249.25);
    obj.label307:setHeight(39);
    obj.label307:setFontSize(22);
    obj.label307:setField("ItemNome41");
    lfm_setPropAsString(obj.label307, "fontStyle",  "bold");
    obj.label307:setFontColor("black");
    obj.label307:setFontFamily("kalam");
    obj.label307:setName("label307");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.CorpoACorpo41);
    obj.label308:setLeft(207.88);
    obj.label308:setTop(51);
    obj.label308:setWidth(49.88);
    obj.label308:setHeight(31.38);
    obj.label308:setHorzTextAlign("center");
    obj.label308:setField("Iniciativa41");
    obj.label308:setFontSize(19);
    lfm_setPropAsString(obj.label308, "fontStyle",  "bold");
    obj.label308:setFontColor("black");
    obj.label308:setFontFamily("kalam");
    obj.label308:setName("label308");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.CorpoACorpo41);
    obj.label309:setLeft(182.88);
    obj.label309:setTop(90);
    obj.label309:setWidth(50.88);
    obj.label309:setHeight(31.38);
    obj.label309:setHorzTextAlign("center");
    obj.label309:setField("DanoItem41");
    obj.label309:setFontSize(19);
    lfm_setPropAsString(obj.label309, "fontStyle",  "bold");
    obj.label309:setFontColor("black");
    obj.label309:setFontFamily("kalam");
    obj.label309:setName("label309");

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.CorpoACorpo41);
    obj.label310:setLeft(195.88);
    obj.label310:setTop(128);
    obj.label310:setWidth(50.88);
    obj.label310:setHeight(32);
    obj.label310:setHorzTextAlign("center");
    obj.label310:setField("Golpear41");
    obj.label310:setFontSize(15);
    lfm_setPropAsString(obj.label310, "fontStyle",  "bold");
    obj.label310:setFontColor("black");
    obj.label310:setFontFamily("kalam");
    obj.label310:setName("label310");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.CorpoACorpo41);
    obj.label311:setLeft(317.88);
    obj.label311:setTop(49);
    obj.label311:setWidth(68.88);
    obj.label311:setHeight(32);
    obj.label311:setHorzTextAlign("center");
    obj.label311:setField("Aparar41");
    obj.label311:setFontSize(19);
    lfm_setPropAsString(obj.label311, "fontStyle",  "bold");
    obj.label311:setFontColor("black");
    obj.label311:setFontFamily("kalam");
    obj.label311:setName("label311");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.CorpoACorpo41);
    obj.label312:setLeft(317.88);
    obj.label312:setTop(89);
    obj.label312:setWidth(68.88);
    obj.label312:setHeight(32);
    obj.label312:setHorzTextAlign("center");
    obj.label312:setField("CD41");
    obj.label312:setFontSize(19);
    lfm_setPropAsString(obj.label312, "fontStyle",  "bold");
    obj.label312:setFontColor("black");
    obj.label312:setFontFamily("kalam");
    obj.label312:setName("label312");

    obj.CorpoACorpo42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo42:setParent(obj.scrollBox2);
    obj.CorpoACorpo42:setName("CorpoACorpo42");
    obj.CorpoACorpo42:setWidth(480);
    obj.CorpoACorpo42:setHeight(174);
    obj.CorpoACorpo42:setLeft(413);
    obj.CorpoACorpo42:setTop(1362);

    obj.image117 = GUI.fromHandle(_obj_newObject("image"));
    obj.image117:setParent(obj.CorpoACorpo42);
    obj.image117:setSRC("images/LojaCorpoACorpo.png");
    obj.image117:setLeft(0);
    obj.image117:setTop(0);
    obj.image117:setWidth(399);
    obj.image117:setHeight(174);
    obj.image117:setName("image117");

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.CorpoACorpo42);
    obj.label313:setLeft(22.25);
    obj.label313:setTop(20.50);
    obj.label313:setWidth(107.25);
    obj.label313:setHeight(37.88);
    obj.label313:setFontSize(22);
    obj.label313:setHint("Preço da Arma");
    obj.label313:setField("Preco42");
    obj.label313:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label313, "fontStyle",  "bold");
    obj.label313:setFontColor("yellow");
    obj.label313:setFontFamily("kalam");
    obj.label313:setCursor("handPoint");
    obj.label313:setHitTest(true);
    obj.label313:setName("label313");

    obj.Arma42 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma42:setParent(obj.CorpoACorpo42);
    obj.Arma42:setLeft(41.38);
    obj.Arma42:setTop(61.75);
    obj.Arma42:setWidth(67.88);
    obj.Arma42:setHeight(30);
    obj.Arma42:setCursor("handPoint");
    obj.Arma42:setHitTest(true);
    obj.Arma42:setHint("Clique aqui para comprar");
    obj.Arma42:setName("Arma42");

    obj.image118 = GUI.fromHandle(_obj_newObject("image"));
    obj.image118:setParent(obj.CorpoACorpo42);
    obj.image118:setLeft(2.56);
    obj.image118:setTop(93.00);
    obj.image118:setWidth(136.69);
    obj.image118:setHeight(77.69);
    obj.image118:setStyle("proportional");
    obj.image118:setCenter(true);
    obj.image118:setEditable(true);
    obj.image118:setField("ImagemArma42");
    obj.image118:setName("image118");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.CorpoACorpo42);
    obj.label314:setLeft(197);
    obj.label314:setTop(10);
    obj.label314:setWidth(249.25);
    obj.label314:setHeight(39);
    obj.label314:setFontSize(22);
    obj.label314:setField("ItemNome42");
    lfm_setPropAsString(obj.label314, "fontStyle",  "bold");
    obj.label314:setFontColor("black");
    obj.label314:setFontFamily("kalam");
    obj.label314:setName("label314");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.CorpoACorpo42);
    obj.label315:setLeft(207.88);
    obj.label315:setTop(51);
    obj.label315:setWidth(49.88);
    obj.label315:setHeight(31.38);
    obj.label315:setHorzTextAlign("center");
    obj.label315:setField("Iniciativa42");
    obj.label315:setFontSize(19);
    lfm_setPropAsString(obj.label315, "fontStyle",  "bold");
    obj.label315:setFontColor("black");
    obj.label315:setFontFamily("kalam");
    obj.label315:setName("label315");

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.CorpoACorpo42);
    obj.label316:setLeft(182.88);
    obj.label316:setTop(90);
    obj.label316:setWidth(50.88);
    obj.label316:setHeight(31.38);
    obj.label316:setHorzTextAlign("center");
    obj.label316:setField("DanoItem42");
    obj.label316:setFontSize(19);
    lfm_setPropAsString(obj.label316, "fontStyle",  "bold");
    obj.label316:setFontColor("black");
    obj.label316:setFontFamily("kalam");
    obj.label316:setName("label316");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.CorpoACorpo42);
    obj.label317:setLeft(195.88);
    obj.label317:setTop(128);
    obj.label317:setWidth(50.88);
    obj.label317:setHeight(32);
    obj.label317:setHorzTextAlign("center");
    obj.label317:setField("Golpear42");
    obj.label317:setFontSize(15);
    lfm_setPropAsString(obj.label317, "fontStyle",  "bold");
    obj.label317:setFontColor("black");
    obj.label317:setFontFamily("kalam");
    obj.label317:setName("label317");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.CorpoACorpo42);
    obj.label318:setLeft(317.88);
    obj.label318:setTop(49);
    obj.label318:setWidth(68.88);
    obj.label318:setHeight(32);
    obj.label318:setHorzTextAlign("center");
    obj.label318:setField("Aparar42");
    obj.label318:setFontSize(19);
    lfm_setPropAsString(obj.label318, "fontStyle",  "bold");
    obj.label318:setFontColor("black");
    obj.label318:setFontFamily("kalam");
    obj.label318:setName("label318");

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.CorpoACorpo42);
    obj.label319:setLeft(317.88);
    obj.label319:setTop(89);
    obj.label319:setWidth(68.88);
    obj.label319:setHeight(32);
    obj.label319:setHorzTextAlign("center");
    obj.label319:setField("CD42");
    obj.label319:setFontSize(19);
    lfm_setPropAsString(obj.label319, "fontStyle",  "bold");
    obj.label319:setFontColor("black");
    obj.label319:setFontFamily("kalam");
    obj.label319:setName("label319");

    obj.LojaArmaduras = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaArmaduras:setParent(obj);
    obj.LojaArmaduras:setName("LojaArmaduras");
    obj.LojaArmaduras:setAlign("client");
    obj.LojaArmaduras:setVisible(false);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.LojaArmaduras);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox3);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.image119 = GUI.fromHandle(_obj_newObject("image"));
    obj.image119:setParent(obj.layout3);
    obj.image119:setSRC("images/dinheiroArma.png");
    obj.image119:setLeft(0);
    obj.image119:setTop(5);
    obj.image119:setWidth(180.37);
    obj.image119:setHeight(80.25);
    obj.image119:setName("image119");

    obj.labSoma5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma5:setParent(obj.layout3);
    obj.labSoma5:setLeft(26);
    obj.labSoma5:setTop(30);
    lfm_setPropAsString(obj.labSoma5, "fontStyle",  "bold");
    obj.labSoma5:setFontColor("white");
    obj.labSoma5:setFontSize(36);
    obj.labSoma5:setAutoSize(true);
    obj.labSoma5:setWordWrap(false);
    obj.labSoma5:setName("labSoma5");
    obj.labSoma5:setCursor("handPoint");
    obj.labSoma5:setHitTest(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.labSoma5);
    obj.dataLink3:setField("Soma");
    obj.dataLink3:setName("dataLink3");

    obj.image120 = GUI.fromHandle(_obj_newObject("image"));
    obj.image120:setParent(obj.scrollBox3);
    obj.image120:setLeft(0);
    obj.image120:setTop(0);
    obj.image120:setWidth(130.37);
    obj.image120:setHeight(62.25);
    obj.image120:setHint("Seu dinheiro");
    obj.image120:setCursor("handPoint");
    obj.image120:setHitTest(true);
    obj.image120:setName("image120");

    obj.image121 = GUI.fromHandle(_obj_newObject("image"));
    obj.image121:setParent(obj.scrollBox3);
    obj.image121:setSRC("images/botaoVoltar.png");
    obj.image121:setLeft(200);
    obj.image121:setTop(29);
    obj.image121:setWidth(50);
    obj.image121:setHeight(50);
    obj.image121:setCursor("handPoint");
    obj.image121:setHint("Clique aqui para voltar");
    obj.image121:setHitTest(true);
    obj.image121:setName("image121");

    obj.Armadura45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura45:setParent(obj.scrollBox3);
    obj.Armadura45:setName("Armadura45");
    obj.Armadura45:setWidth(480);
    obj.Armadura45:setHeight(174);
    obj.Armadura45:setLeft(0);
    obj.Armadura45:setTop(88);

    obj.image122 = GUI.fromHandle(_obj_newObject("image"));
    obj.image122:setParent(obj.Armadura45);
    obj.image122:setSRC("images/LojaparaArmaduras.png");
    obj.image122:setLeft(0);
    obj.image122:setTop(0);
    obj.image122:setWidth(399);
    obj.image122:setHeight(174);
    obj.image122:setName("image122");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.Armadura45);
    obj.label320:setLeft(22.25);
    obj.label320:setTop(20.50);
    obj.label320:setWidth(107.25);
    obj.label320:setHeight(37.88);
    obj.label320:setFontSize(22);
    obj.label320:setHint("Preço da Arma");
    obj.label320:setField("Preco45");
    obj.label320:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label320, "fontStyle",  "bold");
    obj.label320:setFontColor("yellow");
    obj.label320:setFontFamily("kalam");
    obj.label320:setCursor("handPoint");
    obj.label320:setHitTest(true);
    obj.label320:setName("label320");

    obj.Arma45 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma45:setParent(obj.Armadura45);
    obj.Arma45:setLeft(41.38);
    obj.Arma45:setTop(61.75);
    obj.Arma45:setWidth(67.88);
    obj.Arma45:setHeight(30);
    obj.Arma45:setCursor("handPoint");
    obj.Arma45:setHitTest(true);
    obj.Arma45:setHint("Clique aqui para comprar");
    obj.Arma45:setName("Arma45");

    obj.image123 = GUI.fromHandle(_obj_newObject("image"));
    obj.image123:setParent(obj.Armadura45);
    obj.image123:setLeft(2.56);
    obj.image123:setTop(93.00);
    obj.image123:setWidth(136.69);
    obj.image123:setHeight(77.69);
    obj.image123:setStyle("proportional");
    obj.image123:setCenter(true);
    obj.image123:setEditable(true);
    obj.image123:setField("ImagemArma45");
    obj.image123:setName("image123");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.Armadura45);
    obj.label321:setLeft(197);
    obj.label321:setTop(10);
    obj.label321:setWidth(249.25);
    obj.label321:setHeight(39);
    obj.label321:setFontSize(12.8);
    obj.label321:setField("ItemNome45");
    lfm_setPropAsString(obj.label321, "fontStyle",  "bold");
    obj.label321:setFontColor("black");
    obj.label321:setFontFamily("kalam");
    obj.label321:setName("label321");

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.Armadura45);
    obj.label322:setLeft(243.50);
    obj.label322:setTop(46);
    obj.label322:setWidth(149.25);
    obj.label322:setHeight(38.63);
    obj.label322:setHorzTextAlign("center");
    obj.label322:setField("AbsorverAparar45");
    obj.label322:setFontSize(19);
    lfm_setPropAsString(obj.label322, "fontStyle",  "bold");
    obj.label322:setFontColor("black");
    obj.label322:setFontFamily("kalam");
    obj.label322:setName("label322");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.Armadura45);
    obj.label323:setLeft(182);
    obj.label323:setTop(86.13);
    obj.label323:setWidth(61.88);
    obj.label323:setHeight(38.87);
    obj.label323:setHorzTextAlign("center");
    obj.label323:setField("CD45");
    obj.label323:setFontSize(19);
    lfm_setPropAsString(obj.label323, "fontStyle",  "bold");
    obj.label323:setFontColor("black");
    obj.label323:setFontFamily("kalam");
    obj.label323:setName("label323");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.Armadura45);
    obj.label324:setLeft(300);
    obj.label324:setTop(127);
    obj.label324:setWidth(61.88);
    obj.label324:setHeight(38.88);
    obj.label324:setHorzTextAlign("center");
    obj.label324:setField("PenalidadedeMovimento45");
    obj.label324:setFontSize(15);
    lfm_setPropAsString(obj.label324, "fontStyle",  "bold");
    obj.label324:setFontColor("black");
    obj.label324:setFontFamily("kalam");
    obj.label324:setName("label324");

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.Armadura45);
    obj.label325:setLeft(336);
    obj.label325:setTop(86.12);
    obj.label325:setWidth(61.88);
    obj.label325:setHeight(38.88);
    obj.label325:setHorzTextAlign("center");
    obj.label325:setField("PenalidadeDePercepcao45");
    obj.label325:setFontSize(19);
    lfm_setPropAsString(obj.label325, "fontStyle",  "bold");
    obj.label325:setFontColor("black");
    obj.label325:setFontFamily("kalam");
    obj.label325:setName("label325");

    obj.Armadura46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura46:setParent(obj.scrollBox3);
    obj.Armadura46:setName("Armadura46");
    obj.Armadura46:setWidth(480);
    obj.Armadura46:setHeight(174);
    obj.Armadura46:setLeft(0);
    obj.Armadura46:setTop(270);

    obj.image124 = GUI.fromHandle(_obj_newObject("image"));
    obj.image124:setParent(obj.Armadura46);
    obj.image124:setSRC("images/LojaparaArmaduras.png");
    obj.image124:setLeft(0);
    obj.image124:setTop(0);
    obj.image124:setWidth(399);
    obj.image124:setHeight(174);
    obj.image124:setName("image124");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.Armadura46);
    obj.label326:setLeft(22.25);
    obj.label326:setTop(20.50);
    obj.label326:setWidth(107.25);
    obj.label326:setHeight(37.88);
    obj.label326:setFontSize(22);
    obj.label326:setHint("Preço da Arma");
    obj.label326:setField("Preco46");
    obj.label326:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label326, "fontStyle",  "bold");
    obj.label326:setFontColor("yellow");
    obj.label326:setFontFamily("kalam");
    obj.label326:setCursor("handPoint");
    obj.label326:setHitTest(true);
    obj.label326:setName("label326");

    obj.Arma46 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma46:setParent(obj.Armadura46);
    obj.Arma46:setLeft(41.38);
    obj.Arma46:setTop(61.75);
    obj.Arma46:setWidth(67.88);
    obj.Arma46:setHeight(30);
    obj.Arma46:setCursor("handPoint");
    obj.Arma46:setHitTest(true);
    obj.Arma46:setHint("Clique aqui para comprar");
    obj.Arma46:setName("Arma46");

    obj.image125 = GUI.fromHandle(_obj_newObject("image"));
    obj.image125:setParent(obj.Armadura46);
    obj.image125:setLeft(2.56);
    obj.image125:setTop(93.00);
    obj.image125:setWidth(136.69);
    obj.image125:setHeight(77.69);
    obj.image125:setStyle("proportional");
    obj.image125:setCenter(true);
    obj.image125:setEditable(true);
    obj.image125:setField("ImagemArma46");
    obj.image125:setName("image125");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.Armadura46);
    obj.label327:setLeft(197);
    obj.label327:setTop(10);
    obj.label327:setWidth(249.25);
    obj.label327:setHeight(39);
    obj.label327:setFontSize(22);
    obj.label327:setField("ItemNome46");
    lfm_setPropAsString(obj.label327, "fontStyle",  "bold");
    obj.label327:setFontColor("black");
    obj.label327:setFontFamily("kalam");
    obj.label327:setName("label327");

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.Armadura46);
    obj.label328:setLeft(243.50);
    obj.label328:setTop(46);
    obj.label328:setWidth(149.25);
    obj.label328:setHeight(38.63);
    obj.label328:setHorzTextAlign("center");
    obj.label328:setField("AbsorverAparar46");
    obj.label328:setFontSize(19);
    lfm_setPropAsString(obj.label328, "fontStyle",  "bold");
    obj.label328:setFontColor("black");
    obj.label328:setFontFamily("kalam");
    obj.label328:setName("label328");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.Armadura46);
    obj.label329:setLeft(182);
    obj.label329:setTop(86.13);
    obj.label329:setWidth(61.88);
    obj.label329:setHeight(38.87);
    obj.label329:setHorzTextAlign("center");
    obj.label329:setField("CD46");
    obj.label329:setFontSize(19);
    lfm_setPropAsString(obj.label329, "fontStyle",  "bold");
    obj.label329:setFontColor("black");
    obj.label329:setFontFamily("kalam");
    obj.label329:setName("label329");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.Armadura46);
    obj.label330:setLeft(300);
    obj.label330:setTop(127);
    obj.label330:setWidth(61.88);
    obj.label330:setHeight(38.88);
    obj.label330:setHorzTextAlign("center");
    obj.label330:setField("PenalidadedeMovimento46");
    obj.label330:setFontSize(15);
    lfm_setPropAsString(obj.label330, "fontStyle",  "bold");
    obj.label330:setFontColor("black");
    obj.label330:setFontFamily("kalam");
    obj.label330:setName("label330");

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.Armadura46);
    obj.label331:setLeft(336);
    obj.label331:setTop(86.12);
    obj.label331:setWidth(61.88);
    obj.label331:setHeight(38.88);
    obj.label331:setHorzTextAlign("center");
    obj.label331:setField("PenalidadeDePercepcao46");
    obj.label331:setFontSize(19);
    lfm_setPropAsString(obj.label331, "fontStyle",  "bold");
    obj.label331:setFontColor("black");
    obj.label331:setFontFamily("kalam");
    obj.label331:setName("label331");

    obj.Armadura47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura47:setParent(obj.scrollBox3);
    obj.Armadura47:setName("Armadura47");
    obj.Armadura47:setWidth(480);
    obj.Armadura47:setHeight(174);
    obj.Armadura47:setLeft(0);
    obj.Armadura47:setTop(452);

    obj.image126 = GUI.fromHandle(_obj_newObject("image"));
    obj.image126:setParent(obj.Armadura47);
    obj.image126:setSRC("images/LojaparaArmaduras.png");
    obj.image126:setLeft(0);
    obj.image126:setTop(0);
    obj.image126:setWidth(399);
    obj.image126:setHeight(174);
    obj.image126:setName("image126");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.Armadura47);
    obj.label332:setLeft(22.25);
    obj.label332:setTop(20.50);
    obj.label332:setWidth(107.25);
    obj.label332:setHeight(37.88);
    obj.label332:setFontSize(22);
    obj.label332:setHint("Preço da Arma");
    obj.label332:setField("Preco47");
    obj.label332:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label332, "fontStyle",  "bold");
    obj.label332:setFontColor("yellow");
    obj.label332:setFontFamily("kalam");
    obj.label332:setCursor("handPoint");
    obj.label332:setHitTest(true);
    obj.label332:setName("label332");

    obj.Arma47 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma47:setParent(obj.Armadura47);
    obj.Arma47:setLeft(41.38);
    obj.Arma47:setTop(61.75);
    obj.Arma47:setWidth(67.88);
    obj.Arma47:setHeight(30);
    obj.Arma47:setCursor("handPoint");
    obj.Arma47:setHitTest(true);
    obj.Arma47:setHint("Clique aqui para comprar");
    obj.Arma47:setName("Arma47");

    obj.image127 = GUI.fromHandle(_obj_newObject("image"));
    obj.image127:setParent(obj.Armadura47);
    obj.image127:setLeft(2.56);
    obj.image127:setTop(93.00);
    obj.image127:setWidth(136.69);
    obj.image127:setHeight(77.69);
    obj.image127:setStyle("proportional");
    obj.image127:setCenter(true);
    obj.image127:setEditable(true);
    obj.image127:setField("ImagemArma47");
    obj.image127:setName("image127");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.Armadura47);
    obj.label333:setLeft(197);
    obj.label333:setTop(10);
    obj.label333:setWidth(249.25);
    obj.label333:setHeight(39);
    obj.label333:setFontSize(22);
    obj.label333:setField("ItemNome47");
    lfm_setPropAsString(obj.label333, "fontStyle",  "bold");
    obj.label333:setFontColor("black");
    obj.label333:setFontFamily("kalam");
    obj.label333:setName("label333");

    obj.label334 = GUI.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.Armadura47);
    obj.label334:setLeft(243.50);
    obj.label334:setTop(46);
    obj.label334:setWidth(149.25);
    obj.label334:setHeight(38.63);
    obj.label334:setHorzTextAlign("center");
    obj.label334:setField("AbsorverAparar47");
    obj.label334:setFontSize(19);
    lfm_setPropAsString(obj.label334, "fontStyle",  "bold");
    obj.label334:setFontColor("black");
    obj.label334:setFontFamily("kalam");
    obj.label334:setName("label334");

    obj.label335 = GUI.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.Armadura47);
    obj.label335:setLeft(182);
    obj.label335:setTop(86.13);
    obj.label335:setWidth(61.88);
    obj.label335:setHeight(38.87);
    obj.label335:setHorzTextAlign("center");
    obj.label335:setField("CD47");
    obj.label335:setFontSize(19);
    lfm_setPropAsString(obj.label335, "fontStyle",  "bold");
    obj.label335:setFontColor("black");
    obj.label335:setFontFamily("kalam");
    obj.label335:setName("label335");

    obj.label336 = GUI.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.Armadura47);
    obj.label336:setLeft(300);
    obj.label336:setTop(127);
    obj.label336:setWidth(61.88);
    obj.label336:setHeight(38.88);
    obj.label336:setHorzTextAlign("center");
    obj.label336:setField("PenalidadedeMovimento47");
    obj.label336:setFontSize(15);
    lfm_setPropAsString(obj.label336, "fontStyle",  "bold");
    obj.label336:setFontColor("black");
    obj.label336:setFontFamily("kalam");
    obj.label336:setName("label336");

    obj.label337 = GUI.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.Armadura47);
    obj.label337:setLeft(336);
    obj.label337:setTop(86.12);
    obj.label337:setWidth(61.88);
    obj.label337:setHeight(38.88);
    obj.label337:setHorzTextAlign("center");
    obj.label337:setField("PenalidadeDePercepcao47");
    obj.label337:setFontSize(19);
    lfm_setPropAsString(obj.label337, "fontStyle",  "bold");
    obj.label337:setFontColor("black");
    obj.label337:setFontFamily("kalam");
    obj.label337:setName("label337");

    obj.Armadura48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura48:setParent(obj.scrollBox3);
    obj.Armadura48:setName("Armadura48");
    obj.Armadura48:setWidth(480);
    obj.Armadura48:setHeight(174);
    obj.Armadura48:setLeft(0);
    obj.Armadura48:setTop(634);

    obj.image128 = GUI.fromHandle(_obj_newObject("image"));
    obj.image128:setParent(obj.Armadura48);
    obj.image128:setSRC("images/LojaparaArmaduras.png");
    obj.image128:setLeft(0);
    obj.image128:setTop(0);
    obj.image128:setWidth(399);
    obj.image128:setHeight(174);
    obj.image128:setName("image128");

    obj.label338 = GUI.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.Armadura48);
    obj.label338:setLeft(22.25);
    obj.label338:setTop(20.50);
    obj.label338:setWidth(107.25);
    obj.label338:setHeight(37.88);
    obj.label338:setFontSize(22);
    obj.label338:setHint("Preço da Arma");
    obj.label338:setField("Preco48");
    obj.label338:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label338, "fontStyle",  "bold");
    obj.label338:setFontColor("yellow");
    obj.label338:setFontFamily("kalam");
    obj.label338:setCursor("handPoint");
    obj.label338:setHitTest(true);
    obj.label338:setName("label338");

    obj.Arma48 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma48:setParent(obj.Armadura48);
    obj.Arma48:setLeft(41.38);
    obj.Arma48:setTop(61.75);
    obj.Arma48:setWidth(67.88);
    obj.Arma48:setHeight(30);
    obj.Arma48:setCursor("handPoint");
    obj.Arma48:setHitTest(true);
    obj.Arma48:setHint("Clique aqui para comprar");
    obj.Arma48:setName("Arma48");

    obj.image129 = GUI.fromHandle(_obj_newObject("image"));
    obj.image129:setParent(obj.Armadura48);
    obj.image129:setLeft(2.56);
    obj.image129:setTop(93.00);
    obj.image129:setWidth(136.69);
    obj.image129:setHeight(77.69);
    obj.image129:setStyle("proportional");
    obj.image129:setCenter(true);
    obj.image129:setEditable(true);
    obj.image129:setField("ImagemArma48");
    obj.image129:setName("image129");

    obj.label339 = GUI.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.Armadura48);
    obj.label339:setLeft(197);
    obj.label339:setTop(10);
    obj.label339:setWidth(249.25);
    obj.label339:setHeight(39);
    obj.label339:setFontSize(15);
    obj.label339:setField("ItemNome48");
    lfm_setPropAsString(obj.label339, "fontStyle",  "bold");
    obj.label339:setFontColor("black");
    obj.label339:setFontFamily("kalam");
    obj.label339:setName("label339");

    obj.label340 = GUI.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.Armadura48);
    obj.label340:setLeft(243.50);
    obj.label340:setTop(47);
    obj.label340:setWidth(149.25);
    obj.label340:setHeight(38.63);
    obj.label340:setHorzTextAlign("center");
    obj.label340:setField("AbsorverAparar48");
    obj.label340:setFontSize(19);
    lfm_setPropAsString(obj.label340, "fontStyle",  "bold");
    obj.label340:setFontColor("black");
    obj.label340:setFontFamily("kalam");
    obj.label340:setName("label340");

    obj.label341 = GUI.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.Armadura48);
    obj.label341:setLeft(182);
    obj.label341:setTop(86.13);
    obj.label341:setWidth(61.88);
    obj.label341:setHeight(38.87);
    obj.label341:setHorzTextAlign("center");
    obj.label341:setField("CD48");
    obj.label341:setFontSize(19);
    lfm_setPropAsString(obj.label341, "fontStyle",  "bold");
    obj.label341:setFontColor("black");
    obj.label341:setFontFamily("kalam");
    obj.label341:setName("label341");

    obj.label342 = GUI.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.Armadura48);
    obj.label342:setLeft(300);
    obj.label342:setTop(127);
    obj.label342:setWidth(61.88);
    obj.label342:setHeight(38.88);
    obj.label342:setHorzTextAlign("center");
    obj.label342:setField("PenalidadedeMovimento48");
    obj.label342:setFontSize(15);
    lfm_setPropAsString(obj.label342, "fontStyle",  "bold");
    obj.label342:setFontColor("black");
    obj.label342:setFontFamily("kalam");
    obj.label342:setName("label342");

    obj.label343 = GUI.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.Armadura48);
    obj.label343:setLeft(336);
    obj.label343:setTop(86.12);
    obj.label343:setWidth(61.88);
    obj.label343:setHeight(38.88);
    obj.label343:setHorzTextAlign("center");
    obj.label343:setField("PenalidadeDePercepcao48");
    obj.label343:setFontSize(19);
    lfm_setPropAsString(obj.label343, "fontStyle",  "bold");
    obj.label343:setFontColor("black");
    obj.label343:setFontFamily("kalam");
    obj.label343:setName("label343");

    obj.Armadura49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura49:setParent(obj.scrollBox3);
    obj.Armadura49:setName("Armadura49");
    obj.Armadura49:setWidth(480);
    obj.Armadura49:setHeight(174);
    obj.Armadura49:setLeft(0);
    obj.Armadura49:setTop(816);

    obj.image130 = GUI.fromHandle(_obj_newObject("image"));
    obj.image130:setParent(obj.Armadura49);
    obj.image130:setSRC("images/LojaparaArmaduras.png");
    obj.image130:setLeft(0);
    obj.image130:setTop(0);
    obj.image130:setWidth(399);
    obj.image130:setHeight(174);
    obj.image130:setName("image130");

    obj.label344 = GUI.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.Armadura49);
    obj.label344:setLeft(22.25);
    obj.label344:setTop(20.50);
    obj.label344:setWidth(107.25);
    obj.label344:setHeight(37.88);
    obj.label344:setFontSize(22);
    obj.label344:setHint("Preço da Arma");
    obj.label344:setField("Preco49");
    obj.label344:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label344, "fontStyle",  "bold");
    obj.label344:setFontColor("yellow");
    obj.label344:setFontFamily("kalam");
    obj.label344:setCursor("handPoint");
    obj.label344:setHitTest(true);
    obj.label344:setName("label344");

    obj.Arma49 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma49:setParent(obj.Armadura49);
    obj.Arma49:setLeft(41.38);
    obj.Arma49:setTop(61.75);
    obj.Arma49:setWidth(67.88);
    obj.Arma49:setHeight(30);
    obj.Arma49:setCursor("handPoint");
    obj.Arma49:setHitTest(true);
    obj.Arma49:setHint("Clique aqui para comprar");
    obj.Arma49:setName("Arma49");

    obj.image131 = GUI.fromHandle(_obj_newObject("image"));
    obj.image131:setParent(obj.Armadura49);
    obj.image131:setLeft(2.56);
    obj.image131:setTop(93.00);
    obj.image131:setWidth(136.69);
    obj.image131:setHeight(77.69);
    obj.image131:setStyle("proportional");
    obj.image131:setCenter(true);
    obj.image131:setEditable(true);
    obj.image131:setField("ImagemArma49");
    obj.image131:setName("image131");

    obj.label345 = GUI.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.Armadura49);
    obj.label345:setLeft(197);
    obj.label345:setTop(10);
    obj.label345:setWidth(249.25);
    obj.label345:setHeight(39);
    obj.label345:setFontSize(16);
    obj.label345:setField("ItemNome49");
    lfm_setPropAsString(obj.label345, "fontStyle",  "bold");
    obj.label345:setFontColor("black");
    obj.label345:setFontFamily("kalam");
    obj.label345:setName("label345");

    obj.label346 = GUI.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.Armadura49);
    obj.label346:setLeft(243.50);
    obj.label346:setTop(47);
    obj.label346:setWidth(149.25);
    obj.label346:setHeight(38.63);
    obj.label346:setHorzTextAlign("center");
    obj.label346:setField("AbsorverAparar49");
    obj.label346:setFontSize(19);
    lfm_setPropAsString(obj.label346, "fontStyle",  "bold");
    obj.label346:setFontColor("black");
    obj.label346:setFontFamily("kalam");
    obj.label346:setName("label346");

    obj.label347 = GUI.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.Armadura49);
    obj.label347:setLeft(182);
    obj.label347:setTop(86.13);
    obj.label347:setWidth(61.88);
    obj.label347:setHeight(38.87);
    obj.label347:setHorzTextAlign("center");
    obj.label347:setField("CD49");
    obj.label347:setFontSize(19);
    lfm_setPropAsString(obj.label347, "fontStyle",  "bold");
    obj.label347:setFontColor("black");
    obj.label347:setFontFamily("kalam");
    obj.label347:setName("label347");

    obj.label348 = GUI.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.Armadura49);
    obj.label348:setLeft(300);
    obj.label348:setTop(127);
    obj.label348:setWidth(61.88);
    obj.label348:setHeight(38.88);
    obj.label348:setHorzTextAlign("center");
    obj.label348:setField("PenalidadedeMovimento49");
    obj.label348:setFontSize(15);
    lfm_setPropAsString(obj.label348, "fontStyle",  "bold");
    obj.label348:setFontColor("black");
    obj.label348:setFontFamily("kalam");
    obj.label348:setName("label348");

    obj.label349 = GUI.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.Armadura49);
    obj.label349:setLeft(336);
    obj.label349:setTop(86.12);
    obj.label349:setWidth(61.88);
    obj.label349:setHeight(38.88);
    obj.label349:setHorzTextAlign("center");
    obj.label349:setField("PenalidadeDePercepcao49");
    obj.label349:setFontSize(19);
    lfm_setPropAsString(obj.label349, "fontStyle",  "bold");
    obj.label349:setFontColor("black");
    obj.label349:setFontFamily("kalam");
    obj.label349:setName("label349");

    obj.Armadura50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura50:setParent(obj.scrollBox3);
    obj.Armadura50:setName("Armadura50");
    obj.Armadura50:setWidth(480);
    obj.Armadura50:setHeight(174);
    obj.Armadura50:setLeft(0);
    obj.Armadura50:setTop(998);

    obj.image132 = GUI.fromHandle(_obj_newObject("image"));
    obj.image132:setParent(obj.Armadura50);
    obj.image132:setSRC("images/LojaparaArmaduras.png");
    obj.image132:setLeft(0);
    obj.image132:setTop(0);
    obj.image132:setWidth(399);
    obj.image132:setHeight(174);
    obj.image132:setName("image132");

    obj.label350 = GUI.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.Armadura50);
    obj.label350:setLeft(22.25);
    obj.label350:setTop(20.50);
    obj.label350:setWidth(107.25);
    obj.label350:setHeight(37.88);
    obj.label350:setFontSize(22);
    obj.label350:setHint("Preço da Arma");
    obj.label350:setField("Preco50");
    obj.label350:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label350, "fontStyle",  "bold");
    obj.label350:setFontColor("yellow");
    obj.label350:setFontFamily("kalam");
    obj.label350:setCursor("handPoint");
    obj.label350:setHitTest(true);
    obj.label350:setName("label350");

    obj.Arma50 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma50:setParent(obj.Armadura50);
    obj.Arma50:setLeft(41.38);
    obj.Arma50:setTop(61.75);
    obj.Arma50:setWidth(67.88);
    obj.Arma50:setHeight(30);
    obj.Arma50:setCursor("handPoint");
    obj.Arma50:setHitTest(true);
    obj.Arma50:setHint("Clique aqui para comprar");
    obj.Arma50:setName("Arma50");

    obj.image133 = GUI.fromHandle(_obj_newObject("image"));
    obj.image133:setParent(obj.Armadura50);
    obj.image133:setLeft(2.56);
    obj.image133:setTop(93.00);
    obj.image133:setWidth(136.69);
    obj.image133:setHeight(77.69);
    obj.image133:setStyle("proportional");
    obj.image133:setCenter(true);
    obj.image133:setEditable(true);
    obj.image133:setField("ImagemArma50");
    obj.image133:setName("image133");

    obj.label351 = GUI.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.Armadura50);
    obj.label351:setLeft(197);
    obj.label351:setTop(10);
    obj.label351:setWidth(249.25);
    obj.label351:setHeight(39);
    obj.label351:setFontSize(16.5);
    obj.label351:setField("ItemNome50");
    lfm_setPropAsString(obj.label351, "fontStyle",  "bold");
    obj.label351:setFontColor("black");
    obj.label351:setFontFamily("kalam");
    obj.label351:setName("label351");

    obj.label352 = GUI.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.Armadura50);
    obj.label352:setLeft(243.50);
    obj.label352:setTop(47);
    obj.label352:setWidth(149.25);
    obj.label352:setHeight(38.63);
    obj.label352:setHorzTextAlign("center");
    obj.label352:setField("AbsorverAparar50");
    obj.label352:setFontSize(19);
    lfm_setPropAsString(obj.label352, "fontStyle",  "bold");
    obj.label352:setFontColor("black");
    obj.label352:setFontFamily("kalam");
    obj.label352:setName("label352");

    obj.label353 = GUI.fromHandle(_obj_newObject("label"));
    obj.label353:setParent(obj.Armadura50);
    obj.label353:setLeft(182);
    obj.label353:setTop(86.13);
    obj.label353:setWidth(61.88);
    obj.label353:setHeight(38.87);
    obj.label353:setHorzTextAlign("center");
    obj.label353:setField("CD50");
    obj.label353:setFontSize(19);
    lfm_setPropAsString(obj.label353, "fontStyle",  "bold");
    obj.label353:setFontColor("black");
    obj.label353:setFontFamily("kalam");
    obj.label353:setName("label353");

    obj.label354 = GUI.fromHandle(_obj_newObject("label"));
    obj.label354:setParent(obj.Armadura50);
    obj.label354:setLeft(300);
    obj.label354:setTop(127);
    obj.label354:setWidth(61.88);
    obj.label354:setHeight(38.88);
    obj.label354:setHorzTextAlign("center");
    obj.label354:setField("PenalidadedeMovimento50");
    obj.label354:setFontSize(15);
    lfm_setPropAsString(obj.label354, "fontStyle",  "bold");
    obj.label354:setFontColor("black");
    obj.label354:setFontFamily("kalam");
    obj.label354:setName("label354");

    obj.label355 = GUI.fromHandle(_obj_newObject("label"));
    obj.label355:setParent(obj.Armadura50);
    obj.label355:setLeft(336);
    obj.label355:setTop(86.12);
    obj.label355:setWidth(61.88);
    obj.label355:setHeight(38.88);
    obj.label355:setHorzTextAlign("center");
    obj.label355:setField("PenalidadeDePercepcao50");
    obj.label355:setFontSize(19);
    lfm_setPropAsString(obj.label355, "fontStyle",  "bold");
    obj.label355:setFontColor("black");
    obj.label355:setFontFamily("kalam");
    obj.label355:setName("label355");

    obj.Armadura51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura51:setParent(obj.scrollBox3);
    obj.Armadura51:setName("Armadura51");
    obj.Armadura51:setWidth(480);
    obj.Armadura51:setHeight(174);
    obj.Armadura51:setLeft(413);
    obj.Armadura51:setTop(88);

    obj.image134 = GUI.fromHandle(_obj_newObject("image"));
    obj.image134:setParent(obj.Armadura51);
    obj.image134:setSRC("images/LojaparaArmaduras.png");
    obj.image134:setLeft(0);
    obj.image134:setTop(0);
    obj.image134:setWidth(399);
    obj.image134:setHeight(174);
    obj.image134:setName("image134");

    obj.label356 = GUI.fromHandle(_obj_newObject("label"));
    obj.label356:setParent(obj.Armadura51);
    obj.label356:setLeft(22.25);
    obj.label356:setTop(20.50);
    obj.label356:setWidth(107.25);
    obj.label356:setHeight(37.88);
    obj.label356:setFontSize(22);
    obj.label356:setHint("Preço da Arma");
    obj.label356:setField("Preco51");
    obj.label356:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label356, "fontStyle",  "bold");
    obj.label356:setFontColor("yellow");
    obj.label356:setFontFamily("kalam");
    obj.label356:setCursor("handPoint");
    obj.label356:setHitTest(true);
    obj.label356:setName("label356");

    obj.Arma51 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma51:setParent(obj.Armadura51);
    obj.Arma51:setLeft(41.38);
    obj.Arma51:setTop(61.75);
    obj.Arma51:setWidth(67.88);
    obj.Arma51:setHeight(30);
    obj.Arma51:setCursor("handPoint");
    obj.Arma51:setHitTest(true);
    obj.Arma51:setHint("Clique aqui para comprar");
    obj.Arma51:setName("Arma51");

    obj.image135 = GUI.fromHandle(_obj_newObject("image"));
    obj.image135:setParent(obj.Armadura51);
    obj.image135:setLeft(2.56);
    obj.image135:setTop(93.00);
    obj.image135:setWidth(136.69);
    obj.image135:setHeight(77.69);
    obj.image135:setStyle("proportional");
    obj.image135:setCenter(true);
    obj.image135:setEditable(true);
    obj.image135:setField("ImagemArma51");
    obj.image135:setName("image135");

    obj.label357 = GUI.fromHandle(_obj_newObject("label"));
    obj.label357:setParent(obj.Armadura51);
    obj.label357:setLeft(197);
    obj.label357:setTop(10);
    obj.label357:setWidth(249.25);
    obj.label357:setHeight(39);
    obj.label357:setFontSize(18);
    obj.label357:setField("ItemNome51");
    lfm_setPropAsString(obj.label357, "fontStyle",  "bold");
    obj.label357:setFontColor("black");
    obj.label357:setFontFamily("kalam");
    obj.label357:setName("label357");

    obj.label358 = GUI.fromHandle(_obj_newObject("label"));
    obj.label358:setParent(obj.Armadura51);
    obj.label358:setLeft(243.51);
    obj.label358:setTop(47);
    obj.label358:setWidth(149.25);
    obj.label358:setHeight(38.63);
    obj.label358:setHorzTextAlign("center");
    obj.label358:setField("AbsorverAparar51");
    obj.label358:setFontSize(19);
    lfm_setPropAsString(obj.label358, "fontStyle",  "bold");
    obj.label358:setFontColor("black");
    obj.label358:setFontFamily("kalam");
    obj.label358:setName("label358");

    obj.label359 = GUI.fromHandle(_obj_newObject("label"));
    obj.label359:setParent(obj.Armadura51);
    obj.label359:setLeft(182);
    obj.label359:setTop(86.13);
    obj.label359:setWidth(61.88);
    obj.label359:setHeight(38.87);
    obj.label359:setHorzTextAlign("center");
    obj.label359:setField("CD51");
    obj.label359:setFontSize(19);
    lfm_setPropAsString(obj.label359, "fontStyle",  "bold");
    obj.label359:setFontColor("black");
    obj.label359:setFontFamily("kalam");
    obj.label359:setName("label359");

    obj.label360 = GUI.fromHandle(_obj_newObject("label"));
    obj.label360:setParent(obj.Armadura51);
    obj.label360:setLeft(300);
    obj.label360:setTop(127);
    obj.label360:setWidth(61.88);
    obj.label360:setHeight(38.88);
    obj.label360:setHorzTextAlign("center");
    obj.label360:setField("PenalidadedeMovimento51");
    obj.label360:setFontSize(15);
    lfm_setPropAsString(obj.label360, "fontStyle",  "bold");
    obj.label360:setFontColor("black");
    obj.label360:setFontFamily("kalam");
    obj.label360:setName("label360");

    obj.label361 = GUI.fromHandle(_obj_newObject("label"));
    obj.label361:setParent(obj.Armadura51);
    obj.label361:setLeft(336);
    obj.label361:setTop(86.12);
    obj.label361:setWidth(61.88);
    obj.label361:setHeight(38.88);
    obj.label361:setHorzTextAlign("center");
    obj.label361:setField("PenalidadeDePercepcao51");
    obj.label361:setFontSize(19);
    lfm_setPropAsString(obj.label361, "fontStyle",  "bold");
    obj.label361:setFontColor("black");
    obj.label361:setFontFamily("kalam");
    obj.label361:setName("label361");

    obj.Armadura52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura52:setParent(obj.scrollBox3);
    obj.Armadura52:setName("Armadura52");
    obj.Armadura52:setWidth(480);
    obj.Armadura52:setHeight(174);
    obj.Armadura52:setLeft(413);
    obj.Armadura52:setTop(270);

    obj.image136 = GUI.fromHandle(_obj_newObject("image"));
    obj.image136:setParent(obj.Armadura52);
    obj.image136:setSRC("images/LojaparaArmaduras.png");
    obj.image136:setLeft(0);
    obj.image136:setTop(0);
    obj.image136:setWidth(399);
    obj.image136:setHeight(174);
    obj.image136:setName("image136");

    obj.label362 = GUI.fromHandle(_obj_newObject("label"));
    obj.label362:setParent(obj.Armadura52);
    obj.label362:setLeft(22.25);
    obj.label362:setTop(20.50);
    obj.label362:setWidth(107.25);
    obj.label362:setHeight(37.88);
    obj.label362:setFontSize(22);
    obj.label362:setHint("Preço da Arma");
    obj.label362:setField("Preco52");
    obj.label362:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label362, "fontStyle",  "bold");
    obj.label362:setFontColor("yellow");
    obj.label362:setFontFamily("kalam");
    obj.label362:setCursor("handPoint");
    obj.label362:setHitTest(true);
    obj.label362:setName("label362");

    obj.Arma52 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma52:setParent(obj.Armadura52);
    obj.Arma52:setLeft(41.38);
    obj.Arma52:setTop(61.75);
    obj.Arma52:setWidth(67.88);
    obj.Arma52:setHeight(30);
    obj.Arma52:setCursor("handPoint");
    obj.Arma52:setHitTest(true);
    obj.Arma52:setHint("Clique aqui para comprar");
    obj.Arma52:setName("Arma52");

    obj.image137 = GUI.fromHandle(_obj_newObject("image"));
    obj.image137:setParent(obj.Armadura52);
    obj.image137:setLeft(2.56);
    obj.image137:setTop(93.00);
    obj.image137:setWidth(136.69);
    obj.image137:setHeight(77.69);
    obj.image137:setStyle("proportional");
    obj.image137:setCenter(true);
    obj.image137:setEditable(true);
    obj.image137:setField("ImagemArma52");
    obj.image137:setName("image137");

    obj.label363 = GUI.fromHandle(_obj_newObject("label"));
    obj.label363:setParent(obj.Armadura52);
    obj.label363:setLeft(197);
    obj.label363:setTop(10);
    obj.label363:setWidth(249.25);
    obj.label363:setHeight(39);
    obj.label363:setFontSize(16);
    obj.label363:setField("ItemNome52");
    lfm_setPropAsString(obj.label363, "fontStyle",  "bold");
    obj.label363:setFontColor("black");
    obj.label363:setFontFamily("kalam");
    obj.label363:setName("label363");

    obj.label364 = GUI.fromHandle(_obj_newObject("label"));
    obj.label364:setParent(obj.Armadura52);
    obj.label364:setLeft(243.51);
    obj.label364:setTop(47);
    obj.label364:setWidth(149.25);
    obj.label364:setHeight(38.63);
    obj.label364:setHorzTextAlign("center");
    obj.label364:setField("AbsorverAparar52");
    obj.label364:setFontSize(19);
    lfm_setPropAsString(obj.label364, "fontStyle",  "bold");
    obj.label364:setFontColor("black");
    obj.label364:setFontFamily("kalam");
    obj.label364:setName("label364");

    obj.label365 = GUI.fromHandle(_obj_newObject("label"));
    obj.label365:setParent(obj.Armadura52);
    obj.label365:setLeft(182);
    obj.label365:setTop(86.13);
    obj.label365:setWidth(61.88);
    obj.label365:setHeight(38.87);
    obj.label365:setHorzTextAlign("center");
    obj.label365:setField("CD52");
    obj.label365:setFontSize(19);
    lfm_setPropAsString(obj.label365, "fontStyle",  "bold");
    obj.label365:setFontColor("black");
    obj.label365:setFontFamily("kalam");
    obj.label365:setName("label365");

    obj.label366 = GUI.fromHandle(_obj_newObject("label"));
    obj.label366:setParent(obj.Armadura52);
    obj.label366:setLeft(300);
    obj.label366:setTop(127);
    obj.label366:setWidth(61.88);
    obj.label366:setHeight(38.88);
    obj.label366:setHorzTextAlign("center");
    obj.label366:setField("PenalidadedeMovimento52");
    obj.label366:setFontSize(15);
    lfm_setPropAsString(obj.label366, "fontStyle",  "bold");
    obj.label366:setFontColor("black");
    obj.label366:setFontFamily("kalam");
    obj.label366:setName("label366");

    obj.label367 = GUI.fromHandle(_obj_newObject("label"));
    obj.label367:setParent(obj.Armadura52);
    obj.label367:setLeft(336);
    obj.label367:setTop(86.12);
    obj.label367:setWidth(61.88);
    obj.label367:setHeight(38.88);
    obj.label367:setHorzTextAlign("center");
    obj.label367:setField("PenalidadeDePercepcao52");
    obj.label367:setFontSize(19);
    lfm_setPropAsString(obj.label367, "fontStyle",  "bold");
    obj.label367:setFontColor("black");
    obj.label367:setFontFamily("kalam");
    obj.label367:setName("label367");

    obj.Armadura53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura53:setParent(obj.scrollBox3);
    obj.Armadura53:setName("Armadura53");
    obj.Armadura53:setWidth(480);
    obj.Armadura53:setHeight(174);
    obj.Armadura53:setLeft(413);
    obj.Armadura53:setTop(634);

    obj.image138 = GUI.fromHandle(_obj_newObject("image"));
    obj.image138:setParent(obj.Armadura53);
    obj.image138:setSRC("images/LojaparaArmaduras.png");
    obj.image138:setLeft(0);
    obj.image138:setTop(0);
    obj.image138:setWidth(399);
    obj.image138:setHeight(174);
    obj.image138:setName("image138");

    obj.label368 = GUI.fromHandle(_obj_newObject("label"));
    obj.label368:setParent(obj.Armadura53);
    obj.label368:setLeft(22.25);
    obj.label368:setTop(20.50);
    obj.label368:setWidth(107.25);
    obj.label368:setHeight(37.88);
    obj.label368:setFontSize(18);
    obj.label368:setHint("Preço da Arma");
    obj.label368:setField("Preco53");
    obj.label368:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label368, "fontStyle",  "bold");
    obj.label368:setFontColor("yellow");
    obj.label368:setFontFamily("kalam");
    obj.label368:setCursor("handPoint");
    obj.label368:setHitTest(true);
    obj.label368:setName("label368");

    obj.Arma53 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma53:setParent(obj.Armadura53);
    obj.Arma53:setLeft(41.38);
    obj.Arma53:setTop(61.75);
    obj.Arma53:setWidth(67.88);
    obj.Arma53:setHeight(30);
    obj.Arma53:setCursor("handPoint");
    obj.Arma53:setHitTest(true);
    obj.Arma53:setHint("Clique aqui para comprar");
    obj.Arma53:setName("Arma53");

    obj.image139 = GUI.fromHandle(_obj_newObject("image"));
    obj.image139:setParent(obj.Armadura53);
    obj.image139:setLeft(2.56);
    obj.image139:setTop(93.00);
    obj.image139:setWidth(136.69);
    obj.image139:setHeight(77.69);
    obj.image139:setStyle("proportional");
    obj.image139:setCenter(true);
    obj.image139:setEditable(true);
    obj.image139:setField("ImagemArma53");
    obj.image139:setName("image139");

    obj.label369 = GUI.fromHandle(_obj_newObject("label"));
    obj.label369:setParent(obj.Armadura53);
    obj.label369:setLeft(197);
    obj.label369:setTop(10);
    obj.label369:setWidth(249.25);
    obj.label369:setHeight(39);
    obj.label369:setFontSize(16);
    obj.label369:setField("ItemNome53");
    lfm_setPropAsString(obj.label369, "fontStyle",  "bold");
    obj.label369:setFontColor("black");
    obj.label369:setFontFamily("kalam");
    obj.label369:setName("label369");

    obj.label370 = GUI.fromHandle(_obj_newObject("label"));
    obj.label370:setParent(obj.Armadura53);
    obj.label370:setLeft(243.51);
    obj.label370:setTop(47);
    obj.label370:setWidth(149.25);
    obj.label370:setHeight(38.63);
    obj.label370:setHorzTextAlign("center");
    obj.label370:setField("AbsorverAparar53");
    obj.label370:setFontSize(19);
    lfm_setPropAsString(obj.label370, "fontStyle",  "bold");
    obj.label370:setFontColor("black");
    obj.label370:setFontFamily("kalam");
    obj.label370:setName("label370");

    obj.label371 = GUI.fromHandle(_obj_newObject("label"));
    obj.label371:setParent(obj.Armadura53);
    obj.label371:setLeft(182);
    obj.label371:setTop(86.13);
    obj.label371:setWidth(61.88);
    obj.label371:setHeight(38.87);
    obj.label371:setHorzTextAlign("center");
    obj.label371:setField("CD53");
    obj.label371:setFontSize(19);
    lfm_setPropAsString(obj.label371, "fontStyle",  "bold");
    obj.label371:setFontColor("black");
    obj.label371:setFontFamily("kalam");
    obj.label371:setName("label371");

    obj.label372 = GUI.fromHandle(_obj_newObject("label"));
    obj.label372:setParent(obj.Armadura53);
    obj.label372:setLeft(300);
    obj.label372:setTop(127);
    obj.label372:setWidth(61.88);
    obj.label372:setHeight(38.88);
    obj.label372:setHorzTextAlign("center");
    obj.label372:setField("PenalidadedeMovimento53");
    obj.label372:setFontSize(15);
    lfm_setPropAsString(obj.label372, "fontStyle",  "bold");
    obj.label372:setFontColor("black");
    obj.label372:setFontFamily("kalam");
    obj.label372:setName("label372");

    obj.label373 = GUI.fromHandle(_obj_newObject("label"));
    obj.label373:setParent(obj.Armadura53);
    obj.label373:setLeft(336);
    obj.label373:setTop(86.12);
    obj.label373:setWidth(61.88);
    obj.label373:setHeight(38.88);
    obj.label373:setHorzTextAlign("center");
    obj.label373:setField("PenalidadeDePercepcao53");
    obj.label373:setFontSize(19);
    lfm_setPropAsString(obj.label373, "fontStyle",  "bold");
    obj.label373:setFontColor("black");
    obj.label373:setFontFamily("kalam");
    obj.label373:setName("label373");

    obj.Armadura54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura54:setParent(obj.scrollBox3);
    obj.Armadura54:setName("Armadura54");
    obj.Armadura54:setWidth(480);
    obj.Armadura54:setHeight(174);
    obj.Armadura54:setLeft(413);
    obj.Armadura54:setTop(452);

    obj.image140 = GUI.fromHandle(_obj_newObject("image"));
    obj.image140:setParent(obj.Armadura54);
    obj.image140:setSRC("images/LojaparaArmaduras.png");
    obj.image140:setLeft(0);
    obj.image140:setTop(0);
    obj.image140:setWidth(399);
    obj.image140:setHeight(174);
    obj.image140:setName("image140");

    obj.label374 = GUI.fromHandle(_obj_newObject("label"));
    obj.label374:setParent(obj.Armadura54);
    obj.label374:setLeft(22.25);
    obj.label374:setTop(20.50);
    obj.label374:setWidth(107.25);
    obj.label374:setHeight(37.88);
    obj.label374:setFontSize(22);
    obj.label374:setHint("Preço da Arma");
    obj.label374:setField("Preco54");
    obj.label374:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label374, "fontStyle",  "bold");
    obj.label374:setFontColor("yellow");
    obj.label374:setFontFamily("kalam");
    obj.label374:setCursor("handPoint");
    obj.label374:setHitTest(true);
    obj.label374:setName("label374");

    obj.Arma54 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma54:setParent(obj.Armadura54);
    obj.Arma54:setLeft(41.38);
    obj.Arma54:setTop(61.75);
    obj.Arma54:setWidth(67.88);
    obj.Arma54:setHeight(30);
    obj.Arma54:setCursor("handPoint");
    obj.Arma54:setHitTest(true);
    obj.Arma54:setHint("Clique aqui para comprar");
    obj.Arma54:setName("Arma54");

    obj.image141 = GUI.fromHandle(_obj_newObject("image"));
    obj.image141:setParent(obj.Armadura54);
    obj.image141:setLeft(2.56);
    obj.image141:setTop(93.00);
    obj.image141:setWidth(136.69);
    obj.image141:setHeight(77.69);
    obj.image141:setStyle("proportional");
    obj.image141:setCenter(true);
    obj.image141:setEditable(true);
    obj.image141:setField("ImagemArma54");
    obj.image141:setName("image141");

    obj.label375 = GUI.fromHandle(_obj_newObject("label"));
    obj.label375:setParent(obj.Armadura54);
    obj.label375:setLeft(197);
    obj.label375:setTop(10);
    obj.label375:setWidth(249.25);
    obj.label375:setHeight(39);
    obj.label375:setFontSize(14.8);
    obj.label375:setField("ItemNome54");
    lfm_setPropAsString(obj.label375, "fontStyle",  "bold");
    obj.label375:setFontColor("black");
    obj.label375:setFontFamily("kalam");
    obj.label375:setName("label375");

    obj.label376 = GUI.fromHandle(_obj_newObject("label"));
    obj.label376:setParent(obj.Armadura54);
    obj.label376:setLeft(243.51);
    obj.label376:setTop(47);
    obj.label376:setWidth(149.25);
    obj.label376:setHeight(38.63);
    obj.label376:setHorzTextAlign("center");
    obj.label376:setField("AbsorverAparar54");
    obj.label376:setFontSize(19);
    lfm_setPropAsString(obj.label376, "fontStyle",  "bold");
    obj.label376:setFontColor("black");
    obj.label376:setFontFamily("kalam");
    obj.label376:setName("label376");

    obj.label377 = GUI.fromHandle(_obj_newObject("label"));
    obj.label377:setParent(obj.Armadura54);
    obj.label377:setLeft(182);
    obj.label377:setTop(86.13);
    obj.label377:setWidth(61.88);
    obj.label377:setHeight(38.87);
    obj.label377:setHorzTextAlign("center");
    obj.label377:setField("CD54");
    obj.label377:setFontSize(19.9);
    lfm_setPropAsString(obj.label377, "fontStyle",  "bold");
    obj.label377:setFontColor("black");
    obj.label377:setFontFamily("kalam");
    obj.label377:setName("label377");

    obj.label378 = GUI.fromHandle(_obj_newObject("label"));
    obj.label378:setParent(obj.Armadura54);
    obj.label378:setLeft(300);
    obj.label378:setTop(127);
    obj.label378:setWidth(61.88);
    obj.label378:setHeight(38.88);
    obj.label378:setHorzTextAlign("center");
    obj.label378:setField("PenalidadedeMovimento54");
    obj.label378:setFontSize(15);
    lfm_setPropAsString(obj.label378, "fontStyle",  "bold");
    obj.label378:setFontColor("black");
    obj.label378:setFontFamily("kalam");
    obj.label378:setName("label378");

    obj.label379 = GUI.fromHandle(_obj_newObject("label"));
    obj.label379:setParent(obj.Armadura54);
    obj.label379:setLeft(336);
    obj.label379:setTop(86.12);
    obj.label379:setWidth(61.88);
    obj.label379:setHeight(38.88);
    obj.label379:setHorzTextAlign("center");
    obj.label379:setField("PenalidadeDePercepcao54");
    obj.label379:setFontSize(19);
    lfm_setPropAsString(obj.label379, "fontStyle",  "bold");
    obj.label379:setFontColor("black");
    obj.label379:setFontFamily("kalam");
    obj.label379:setName("label379");

    obj.Armadura55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura55:setParent(obj.scrollBox3);
    obj.Armadura55:setName("Armadura55");
    obj.Armadura55:setWidth(480);
    obj.Armadura55:setHeight(174);
    obj.Armadura55:setLeft(413);
    obj.Armadura55:setTop(816);

    obj.image142 = GUI.fromHandle(_obj_newObject("image"));
    obj.image142:setParent(obj.Armadura55);
    obj.image142:setSRC("images/LojaparaArmaduras.png");
    obj.image142:setLeft(0);
    obj.image142:setTop(0);
    obj.image142:setWidth(399);
    obj.image142:setHeight(174);
    obj.image142:setName("image142");

    obj.label380 = GUI.fromHandle(_obj_newObject("label"));
    obj.label380:setParent(obj.Armadura55);
    obj.label380:setLeft(22.25);
    obj.label380:setTop(20.50);
    obj.label380:setWidth(107.25);
    obj.label380:setHeight(37.88);
    obj.label380:setFontSize(22);
    obj.label380:setHint("Preço da Arma");
    obj.label380:setField("Preco55");
    obj.label380:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label380, "fontStyle",  "bold");
    obj.label380:setFontColor("yellow");
    obj.label380:setFontFamily("kalam");
    obj.label380:setCursor("handPoint");
    obj.label380:setHitTest(true);
    obj.label380:setName("label380");

    obj.Arma55 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma55:setParent(obj.Armadura55);
    obj.Arma55:setLeft(41.38);
    obj.Arma55:setTop(61.75);
    obj.Arma55:setWidth(67.88);
    obj.Arma55:setHeight(30);
    obj.Arma55:setCursor("handPoint");
    obj.Arma55:setHitTest(true);
    obj.Arma55:setHint("Clique aqui para comprar");
    obj.Arma55:setName("Arma55");

    obj.image143 = GUI.fromHandle(_obj_newObject("image"));
    obj.image143:setParent(obj.Armadura55);
    obj.image143:setLeft(2.56);
    obj.image143:setTop(93.00);
    obj.image143:setWidth(136.69);
    obj.image143:setHeight(77.69);
    obj.image143:setStyle("proportional");
    obj.image143:setCenter(true);
    obj.image143:setEditable(true);
    obj.image143:setField("ImagemArma55");
    obj.image143:setName("image143");

    obj.label381 = GUI.fromHandle(_obj_newObject("label"));
    obj.label381:setParent(obj.Armadura55);
    obj.label381:setLeft(197);
    obj.label381:setTop(10);
    obj.label381:setWidth(249.25);
    obj.label381:setHeight(39);
    obj.label381:setFontSize(22);
    obj.label381:setField("ItemNome55");
    lfm_setPropAsString(obj.label381, "fontStyle",  "bold");
    obj.label381:setFontColor("black");
    obj.label381:setFontFamily("kalam");
    obj.label381:setName("label381");

    obj.label382 = GUI.fromHandle(_obj_newObject("label"));
    obj.label382:setParent(obj.Armadura55);
    obj.label382:setLeft(243.51);
    obj.label382:setTop(47);
    obj.label382:setWidth(149.25);
    obj.label382:setHeight(38.63);
    obj.label382:setHorzTextAlign("center");
    obj.label382:setField("AbsorverAparar55");
    obj.label382:setFontSize(19);
    lfm_setPropAsString(obj.label382, "fontStyle",  "bold");
    obj.label382:setFontColor("black");
    obj.label382:setFontFamily("kalam");
    obj.label382:setName("label382");

    obj.label383 = GUI.fromHandle(_obj_newObject("label"));
    obj.label383:setParent(obj.Armadura55);
    obj.label383:setLeft(182);
    obj.label383:setTop(86.13);
    obj.label383:setWidth(61.88);
    obj.label383:setHeight(38.87);
    obj.label383:setHorzTextAlign("center");
    obj.label383:setField("CD55");
    obj.label383:setFontSize(19);
    lfm_setPropAsString(obj.label383, "fontStyle",  "bold");
    obj.label383:setFontColor("black");
    obj.label383:setFontFamily("kalam");
    obj.label383:setName("label383");

    obj.label384 = GUI.fromHandle(_obj_newObject("label"));
    obj.label384:setParent(obj.Armadura55);
    obj.label384:setLeft(300);
    obj.label384:setTop(127);
    obj.label384:setWidth(61.88);
    obj.label384:setHeight(38.88);
    obj.label384:setHorzTextAlign("center");
    obj.label384:setField("PenalidadedeMovimento55");
    obj.label384:setFontSize(15);
    lfm_setPropAsString(obj.label384, "fontStyle",  "bold");
    obj.label384:setFontColor("black");
    obj.label384:setFontFamily("kalam");
    obj.label384:setName("label384");

    obj.label385 = GUI.fromHandle(_obj_newObject("label"));
    obj.label385:setParent(obj.Armadura55);
    obj.label385:setLeft(336);
    obj.label385:setTop(86.12);
    obj.label385:setWidth(61.88);
    obj.label385:setHeight(38.88);
    obj.label385:setHorzTextAlign("center");
    obj.label385:setField("PenalidadeDePercepcao55");
    obj.label385:setFontSize(19);
    lfm_setPropAsString(obj.label385, "fontStyle",  "bold");
    obj.label385:setFontColor("black");
    obj.label385:setFontFamily("kalam");
    obj.label385:setName("label385");

    obj.Armadura56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura56:setParent(obj.scrollBox3);
    obj.Armadura56:setName("Armadura56");
    obj.Armadura56:setWidth(480);
    obj.Armadura56:setHeight(174);
    obj.Armadura56:setLeft(413);
    obj.Armadura56:setTop(998);

    obj.image144 = GUI.fromHandle(_obj_newObject("image"));
    obj.image144:setParent(obj.Armadura56);
    obj.image144:setSRC("images/LojaparaArmaduras.png");
    obj.image144:setLeft(0);
    obj.image144:setTop(0);
    obj.image144:setWidth(399);
    obj.image144:setHeight(174);
    obj.image144:setName("image144");

    obj.label386 = GUI.fromHandle(_obj_newObject("label"));
    obj.label386:setParent(obj.Armadura56);
    obj.label386:setLeft(22.25);
    obj.label386:setTop(20.50);
    obj.label386:setWidth(107.25);
    obj.label386:setHeight(37.88);
    obj.label386:setFontSize(22);
    obj.label386:setHint("Preço da Arma");
    obj.label386:setField("Preco56");
    obj.label386:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label386, "fontStyle",  "bold");
    obj.label386:setFontColor("yellow");
    obj.label386:setFontFamily("kalam");
    obj.label386:setCursor("handPoint");
    obj.label386:setHitTest(true);
    obj.label386:setName("label386");

    obj.Arma56 = GUI.fromHandle(_obj_newObject("image"));
    obj.Arma56:setParent(obj.Armadura56);
    obj.Arma56:setLeft(41.38);
    obj.Arma56:setTop(61.75);
    obj.Arma56:setWidth(67.88);
    obj.Arma56:setHeight(30);
    obj.Arma56:setCursor("handPoint");
    obj.Arma56:setHitTest(true);
    obj.Arma56:setHint("Clique aqui para comprar");
    obj.Arma56:setName("Arma56");

    obj.image145 = GUI.fromHandle(_obj_newObject("image"));
    obj.image145:setParent(obj.Armadura56);
    obj.image145:setLeft(2.56);
    obj.image145:setTop(93.00);
    obj.image145:setWidth(136.69);
    obj.image145:setHeight(77.69);
    obj.image145:setStyle("proportional");
    obj.image145:setCenter(true);
    obj.image145:setEditable(true);
    obj.image145:setField("ImagemArma56");
    obj.image145:setName("image145");

    obj.label387 = GUI.fromHandle(_obj_newObject("label"));
    obj.label387:setParent(obj.Armadura56);
    obj.label387:setLeft(197);
    obj.label387:setTop(10);
    obj.label387:setWidth(249.25);
    obj.label387:setHeight(39);
    obj.label387:setFontSize(22);
    obj.label387:setField("ItemNome56");
    lfm_setPropAsString(obj.label387, "fontStyle",  "bold");
    obj.label387:setFontColor("black");
    obj.label387:setFontFamily("kalam");
    obj.label387:setName("label387");

    obj.label388 = GUI.fromHandle(_obj_newObject("label"));
    obj.label388:setParent(obj.Armadura56);
    obj.label388:setLeft(243.51);
    obj.label388:setTop(47);
    obj.label388:setWidth(149.25);
    obj.label388:setHeight(38.63);
    obj.label388:setHorzTextAlign("center");
    obj.label388:setField("AbsorverAparar56");
    obj.label388:setFontSize(19);
    lfm_setPropAsString(obj.label388, "fontStyle",  "bold");
    obj.label388:setFontColor("black");
    obj.label388:setFontFamily("kalam");
    obj.label388:setName("label388");

    obj.label389 = GUI.fromHandle(_obj_newObject("label"));
    obj.label389:setParent(obj.Armadura56);
    obj.label389:setLeft(182);
    obj.label389:setTop(86.13);
    obj.label389:setWidth(61.88);
    obj.label389:setHeight(38.87);
    obj.label389:setHorzTextAlign("center");
    obj.label389:setField("CD56");
    obj.label389:setFontSize(19);
    lfm_setPropAsString(obj.label389, "fontStyle",  "bold");
    obj.label389:setFontColor("black");
    obj.label389:setFontFamily("kalam");
    obj.label389:setName("label389");

    obj.label390 = GUI.fromHandle(_obj_newObject("label"));
    obj.label390:setParent(obj.Armadura56);
    obj.label390:setLeft(300);
    obj.label390:setTop(127);
    obj.label390:setWidth(61.88);
    obj.label390:setHeight(38.88);
    obj.label390:setHorzTextAlign("center");
    obj.label390:setField("PenalidadedeMovimento56");
    obj.label390:setFontSize(15);
    lfm_setPropAsString(obj.label390, "fontStyle",  "bold");
    obj.label390:setFontColor("black");
    obj.label390:setFontFamily("kalam");
    obj.label390:setName("label390");

    obj.label391 = GUI.fromHandle(_obj_newObject("label"));
    obj.label391:setParent(obj.Armadura56);
    obj.label391:setLeft(336);
    obj.label391:setTop(86.12);
    obj.label391:setWidth(61.88);
    obj.label391:setHeight(38.88);
    obj.label391:setHorzTextAlign("center");
    obj.label391:setField("PenalidadeDePercepcao56");
    obj.label391:setFontSize(19);
    lfm_setPropAsString(obj.label391, "fontStyle",  "bold");
    obj.label391:setFontColor("black");
    obj.label391:setFontFamily("kalam");
    obj.label391:setName("label391");

    obj._e_event0 = obj.image2:addEventListener("onClick",
        function (_)
            self.ApresentaLoja.visible = false;
                        self.LojaDeArmas.visible = true;
        end, obj);

    obj._e_event1 = obj.image3:addEventListener("onClick",
        function (_)
            self.LojaCorpoACorpo.visible = true
                        self.ApresentaLoja.visible = false;
        end, obj);

    obj._e_event2 = obj.image4:addEventListener("onClick",
        function (_)
            self.ApresentaLoja.visible = false;
                        self.LojaArmaduras.visible = true;
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            sheet.Preco = ''
                    sheet.ItemNome = ''
                    sheet.Iniciativa = ''
                    sheet.DanoItem = ''
                    sheet.Alcance = ''
                    sheet.Cadencia = ''
                    sheet.Municao = ''
                    sheet.ClasseDeDureza = ''
                    sheet.ImagemArma = ''     
                    sheet.Preco2 = ''
                    sheet.ItemNome2 = ''
                    sheet.Iniciativa2 = ''
                    sheet.DanoItem2 = ''
                    sheet.Alcance2 = ''
                    sheet.Cadencia2 = ''
                    sheet.Municao2 = ''
                    sheet.ClasseDeDureza2 = ''
                    sheet.ImagemArma2 = ''
                    sheet.Preco3 = ''
                    sheet.ItemNome3 = ''
                    sheet.Iniciativa3 = ''
                    sheet.DanoItem3 = ''
                    sheet.Alcance3 = ''
                    sheet.Cadencia3 = ''
                    sheet.Municao3 = ''
                    sheet.ClasseDeDureza3 = ''
                    sheet.ImagemArma3 = ''   
                    sheet.Preco4 = ''
            sheet.ItemNome4 = ''
            sheet.Iniciativa4 = ''
            sheet.DanoItem4 = ''
            sheet.Alcance4 = ''
            sheet.Cadencia4 = ''
            sheet.Municao4 = ''
            sheet.ClasseDeDureza4 = ''
            sheet.ImagemArma4 = ''
            
            sheet.Preco5 = ''
            sheet.ItemNome5 = ''
            sheet.Iniciativa5 = ''
            sheet.DanoItem5 = ''
            sheet.Alcance5 = ''
            sheet.Cadencia5 = ''
            sheet.Municao5 = ''
            sheet.ClasseDeDureza5 = ''
            sheet.ImagemArma5 = ''
            
            sheet.Preco6 = ''
            sheet.ItemNome6 = ''
            sheet.Iniciativa6 = ''
            sheet.DanoItem6 = ''
            sheet.Alcance6 = ''
            sheet.Cadencia6 = ''
            sheet.Municao6 = ''
            sheet.ClasseDeDureza6 = ''
            sheet.ImagemArma6 = ''
            
            sheet.Preco7 = ''
            sheet.ItemNome7 = ''
            sheet.Iniciativa7 = ''
            sheet.DanoItem7 = ''
            sheet.Alcance7 = ''
            sheet.Cadencia7 = ''
            sheet.Municao7 = ''
            sheet.ClasseDeDureza7 = ''
            sheet.ImagemArma7 = ''
            
            sheet.Preco8 = ''
            sheet.ItemNome8 = ''
            sheet.Iniciativa8 = ''
            sheet.DanoItem8 = ''
            sheet.Alcance8 = ''
            sheet.Cadencia8 = ''
            sheet.Municao8 = ''
            sheet.ClasseDeDureza8 = ''
            sheet.ImagemArma8 = ''
            
            sheet.Preco9 = ''
            sheet.ItemNome9 = ''
            sheet.Iniciativa9 = ''
            sheet.DanoItem9 = ''
            sheet.Alcance9 = ''
            sheet.Cadencia9 = ''
            sheet.Municao9 = ''
            sheet.ClasseDeDureza9 = ''
            sheet.ImagemArma9 = ''
            
            sheet.Preco10 = ''
            sheet.ItemNome10 = ''
            sheet.Iniciativa10 = ''
            sheet.DanoItem10 = ''
            sheet.Alcance10 = ''
            sheet.Cadencia10 = ''
            sheet.Municao10 = ''
            sheet.ClasseDeDureza10 = ''
            sheet.ImagemArma10 = ''
            
            sheet.Preco11 = ''
            sheet.ItemNome11 = ''
            sheet.Iniciativa11 = ''
            sheet.DanoItem11 = ''
            sheet.Alcance11 = ''
            sheet.Cadencia11 = ''
            sheet.Municao11 = ''
            sheet.ClasseDeDureza11 = ''
            sheet.ImagemArma11 = ''
            
            sheet.Preco12 = ''
            sheet.ItemNome12 = ''
            sheet.Iniciativa12 = ''
            sheet.DanoItem12 = ''
            sheet.Alcance12 = ''
            sheet.Cadencia12 = ''
            sheet.Municao12 = ''
            sheet.ClasseDeDureza12 = ''
            sheet.ImagemArma12 = ''
            sheet.Preco13 = ''
            sheet.ItemNome13 = ''
            sheet.Iniciativa13 = ''
            sheet.DanoItem13 = ''
            sheet.Alcance13 = ''
            sheet.Cadencia13 = ''
            sheet.Municao13 = ''
            sheet.ClasseDeDureza13 = ''
            sheet.ImagemArma13 = ''
            sheet.Preco14 = ''
            sheet.ItemNome14 = ''
            sheet.Iniciativa14 = ''
            sheet.DanoItem14 = ''
            sheet.Alcance14 = ''
            sheet.Cadencia14 = ''
            sheet.Municao14 = ''
            sheet.ClasseDeDureza14 = ''
            sheet.ImagemArma14 = ''
            sheet.Preco15 = ''
            sheet.ItemNome15 = ''
            sheet.Iniciativa15 = ''
            sheet.DanoItem15 = ''
            sheet.Alcance15 = ''
            sheet.Cadencia15 = ''
            sheet.Municao15 = ''
            sheet.ClasseDeDureza15 = ''
            sheet.ImagemArma15 = ''
            sheet.Preco16 = ''
            sheet.ItemNome16 = ''
            sheet.Iniciativa16 = ''
            sheet.DanoItem16 = ''
            sheet.Alcance16 = ''
            sheet.Cadencia16 = ''
            sheet.Municao16 = ''
            sheet.ClasseDeDureza16 = ''
            sheet.ImagemArma16 = ''
            sheet.Preco17 = ''
            sheet.ItemNome17 = ''
            sheet.Iniciativa17 = ''
            sheet.DanoItem17 = ''
            sheet.Alcance17 = ''
            sheet.Cadencia17 = ''
            sheet.Municao17 = ''
            sheet.ClasseDeDureza17 = ''
            sheet.ImagemArma17 = ''
            sheet.Preco18 = ''
            sheet.ItemNome18 = ''
            sheet.Iniciativa18 = ''
            sheet.DanoItem18 = ''
            sheet.Alcance18 = ''
            sheet.Cadencia18 = ''
            sheet.Municao18 = ''
            sheet.ClasseDeDureza18 = ''
            sheet.ImagemArma18 = ''
            sheet.Preco19 = ''
            sheet.ItemNome19 = ''
            sheet.Iniciativa19 = ''
            sheet.DanoItem19 = ''
            sheet.Alcance19 = ''
            sheet.Cadencia19 = ''
            sheet.Municao19 = ''
            sheet.ClasseDeDureza19 = ''
            sheet.ImagemArma19 = ''
            sheet.Preco20 = ''
            sheet.ItemNome20 = ''
            sheet.Iniciativa20 = ''
            sheet.DanoItem20 = ''
            sheet.Alcance20 = ''
            sheet.Cadencia20 = ''
            sheet.Municao20 = ''
            sheet.ClasseDeDureza20 = ''
            sheet.ImagemArma20 = ''
            sheet.Preco21 = ''
            sheet.ItemNome21 = ''
            sheet.Iniciativa21 = ''
            sheet.DanoItem21 = ''
            sheet.Alcance21 = ''
            sheet.Cadencia21 = ''
            sheet.Municao21 = ''
            sheet.ClasseDeDureza21 = ''
            sheet.ImagemArma21 = ''
            sheet.Preco22 = ''
            sheet.ItemNome22 = ''
            sheet.Iniciativa22 = ''
            sheet.DanoItem22 = ''
            sheet.Alcance22 = ''
            sheet.Cadencia22 = ''
            sheet.Municao22 = ''
            sheet.ClasseDeDureza22 = ''
            sheet.ImagemArma22 = ''
            sheet.Preco23 = ''
            sheet.ItemNome23 = ''
            sheet.Iniciativa23 = ''
            sheet.DanoItem23 = ''
            sheet.Alcance23 = ''
            sheet.Cadencia23 = ''
            sheet.Municao23 = ''
            sheet.ClasseDeDureza23 = ''
            sheet.ImagemArma23 = ''
            sheet.Preco24 = ''
            sheet.ItemNome24 = ''
            sheet.Iniciativa24 = ''
            sheet.DanoItem24 = ''
            sheet.Alcance24 = ''
            sheet.Cadencia24 = ''
            sheet.Municao24 = ''
            sheet.ClasseDeDureza24 = ''
            sheet.ImagemArma24 = ''
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            sheet.Preco = '1200'
            Iniciativa = '-2'
            sheet.DanoItem = '+4'
            sheet.Alcance = 'C'
            sheet.Cadencia = 'Único'
            sheet.Municao = '1'
            sheet.ClasseDeDureza = '2'
            sheet.ImagemArma = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.Preco2 = '1200'
            
            sheet.Iniciativa2 = '-2'
            sheet.DanoItem2 = '+4'
            sheet.Alcance2 = 'C'
            sheet.Cadencia2 = 'Único'
            sheet.Municao2 = '1'
            sheet.ClasseDeDureza2 = '2'
            sheet.ImagemArma2 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.Preco3 = '1200'
            
            sheet.Iniciativa3 = '-2'
            sheet.DanoItem3 = '+4'
            sheet.Alcance3 = 'C'
            sheet.Cadencia3 = 'Único'
            sheet.Municao3 = '1'
            sheet.ClasseDeDureza3 = '2'
            sheet.ImagemArma3 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.Preco4 = '1200'
            
            sheet.Iniciativa4 = '-2'
            sheet.DanoItem4 = '+4'
            sheet.Alcance4 = 'C'
            sheet.Cadencia4 = 'Único'
            sheet.Municao4 = '1'
            sheet.ClasseDeDureza4 = '2'
            sheet.ImagemArma4 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.Preco5 = '1200'
            
            sheet.Iniciativa5 = '-2'
            sheet.DanoItem5 = '+4'
            sheet.Alcance5 = 'C'
            sheet.Cadencia5 = 'Único'
            sheet.Municao5 = '1'
            sheet.ClasseDeDureza5 = '2'
            sheet.ImagemArma5 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco6 = '1200'
            
            sheet.Iniciativa6 = '-2'
            sheet.DanoItem6 = '+4'
            sheet.Alcance6 = 'C'
            sheet.Cadencia6 = 'Único'
            sheet.Municao6 = '1'
            sheet.ClasseDeDureza6 = '2'
            sheet.ImagemArma6 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco7 = '1200'
            
            sheet.Iniciativa7 = '-2'
            sheet.DanoItem7 = '+4'
            sheet.Alcance7 = 'C'
            sheet.Cadencia7 = 'Único'
            sheet.Municao7 = '1'
            sheet.ClasseDeDureza7 = '2'
            sheet.ImagemArma7 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco8 = '1200'
            
            sheet.Iniciativa8 = '-2'
            sheet.DanoItem8 = '+4'
            sheet.Alcance8 = 'C'
            sheet.Cadencia8 = 'Único'
            sheet.Municao8 = '1'
            sheet.ClasseDeDureza8 = '2'
            sheet.ImagemArma8 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco9 = '1200'
            
            sheet.Iniciativa9 = '-2'
            sheet.DanoItem9 = '+4'
            sheet.Alcance9 = 'C'
            sheet.Cadencia9 = 'Único'
            sheet.Municao9 = '1'
            sheet.ClasseDeDureza9 = '2'
            sheet.ImagemArma9 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco10 = '1200'
            
            sheet.Iniciativa10 = '-2'
            sheet.DanoItem10 = '+4'
            sheet.Alcance10 = 'C'
            sheet.Cadencia10 = 'Único'
            sheet.Municao10 = '1'
            sheet.ClasseDeDureza10 = '2'
            sheet.ImagemArma10 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco11 = '1200'
            
            sheet.Iniciativa11 = '-2'
            sheet.DanoItem11 = '+4'
            sheet.Alcance11 = 'C'
            sheet.Cadencia11 = 'Único'
            sheet.Municao11 = '1'
            sheet.ClasseDeDureza11 = '2'
            sheet.ImagemArma11 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco12 = '1200'
            
            sheet.Iniciativa12 = '-2'
            sheet.DanoItem12 = '+4'
            sheet.Alcance12 = 'C'
            sheet.Cadencia12 = 'Único'
            sheet.Municao12 = '1'
            sheet.ClasseDeDureza12 = '2'
            sheet.ImagemArma12 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.Preco13 = '1200'
            
            sheet.Iniciativa13 = '-2'
            sheet.DanoItem13 = '+4'
            sheet.Alcance13 = 'C'
            sheet.Cadencia13 = 'Único'
            sheet.Municao13 = '1'
            sheet.ClasseDeDureza13 = '2'
            sheet.ImagemArma13 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco14 = '1200'
            
            sheet.Iniciativa14 = '-2'
            sheet.DanoItem14 = '+4'
            sheet.Alcance14 = 'C'
            sheet.Cadencia14 = 'Único'
            sheet.Municao14 = '1'
            sheet.ClasseDeDureza14 = '2'
            sheet.ImagemArma14 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco15 = '1200'
            
            sheet.Iniciativa15 = '-2'
            sheet.DanoItem15 = '+4'
            sheet.Alcance15 = 'C'
            sheet.Cadencia15 = 'Único'
            sheet.Municao15 = '1'
            sheet.ClasseDeDureza15 = '2'
            sheet.ImagemArma15 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco16 = '1200'
            
            sheet.Iniciativa16 = '-2'
            sheet.DanoItem16 = '+4'
            sheet.Alcance16 = 'C'
            sheet.Cadencia16 = 'Único'
            sheet.Municao16 = '1'
            sheet.ClasseDeDureza16 = '2'
            sheet.ImagemArma16 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco17 = '1200'
            
            sheet.Iniciativa17 = '-2'
            sheet.DanoItem17 = '+4'
            sheet.Alcance17 = 'C'
            sheet.Cadencia17 = 'Único'
            sheet.Municao17 = '1'
            sheet.ClasseDeDureza17 = '2'
            sheet.ImagemArma17 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco18 = '1200'
            
            sheet.Iniciativa18 = '-2'
            sheet.DanoItem18 = '+4'
            sheet.Alcance18 = 'C'
            sheet.Cadencia18 = 'Único'
            sheet.Municao18 = '1'
            sheet.ClasseDeDureza18 = '2'
            sheet.ImagemArma18 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco19 = '1200'
            
            sheet.Iniciativa19 = '-2'
            sheet.DanoItem19 = '+4'
            sheet.Alcance19 = 'C'
            sheet.Cadencia19 = 'Único'
            sheet.Municao19 = '1'
            sheet.ClasseDeDureza19 = '2'
            sheet.ImagemArma19 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco20 = '1200'
            
            sheet.Iniciativa20 = '-2'
            sheet.DanoItem20 = '+4'
            sheet.Alcance20 = 'C'
            sheet.Cadencia20 = 'Único'
            sheet.Municao20 = '1'
            sheet.ClasseDeDureza20 = '2'
            sheet.ImagemArma20 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco21 = '1200'
            
            sheet.Iniciativa21 = '-2'
            sheet.DanoItem21 = '+4'
            sheet.Alcance21 = 'C'
            sheet.Cadencia21 = 'Único'
            sheet.Municao21 = '1'
            sheet.ClasseDeDureza21 = '2'
            sheet.ImagemArma21 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco22 = '1200'
            
            sheet.Iniciativa22 = '-2'
            sheet.DanoItem22 = '+4'
            sheet.Alcance22 = 'C'
            sheet.Cadencia22 = 'Único'
            sheet.Municao22 = '1'
            sheet.ClasseDeDureza22 = '2'
            sheet.ImagemArma22 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco23 = '1200'
            
            sheet.Iniciativa23 = '-2'
            sheet.DanoItem23 = '+4'
            sheet.Alcance23 = 'C'
            sheet.Cadencia23 = 'Único'
            sheet.Municao23 = '1'
            sheet.ClasseDeDureza23 = '2'
            sheet.ImagemArma23 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            
            sheet.Preco24 = '1200'
            
            sheet.Iniciativa24 = '-2'
            sheet.DanoItem24 = '+4'
            sheet.Alcance24 = 'C'
            sheet.Cadencia24 = 'Único'
            sheet.Municao24 = '1'
            sheet.ClasseDeDureza24 = '2'
            sheet.ImagemArma24 = 'http://blob.firecast.com.br/blobs/PBNIHBCS_287618.png'
            sheet.ItemNome = 'Arco'
            sheet.ItemNome2 = 'Artilharia Leve'
            sheet.ItemNome3 = 'Artilharia Pesado'
            sheet.ItemNome4 = 'Besta'
            sheet.ItemNome5 = 'Espingarda de Cano Duplo'
            sheet.ItemNome6 = 'Espingarda Leve'
            sheet.ItemNome7 = 'Granada de Mão'
            sheet.ItemNome8 = 'Lançador de Míssel'
            sheet.ItemNome9 = 'Metralhadora'
            sheet.ItemNome10 = 'Metralhadora Pequena'
            sheet.ItemNome11 = 'Metralhadora Pesada'
            sheet.ItemNome12 = 'Mina, Anti-Veículo'
            sheet.ItemNome13 = 'Mina, Antipessoal'
            sheet.ItemNome14 = 'Missil de Tanque'
            sheet.ItemNome15 = 'Molotov'
            sheet.ItemNome16 = 'Pistola Leve'
            sheet.ItemNome17 = 'Revolver Pesado'
            sheet.ItemNome18 = 'Rifle de Assalto Leve 7'
            sheet.ItemNome19 = 'Rifle de Assalto Pesado'
            sheet.ItemNome20 = 'Rifle de Caça'
            sheet.ItemNome21 = 'Rifle de Precisão'
            sheet.ItemNome22 = 'Shotgun'
            sheet.ItemNome23 = 'Submetralhadora'
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
                    local s = string.format("%d", math.floor(v))
                    local pos = string.len(s) % 3 
                    if pos == 0 then pos = 3 end
                    return string.sub(s, 1, pos)
                        .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
                        .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
                    
                    end;
                      self.labSoma2.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event6 = obj.image6:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                      sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event7 = obj.image7:addEventListener("onClick",
        function (_)
            self.LojaDeArmas.visible = false;
                        self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event8 = obj.label1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco = (sheet.Preco or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event9 = obj.image9:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								    local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario");
                                        else
                                 showMessage("Você não mais dinheiro"); 	
            		end;
        end, obj);

    obj._e_event10 = obj.label9:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco2 = (sheet.Preco2 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event11 = obj.image12:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome2
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event12 = obj.label17:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco3 = (sheet.Preco3 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event13 = obj.image15:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome3
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event14 = obj.label25:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco4 = (sheet.Preco4 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event15 = obj.image18:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome4
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event16 = obj.label33:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco5 = (sheet.Preco5 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event17 = obj.image21:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome5
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event18 = obj.label41:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco6 = (sheet.Preco6 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event19 = obj.image24:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome6
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event20 = obj.label49:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco7 = (sheet.Preco7 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event21 = obj.image27:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome7
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event22 = obj.label57:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco8 = (sheet.Preco8 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event23 = obj.image30:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome8
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event24 = obj.label65:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco9 = (sheet.Preco9 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event25 = obj.image33:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome9
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event26 = obj.label73:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco10 = (sheet.Preco10 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event27 = obj.image36:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome10
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event28 = obj.label82:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco11 = (sheet.Preco11 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event29 = obj.image39:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome11
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event30 = obj.label90:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco12 = (sheet.Preco12 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event31 = obj.image42:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome12
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event32 = obj.label98:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco13 = (sheet.Preco13 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event33 = obj.image45:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome13
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event34 = obj.label106:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco14 = (sheet.Preco14 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event35 = obj.image48:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome14
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event36 = obj.label114:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco15 = (sheet.Preco15 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event37 = obj.image51:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome15
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event38 = obj.label122:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco16 = (sheet.Preco16 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event39 = obj.image54:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome16
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event40 = obj.label130:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco17 = (sheet.Preco17 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event41 = obj.image57:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome17
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event42 = obj.label138:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco18 = (sheet.Preco18 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event43 = obj.image60:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome18
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event44 = obj.label146:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco19 = (sheet.Preco19 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event45 = obj.image63:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome19
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event46 = obj.label154:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco20 = (sheet.Preco20 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event47 = obj.image66:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome20
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event48 = obj.label162:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco21 = (sheet.Preco21 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event49 = obj.image69:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome21
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event50 = obj.label170:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco22 = (sheet.Preco22 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event51 = obj.image72:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome22
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event52 = obj.label178:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco23 = (sheet.Preco23 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event53 = obj.image75:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome23
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event54 = obj.label186:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco24 = (sheet.Preco24 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event55 = obj.image78:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
            						         if Soma >= 0 then
                                            
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                                                showMessage("Você acabou de comprar uma arma, olhe no seu inventario"); self.boxDetalhesDoItem.node.nome = sheet.ItemNome24
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event56 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.ItemNome25 = ''
                sheet.Iniciativa25 = ''
                sheet.DanoItem25 = ''
                sheet.Golpear25 = ''
                sheet.Aparar25 = ''
                sheet.CD25 = ''
                
                sheet.ItemNome26 = ''
                sheet.Iniciativa26 = ''
                sheet.DanoItem26 = ''
                sheet.Golpear26 = ''
                sheet.Aparar26 = ''
                sheet.CD26 = ''
                
                sheet.ItemNome27 = ''
                sheet.Iniciativa27 = ''
                sheet.DanoItem27 = ''
                sheet.Golpear27 = ''
                sheet.Aparar27 = ''
                sheet.CD27 = ''
                
                sheet.ItemNome28 = ''
                sheet.Iniciativa28 = ''
                sheet.DanoItem28 = ''
                sheet.Golpear28 = ''
                sheet.Aparar28 = ''
                sheet.CD28 = ''
                
                sheet.ItemNome29 = ''
                sheet.Iniciativa29 = ''
                sheet.DanoItem29 = ''
                sheet.Golpear29 = ''
                sheet.Aparar29 = ''
                sheet.CD29 = ''
                
                sheet.ItemNome30 = ''
                sheet.Iniciativa30 = ''
                sheet.DanoItem30 = ''
                sheet.Golpear30 = ''
                sheet.Aparar30 = ''
                sheet.CD30 = ''
                
                sheet.ItemNome31 = ''
                sheet.Iniciativa31 = ''
                sheet.DanoItem31 = ''
                sheet.Golpear31 = ''
                sheet.Aparar31 = ''
                sheet.CD31 = ''
                
                sheet.ItemNome32 = ''
                sheet.Iniciativa32 = ''
                sheet.DanoItem32 = ''
                sheet.Golpear32 = ''
                sheet.Aparar32 = ''
                sheet.CD32 = ''
                
                sheet.ItemNome33 = ''
                sheet.Iniciativa33 = ''
                sheet.DanoItem33 = ''
                sheet.Golpear33 = ''
                sheet.Aparar33 = ''
                sheet.CD33 = ''
                
                sheet.ItemNome34 = ''
                sheet.Iniciativa34 = ''
                sheet.DanoItem34 = ''
                sheet.Golpear34 = ''
                sheet.Aparar34 = ''
                sheet.CD34 = ''
                
                sheet.ItemNome35 = ''
                sheet.Iniciativa35 = ''
                sheet.DanoItem35 = ''
                sheet.Golpear35 = ''
                sheet.Aparar35 = ''
                sheet.CD35 = ''
                
                sheet.ItemNome36 = ''
                sheet.Iniciativa36 = ''
                sheet.DanoItem36 = ''
                sheet.Golpear36 = ''
                sheet.Aparar36 = ''
                sheet.CD36 = ''
                
                sheet.ItemNome37 = ''
                sheet.Iniciativa37 = ''
                sheet.DanoItem37 = ''
                sheet.Golpear37 = ''
                sheet.Aparar37 = ''
                sheet.CD37 = ''
                
                sheet.ItemNome38 = ''
                sheet.Iniciativa38 = ''
                sheet.DanoItem38 = ''
                sheet.Golpear38 = ''
                sheet.Aparar38 = ''
                sheet.CD38 = ''
                
                sheet.ItemNome39 = ''
                sheet.Iniciativa39 = ''
                sheet.DanoItem39 = ''
                sheet.Golpear39 = ''
                sheet.Aparar39 = ''
                sheet.CD39 = ''
                
                sheet.ItemNome40 = ''
                sheet.Iniciativa40 = ''
                sheet.DanoItem40 = ''
                sheet.Golpear40 = ''
                sheet.Aparar40 = ''
                sheet.CD40 = ''
                
                sheet.ItemNome41 = ''
                sheet.Iniciativa41 = ''
                sheet.DanoItem41 = ''
                sheet.Golpear41 = ''
                sheet.Aparar41 = ''
                sheet.CD41 = ''
                
                sheet.ItemNome42 = ''
                sheet.DanoItem42 = ''
                sheet.Iniciativa42 = ''
                sheet.Golpear42 = ''
                sheet.Aparar42 = ''
                sheet.CD42 = ''
            
                sheet.ItemNome43 = ''
                sheet.DanoItem43 = ''
                sheet.Iniciativa43 = ''
                sheet.Golpear43 = ''
                sheet.Aparar43 = ''
                sheet.CD43 = ''
        end, obj);

    obj._e_event57 = obj.button4:addEventListener("onClick",
        function (_)
            sheet.Preco25 = '1200'
                        sheet.ImagemArma25 = 'https://montblancbr.vteximg.com.br/arquivos/ids/161838-490-490/10883_1.jpg?v=637511754991900000'
                        sheet.ItemNome25 = 'Caneta/Lapis'
                        sheet.Iniciativa25 = '-2'
                        sheet.DanoItem25 = '+4'
                        sheet.Golpear25 = 'C'
                        sheet.Aparar25 = 'Único'
                        sheet.CD25 = '1'
                        sheet.ClasseDeDureza25 = '2'
                        sheet.Preco25 = '1200'
        end, obj);

    obj._e_event58 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
                local s = string.format("%d", math.floor(v))
                local pos = string.len(s) % 3 
                if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
                    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
                    .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
                
                end;
                  self.labSoma4.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event59 = obj.image81:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                dialogs.inputQuery("Carteira", "Novo valor:", "",
                                   function (valorPreenchido)
                                              sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                end);
                                end;
        end, obj);

    obj._e_event60 = obj.image82:addEventListener("onClick",
        function (_)
            self.LojaCorpoACorpo.visible = false;
                    self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event61 = obj.label194:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco25 = (sheet.Preco25 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event62 = obj.Arma25:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event63 = obj.label201:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco26 = (sheet.Preco26 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event64 = obj.Arma26:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                                       if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                                    local chat = minhaMesa.chat; 
                                    chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                             showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                              else
                                       showMessage("Você não mais dinheiro"); 	
                      end;
        end, obj);

    obj._e_event65 = obj.label208:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco27 = (sheet.Preco27 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event66 = obj.Arma27:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event67 = obj.label215:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco28 = (sheet.Preco28 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event68 = obj.Arma28:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event69 = obj.label222:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco29 = (sheet.Preco29 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event70 = obj.Arma29:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event71 = obj.label229:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco30 = (sheet.Preco30 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event72 = obj.Arma30:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event73 = obj.label236:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco31 = (sheet.Preco31 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event74 = obj.Arma31:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event75 = obj.label243:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco32 = (sheet.Preco32 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event76 = obj.Arma32:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe no sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event77 = obj.label250:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco33 = (sheet.Preco33 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event78 = obj.Arma33:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event79 = obj.label257:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco34 = (sheet.Preco34 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event80 = obj.Arma34:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                                      else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event81 = obj.label264:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco35 = (sheet.Preco35 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event82 = obj.Arma35:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event83 = obj.label271:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco36 = (sheet.Preco36 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event84 = obj.Arma36:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event85 = obj.label278:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco37 = (sheet.Preco37 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event86 = obj.Arma37:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event87 = obj.label285:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                      dialogs.inputQuery("Carteira", "Novo valor:", "",
                         function (valorPreenchido)
                              sheet.Preco38 = (sheet.Preco38 or 0 ) + valorPreenchido; 
                      end);
                      end;
        end, obj);

    obj._e_event88 = obj.Arma38:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                                     if Soma >= 0 then
                  local minhaMesa = rrpg.getMesaDe(sheet); 
                                  local chat = minhaMesa.chat; 
                                  chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                           showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                               else
                                     showMessage("Você não mais dinheiro"); 	
                    end;
        end, obj);

    obj._e_event89 = obj.label292:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                      dialogs.inputQuery("Carteira", "Novo valor:", "",
                         function (valorPreenchido)
                              sheet.Preco39 = (sheet.Preco39 or 0 ) + valorPreenchido; 
                      end);
                      end;
        end, obj);

    obj._e_event90 = obj.Arma39:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                                     if Soma >= 0 then
                  local minhaMesa = rrpg.getMesaDe(sheet); 
                                  local chat = minhaMesa.chat; 
                                  chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                           showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                               else
                                     showMessage("Você não mais dinheiro"); 	
                    end;
        end, obj);

    obj._e_event91 = obj.label299:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco40 = (sheet.Preco40 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event92 = obj.Arma40:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                                       if Soma >= 0 then
                    local minhaMesa = rrpg.getMesaDe(sheet); 
                                    local chat = minhaMesa.chat; 
                                    chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                             showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                                 else
                                       showMessage("Você não mais dinheiro"); 	
                      end;
        end, obj);

    obj._e_event93 = obj.label306:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco41 = (sheet.Preco41 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event94 = obj.Arma41:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event95 = obj.label313:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco42 = (sheet.Preco42 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event96 = obj.Arma42:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                                       if Soma >= 0 then
                    local minhaMesa = rrpg.getMesaDe(sheet); 
                                    local chat = minhaMesa.chat; 
                                    chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                             showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                                 else
                                       showMessage("Você não mais dinheiro"); 	
                      end;
        end, obj);

    obj._e_event97 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
                        local s = string.format("%d", math.floor(v))
                        local pos = string.len(s) % 3 
                        if pos == 0 then pos = 3 end
                        return string.sub(s, 1, pos)
                            .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
                            .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
                        
                        end;
                          self.labSoma5.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event98 = obj.image120:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                                           function (valorPreenchido)
                                                      sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                        end);
                                        end;
        end, obj);

    obj._e_event99 = obj.image121:addEventListener("onClick",
        function (_)
            self.LojaArmaduras.visible = false;
                            self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event100 = obj.label320:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco45 = (sheet.Preco45 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event101 = obj.Arma45:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event102 = obj.label326:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco46 = (sheet.Preco46 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event103 = obj.Arma46:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event104 = obj.label332:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco47 = (sheet.Preco47 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event105 = obj.Arma47:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event106 = obj.label338:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco48 = (sheet.Preco48 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event107 = obj.Arma48:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event108 = obj.label344:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco49 = (sheet.Preco49 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event109 = obj.Arma49:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event110 = obj.label350:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco50 = (sheet.Preco50 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event111 = obj.Arma50:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event112 = obj.label356:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco51 = (sheet.Preco51 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event113 = obj.Arma51:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event114 = obj.label362:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco52 = (sheet.Preco52 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event115 = obj.Arma52:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event116 = obj.label368:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco53 = (sheet.Preco53 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event117 = obj.Arma53:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event118 = obj.label374:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco54 = (sheet.Preco54 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event119 = obj.Arma54:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event120 = obj.label380:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco55 = (sheet.Preco55 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event121 = obj.Arma55:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    obj._e_event122 = obj.label386:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco56 = (sheet.Preco56 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event123 = obj.Arma56:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -1200;
                               if Soma >= 0 then
            local minhaMesa = rrpg.getMesaDe(sheet); 
                            local chat = minhaMesa.chat; 
                            chat:enviarMensagem("/me [§K12][§B]Comprou uma arma. ");
                     showMessage("Você acabou de comprar uma arma corpo a corpo, olhe na sua mochila");
                         else
                               showMessage("Você não mais dinheiro"); 	
              end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.image74 ~= nil then self.image74:destroy(); self.image74 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.Arma34 ~= nil then self.Arma34:destroy(); self.Arma34 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.image94 ~= nil then self.image94:destroy(); self.image94 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.LojaDeArmas ~= nil then self.LojaDeArmas:destroy(); self.LojaDeArmas = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.image117 ~= nil then self.image117:destroy(); self.image117 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.CorpoACorpo35 ~= nil then self.CorpoACorpo35:destroy(); self.CorpoACorpo35 = nil; end;
        if self.Armadura52 ~= nil then self.Armadura52:destroy(); self.Armadura52 = nil; end;
        if self.image142 ~= nil then self.image142:destroy(); self.image142 = nil; end;
        if self.Arma22 ~= nil then self.Arma22:destroy(); self.Arma22 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.image80 ~= nil then self.image80:destroy(); self.image80 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.Arma35 ~= nil then self.Arma35:destroy(); self.Arma35 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.Armadura49 ~= nil then self.Armadura49:destroy(); self.Armadura49 = nil; end;
        if self.image135 ~= nil then self.image135:destroy(); self.image135 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.image126 ~= nil then self.image126:destroy(); self.image126 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.CorpoACorpo40 ~= nil then self.CorpoACorpo40:destroy(); self.CorpoACorpo40 = nil; end;
        if self.image110 ~= nil then self.image110:destroy(); self.image110 = nil; end;
        if self.image136 ~= nil then self.image136:destroy(); self.image136 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.Arma29 ~= nil then self.Arma29:destroy(); self.Arma29 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.image70 ~= nil then self.image70:destroy(); self.image70 = nil; end;
        if self.image101 ~= nil then self.image101:destroy(); self.image101 = nil; end;
        if self.image85 ~= nil then self.image85:destroy(); self.image85 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label367 ~= nil then self.label367:destroy(); self.label367 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label359 ~= nil then self.label359:destroy(); self.label359 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.Arma33 ~= nil then self.Arma33:destroy(); self.Arma33 = nil; end;
        if self.Arma56 ~= nil then self.Arma56:destroy(); self.Arma56 = nil; end;
        if self.label364 ~= nil then self.label364:destroy(); self.label364 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.Arma45 ~= nil then self.Arma45:destroy(); self.Arma45 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.label348 ~= nil then self.label348:destroy(); self.label348 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.Arma36 ~= nil then self.Arma36:destroy(); self.Arma36 = nil; end;
        if self.Armadura56 ~= nil then self.Armadura56:destroy(); self.Armadura56 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.image124 ~= nil then self.image124:destroy(); self.image124 = nil; end;
        if self.label386 ~= nil then self.label386:destroy(); self.label386 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.image79 ~= nil then self.image79:destroy(); self.image79 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.CorpoACorpo34 ~= nil then self.CorpoACorpo34:destroy(); self.CorpoACorpo34 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.Arma54 ~= nil then self.Arma54:destroy(); self.Arma54 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image118 ~= nil then self.image118:destroy(); self.image118 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.Armadura54 ~= nil then self.Armadura54:destroy(); self.Armadura54 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.image106 ~= nil then self.image106:destroy(); self.image106 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.image107 ~= nil then self.image107:destroy(); self.image107 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label366 ~= nil then self.label366:destroy(); self.label366 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label372 ~= nil then self.label372:destroy(); self.label372 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.label378 ~= nil then self.label378:destroy(); self.label378 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.image95 ~= nil then self.image95:destroy(); self.image95 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.Arma7 ~= nil then self.Arma7:destroy(); self.Arma7 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.Arma37 ~= nil then self.Arma37:destroy(); self.Arma37 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.CorpoACorpo38 ~= nil then self.CorpoACorpo38:destroy(); self.CorpoACorpo38 = nil; end;
        if self.label381 ~= nil then self.label381:destroy(); self.label381 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.image91 ~= nil then self.image91:destroy(); self.image91 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.label376 ~= nil then self.label376:destroy(); self.label376 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.image92 ~= nil then self.image92:destroy(); self.image92 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.Arma50 ~= nil then self.Arma50:destroy(); self.Arma50 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label375 ~= nil then self.label375:destroy(); self.label375 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.Arma20 ~= nil then self.Arma20:destroy(); self.Arma20 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.image103 ~= nil then self.image103:destroy(); self.image103 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.image140 ~= nil then self.image140:destroy(); self.image140 = nil; end;
        if self.label382 ~= nil then self.label382:destroy(); self.label382 = nil; end;
        if self.label377 ~= nil then self.label377:destroy(); self.label377 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.Arma28 ~= nil then self.Arma28:destroy(); self.Arma28 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.image123 ~= nil then self.image123:destroy(); self.image123 = nil; end;
        if self.Arma2 ~= nil then self.Arma2:destroy(); self.Arma2 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.CorpoACorpo41 ~= nil then self.CorpoACorpo41:destroy(); self.CorpoACorpo41 = nil; end;
        if self.Armadura46 ~= nil then self.Armadura46:destroy(); self.Armadura46 = nil; end;
        if self.CorpoACorpo27 ~= nil then self.CorpoACorpo27:destroy(); self.CorpoACorpo27 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.image97 ~= nil then self.image97:destroy(); self.image97 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.CorpoACorpo32 ~= nil then self.CorpoACorpo32:destroy(); self.CorpoACorpo32 = nil; end;
        if self.label347 ~= nil then self.label347:destroy(); self.label347 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.image125 ~= nil then self.image125:destroy(); self.image125 = nil; end;
        if self.image96 ~= nil then self.image96:destroy(); self.image96 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.image133 ~= nil then self.image133:destroy(); self.image133 = nil; end;
        if self.label358 ~= nil then self.label358:destroy(); self.label358 = nil; end;
        if self.Arma17 ~= nil then self.Arma17:destroy(); self.Arma17 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.label355 ~= nil then self.label355:destroy(); self.label355 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.Arma15 ~= nil then self.Arma15:destroy(); self.Arma15 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.image99 ~= nil then self.image99:destroy(); self.image99 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.CorpoACorpo36 ~= nil then self.CorpoACorpo36:destroy(); self.CorpoACorpo36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.CorpoACorpo28 ~= nil then self.CorpoACorpo28:destroy(); self.CorpoACorpo28 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.image132 ~= nil then self.image132:destroy(); self.image132 = nil; end;
        if self.label390 ~= nil then self.label390:destroy(); self.label390 = nil; end;
        if self.Arma23 ~= nil then self.Arma23:destroy(); self.Arma23 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.image108 ~= nil then self.image108:destroy(); self.image108 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label361 ~= nil then self.label361:destroy(); self.label361 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.image145 ~= nil then self.image145:destroy(); self.image145 = nil; end;
        if self.image89 ~= nil then self.image89:destroy(); self.image89 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.LojaArmaduras ~= nil then self.LojaArmaduras:destroy(); self.LojaArmaduras = nil; end;
        if self.label389 ~= nil then self.label389:destroy(); self.label389 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.image93 ~= nil then self.image93:destroy(); self.image93 = nil; end;
        if self.Arma55 ~= nil then self.Arma55:destroy(); self.Arma55 = nil; end;
        if self.image90 ~= nil then self.image90:destroy(); self.image90 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.label380 ~= nil then self.label380:destroy(); self.label380 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.Arma30 ~= nil then self.Arma30:destroy(); self.Arma30 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.Armadura50 ~= nil then self.Armadura50:destroy(); self.Armadura50 = nil; end;
        if self.label336 ~= nil then self.label336:destroy(); self.label336 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label360 ~= nil then self.label360:destroy(); self.label360 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.image75 ~= nil then self.image75:destroy(); self.image75 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.image134 ~= nil then self.image134:destroy(); self.image134 = nil; end;
        if self.image144 ~= nil then self.image144:destroy(); self.image144 = nil; end;
        if self.Arma1 ~= nil then self.Arma1:destroy(); self.Arma1 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.Arma12 ~= nil then self.Arma12:destroy(); self.Arma12 = nil; end;
        if self.image105 ~= nil then self.image105:destroy(); self.image105 = nil; end;
        if self.Arma41 ~= nil then self.Arma41:destroy(); self.Arma41 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image121 ~= nil then self.image121:destroy(); self.image121 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.Arma16 ~= nil then self.Arma16:destroy(); self.Arma16 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.image73 ~= nil then self.image73:destroy(); self.image73 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.image76 ~= nil then self.image76:destroy(); self.image76 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.image100 ~= nil then self.image100:destroy(); self.image100 = nil; end;
        if self.CorpoACorpo42 ~= nil then self.CorpoACorpo42:destroy(); self.CorpoACorpo42 = nil; end;
        if self.label371 ~= nil then self.label371:destroy(); self.label371 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.Arma5 ~= nil then self.Arma5:destroy(); self.Arma5 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.Armadura48 ~= nil then self.Armadura48:destroy(); self.Armadura48 = nil; end;
        if self.image72 ~= nil then self.image72:destroy(); self.image72 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.labSoma4 ~= nil then self.labSoma4:destroy(); self.labSoma4 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.image71 ~= nil then self.image71:destroy(); self.image71 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label357 ~= nil then self.label357:destroy(); self.label357 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.LojaCorpoACorpo ~= nil then self.LojaCorpoACorpo:destroy(); self.LojaCorpoACorpo = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label365 ~= nil then self.label365:destroy(); self.label365 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.image119 ~= nil then self.image119:destroy(); self.image119 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.labSoma5 ~= nil then self.labSoma5:destroy(); self.labSoma5 = nil; end;
        if self.label391 ~= nil then self.label391:destroy(); self.label391 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.CorpoACorpo33 ~= nil then self.CorpoACorpo33:destroy(); self.CorpoACorpo33 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.image109 ~= nil then self.image109:destroy(); self.image109 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.Arma46 ~= nil then self.Arma46:destroy(); self.Arma46 = nil; end;
        if self.image111 ~= nil then self.image111:destroy(); self.image111 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.Arma51 ~= nil then self.Arma51:destroy(); self.Arma51 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.image98 ~= nil then self.image98:destroy(); self.image98 = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.Arma39 ~= nil then self.Arma39:destroy(); self.Arma39 = nil; end;
        if self.image120 ~= nil then self.image120:destroy(); self.image120 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.image137 ~= nil then self.image137:destroy(); self.image137 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.Armadura47 ~= nil then self.Armadura47:destroy(); self.Armadura47 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.CorpoACorpo37 ~= nil then self.CorpoACorpo37:destroy(); self.CorpoACorpo37 = nil; end;
        if self.ApresentaLoja ~= nil then self.ApresentaLoja:destroy(); self.ApresentaLoja = nil; end;
        if self.Armadura55 ~= nil then self.Armadura55:destroy(); self.Armadura55 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.label362 ~= nil then self.label362:destroy(); self.label362 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.image138 ~= nil then self.image138:destroy(); self.image138 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.image141 ~= nil then self.image141:destroy(); self.image141 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.labSoma2 ~= nil then self.labSoma2:destroy(); self.labSoma2 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.image115 ~= nil then self.image115:destroy(); self.image115 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.image81 ~= nil then self.image81:destroy(); self.image81 = nil; end;
        if self.CorpoACorpo ~= nil then self.CorpoACorpo:destroy(); self.CorpoACorpo = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.Arma24 ~= nil then self.Arma24:destroy(); self.Arma24 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.Arma53 ~= nil then self.Arma53:destroy(); self.Arma53 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.image88 ~= nil then self.image88:destroy(); self.image88 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.CorpoACorpo29 ~= nil then self.CorpoACorpo29:destroy(); self.CorpoACorpo29 = nil; end;
        if self.CorpoACorpo31 ~= nil then self.CorpoACorpo31:destroy(); self.CorpoACorpo31 = nil; end;
        if self.label387 ~= nil then self.label387:destroy(); self.label387 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.image86 ~= nil then self.image86:destroy(); self.image86 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.label379 ~= nil then self.label379:destroy(); self.label379 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.image114 ~= nil then self.image114:destroy(); self.image114 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.Armadura45 ~= nil then self.Armadura45:destroy(); self.Armadura45 = nil; end;
        if self.label370 ~= nil then self.label370:destroy(); self.label370 = nil; end;
        if self.image78 ~= nil then self.image78:destroy(); self.image78 = nil; end;
        if self.CorpoACorpo39 ~= nil then self.CorpoACorpo39:destroy(); self.CorpoACorpo39 = nil; end;
        if self.Arma48 ~= nil then self.Arma48:destroy(); self.Arma48 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.Armadura53 ~= nil then self.Armadura53:destroy(); self.Armadura53 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label369 ~= nil then self.label369:destroy(); self.label369 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.Arma21 ~= nil then self.Arma21:destroy(); self.Arma21 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.image83 ~= nil then self.image83:destroy(); self.image83 = nil; end;
        if self.Arma25 ~= nil then self.Arma25:destroy(); self.Arma25 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.CorpoACorpo26 ~= nil then self.CorpoACorpo26:destroy(); self.CorpoACorpo26 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.image122 ~= nil then self.image122:destroy(); self.image122 = nil; end;
        if self.Arma42 ~= nil then self.Arma42:destroy(); self.Arma42 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.image82 ~= nil then self.image82:destroy(); self.image82 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.CorpoACorpo30 ~= nil then self.CorpoACorpo30:destroy(); self.CorpoACorpo30 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.image128 ~= nil then self.image128:destroy(); self.image128 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.label354 ~= nil then self.label354:destroy(); self.label354 = nil; end;
        if self.label374 ~= nil then self.label374:destroy(); self.label374 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.Arma4 ~= nil then self.Arma4:destroy(); self.Arma4 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.Arma49 ~= nil then self.Arma49:destroy(); self.Arma49 = nil; end;
        if self.image139 ~= nil then self.image139:destroy(); self.image139 = nil; end;
        if self.image129 ~= nil then self.image129:destroy(); self.image129 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.label353 ~= nil then self.label353:destroy(); self.label353 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.image77 ~= nil then self.image77:destroy(); self.image77 = nil; end;
        if self.Arma26 ~= nil then self.Arma26:destroy(); self.Arma26 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.Arma47 ~= nil then self.Arma47:destroy(); self.Arma47 = nil; end;
        if self.image127 ~= nil then self.image127:destroy(); self.image127 = nil; end;
        if self.label384 ~= nil then self.label384:destroy(); self.label384 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.Arma31 ~= nil then self.Arma31:destroy(); self.Arma31 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.Arma3 ~= nil then self.Arma3:destroy(); self.Arma3 = nil; end;
        if self.Arma8 ~= nil then self.Arma8:destroy(); self.Arma8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.label356 ~= nil then self.label356:destroy(); self.label356 = nil; end;
        if self.label383 ~= nil then self.label383:destroy(); self.label383 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.image69 ~= nil then self.image69:destroy(); self.image69 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.Arma40 ~= nil then self.Arma40:destroy(); self.Arma40 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.image87 ~= nil then self.image87:destroy(); self.image87 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.Arma14 ~= nil then self.Arma14:destroy(); self.Arma14 = nil; end;
        if self.image84 ~= nil then self.image84:destroy(); self.image84 = nil; end;
        if self.Arma27 ~= nil then self.Arma27:destroy(); self.Arma27 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.Arma11 ~= nil then self.Arma11:destroy(); self.Arma11 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.Arma38 ~= nil then self.Arma38:destroy(); self.Arma38 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label385 ~= nil then self.label385:destroy(); self.label385 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.image131 ~= nil then self.image131:destroy(); self.image131 = nil; end;
        if self.image143 ~= nil then self.image143:destroy(); self.image143 = nil; end;
        if self.Arma6 ~= nil then self.Arma6:destroy(); self.Arma6 = nil; end;
        if self.image130 ~= nil then self.image130:destroy(); self.image130 = nil; end;
        if self.Arma10 ~= nil then self.Arma10:destroy(); self.Arma10 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.image116 ~= nil then self.image116:destroy(); self.image116 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.label373 ~= nil then self.label373:destroy(); self.label373 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.Arma18 ~= nil then self.Arma18:destroy(); self.Arma18 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.label388 ~= nil then self.label388:destroy(); self.label388 = nil; end;
        if self.Arma9 ~= nil then self.Arma9:destroy(); self.Arma9 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.image104 ~= nil then self.image104:destroy(); self.image104 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.Arma19 ~= nil then self.Arma19:destroy(); self.Arma19 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.Arma32 ~= nil then self.Arma32:destroy(); self.Arma32 = nil; end;
        if self.image112 ~= nil then self.image112:destroy(); self.image112 = nil; end;
        if self.Arma13 ~= nil then self.Arma13:destroy(); self.Arma13 = nil; end;
        if self.image113 ~= nil then self.image113:destroy(); self.image113 = nil; end;
        if self.label363 ~= nil then self.label363:destroy(); self.label363 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.Armadura51 ~= nil then self.Armadura51:destroy(); self.Armadura51 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.Arma52 ~= nil then self.Arma52:destroy(); self.Arma52 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.label368 ~= nil then self.label368:destroy(); self.label368 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.image102 ~= nil then self.image102:destroy(); self.image102 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLoja_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLoja_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLoja_svg = {
    newEditor = newfrmLoja_svg, 
    new = newfrmLoja_svg, 
    name = "frmLoja_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLoja_svg = _frmLoja_svg;
Firecast.registrarForm(_frmLoja_svg);

return _frmLoja_svg;
