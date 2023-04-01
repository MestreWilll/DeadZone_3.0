require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDZ_Ficha()
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
    obj:setName("frmDZ_Ficha");
    obj:setFormType("sheetTemplate");
    obj:setDataType("DeadZoneRPG2.0");
    obj:setTitle("Ficha 3.0 Dead Zone");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Caracteristicas");
    obj.tab1:setName("tab1");

    obj.frmDZ_Ficha1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDZ_Ficha1_svg:setParent(obj.tab1);
    obj.frmDZ_Ficha1_svg:setName("frmDZ_Ficha1_svg");
    obj.frmDZ_Ficha1_svg:setAlign("client");
    obj.frmDZ_Ficha1_svg:setTheme("light");
    obj.frmDZ_Ficha1_svg:setMargins({top=1});

    obj.frmMochila = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMochila:setParent(obj.frmDZ_Ficha1_svg);
    obj.frmMochila:setName("frmMochila");
    obj.frmMochila:setTheme("dark");
    obj.frmMochila:setAlign("client");

    obj.Inventario = GUI.fromHandle(_obj_newObject("layout"));
    obj.Inventario:setParent(obj.frmMochila);
    obj.Inventario:setName("Inventario");
    obj.Inventario:setAlign("client");
    obj.Inventario:setVisible(false);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Inventario);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.labSoma = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma:setParent(obj.rectangle1);
    obj.labSoma:setFontSize(28);
    obj.labSoma:setFontColor("lime");
    lfm_setPropAsString(obj.labSoma, "fontStyle",  "bold");
    obj.labSoma:setLeft(346);
    obj.labSoma:setTop(0);
    obj.labSoma:setWidth(205);
    obj.labSoma:setHeight(45);
    obj.labSoma:setName("labSoma");
    obj.labSoma:setTextTrimming("none");
    obj.labSoma:setWordWrap(false);
    obj.labSoma:setAutoSize(true);
    obj.labSoma:setFontFamily("kalam");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.labSoma);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setSRC("Imagens/layoutDinheiro.png");
    obj.image1:setHitTest(true);
    obj.image1:setCursor("handPoint");
    obj.image1:setLeft(280);
    obj.image1:setTop(-2);
    obj.image1:setWidth(213);
    obj.image1:setHeight(56);
    obj.image1:setName("image1");

    obj.troca = GUI.fromHandle(_obj_newObject("image"));
    obj.troca:setParent(obj.rectangle1);
    obj.troca:setHitTest(true);
    obj.troca:setCursor("handPoint");
    obj.troca:setLeft(537);
    obj.troca:setTop(-2);
    obj.troca:setWidth(63);
    obj.troca:setHeight(60);
    obj.troca:setName("troca");
    obj.troca:setVisible(false);
    obj.troca:setSRC("Imagens/vender_on.png");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(600);
    obj.layout1:setHeight(600);
    obj.layout1:setFrameStyle("frames/frame2.xml");
    obj.layout1:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("client");
    obj.layout2:setFrameStyle("frames/frame1.xml");
    obj.layout2:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setText("Criar Novo Item");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setSRC("images/botaoVoltar.png");
    obj.image2:setLeft(533);
    obj.image2:setTop(0);
    obj.image2:setWidth(50);
    obj.image2:setHeight(50);
    obj.image2:setCursor("handPoint");
    obj.image2:setHitTest(true);
    obj.image2:setName("image2");

    obj.rclEquip = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquip:setParent(obj.layout1);
    obj.rclEquip:setName("rclEquip");
    obj.rclEquip:setField("nome");
    obj.rclEquip:setTemplateForm("frmEquip");
    obj.rclEquip:setAlign("client");
    obj.rclEquip:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout1);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.testeee = GUI.fromHandle(_obj_newObject("button"));
    obj.testeee:setParent(obj.boxDetalhesDoItem);
    obj.testeee:setName("testeee");
    obj.testeee:setText("debugDin");
    obj.testeee:setHint("Caso o dinheiro bug, clique aqui, ele vai resetar");
    obj.testeee:setLeft(200);
    obj.testeee:setTop(300);

    obj.Venda = GUI.fromHandle(_obj_newObject("image"));
    obj.Venda:setParent(obj.boxDetalhesDoItem);
    obj.Venda:setName("Venda");
    obj.Venda:setSRC("Imagens/vendaItens.png");
    obj.Venda:setLeft(222);
    obj.Venda:setTop(165);
    obj.Venda:setWidth(134);
    obj.Venda:setHeight(106);
    obj.Venda:setVisible(true);

    obj.naoVende = GUI.fromHandle(_obj_newObject("image"));
    obj.naoVende:setParent(obj.boxDetalhesDoItem);
    obj.naoVende:setName("naoVende");
    obj.naoVende:setSRC("Imagens/impossivelVende.png");
    obj.naoVende:setLeft(222);
    obj.naoVende:setTop(165);
    obj.naoVende:setWidth(134);
    obj.naoVende:setHeight(106);
    obj.naoVende:setVisible(false);

    obj.mercadoNegro = GUI.fromHandle(_obj_newObject("image"));
    obj.mercadoNegro:setParent(obj.boxDetalhesDoItem);
    obj.mercadoNegro:setName("mercadoNegro");
    obj.mercadoNegro:setSRC("Imagens/mercadoNegro.png");
    obj.mercadoNegro:setLeft(222);
    obj.mercadoNegro:setTop(165);
    obj.mercadoNegro:setWidth(134);
    obj.mercadoNegro:setHeight(106);
    obj.mercadoNegro:setVisible(false);

    obj.dinheiro = GUI.fromHandle(_obj_newObject("label"));
    obj.dinheiro:setParent(obj.boxDetalhesDoItem);
    obj.dinheiro:setName("dinheiro");
    obj.dinheiro:setLeft(246);
    obj.dinheiro:setTop(183);
    obj.dinheiro:setWidth(82);
    obj.dinheiro:setHeight(26);
    obj.dinheiro:setFontSize(20);
    obj.dinheiro:setFontColor("black");
    lfm_setPropAsString(obj.dinheiro, "fontStyle",  "bold");
    obj.dinheiro:setField("custo");
    obj.dinheiro:setTextTrimming("none");
    obj.dinheiro:setWordWrap(false);
    obj.dinheiro:setAutoSize(true);
    obj.dinheiro:setFontFamily("kalam");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.boxDetalhesDoItem);
    obj.image3:setSRC("Imagens/nivelDoitem.png");
    obj.image3:setLeft(180);
    obj.image3:setTop(364);
    obj.image3:setWidth(205);
    obj.image3:setHeight(30);
    obj.image3:setVisible(true);
    obj.image3:setName("image3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.boxDetalhesDoItem);
    obj.label1:setField("nivelItem");
    obj.label1:setHitTest(true);
    obj.label1:setFontSize(23);
    obj.label1:setFontColor("red");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setLeft(375);
    obj.label1:setTop(367);
    obj.label1:setName("label1");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);
    obj.label1:setFontFamily("kalam");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.boxDetalhesDoItem);
    obj.dataLink2:setField("nivelItem");
    obj.dataLink2:setName("dataLink2");

    obj.colocarDinheiro = GUI.fromHandle(_obj_newObject("button"));
    obj.colocarDinheiro:setParent(obj.boxDetalhesDoItem);
    obj.colocarDinheiro:setText("$");
    obj.colocarDinheiro:setName("colocarDinheiro");
    obj.colocarDinheiro:setFontColor("red");
    lfm_setPropAsString(obj.colocarDinheiro, "fontStyle",  "bold");
    obj.colocarDinheiro:setFontSize(25);
    obj.colocarDinheiro:setLeft(215);
    obj.colocarDinheiro:setTop(182);
    obj.colocarDinheiro:setWidth(27);
    obj.colocarDinheiro:setHeight(25);

    obj.botaoDeVenda = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeVenda:setParent(obj.boxDetalhesDoItem);
    obj.botaoDeVenda:setName("botaoDeVenda");
    obj.botaoDeVenda:setVisible(false);
    obj.botaoDeVenda:setSRC("Imagens/vendeItem2.png");
    obj.botaoDeVenda:setLeft(237);
    obj.botaoDeVenda:setTop(209);
    obj.botaoDeVenda:setWidth(96);
    obj.botaoDeVenda:setOpacity(1);
    obj.botaoDeVenda:setHeight(21);
    obj.botaoDeVenda:setHitTest(true);
    obj.botaoDeVenda:setCursor("handPoint");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.boxDetalhesDoItem);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({bottom=0});
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome do Item:");
    obj.label2:setAutoSize(true);
    obj.label2:setFontFamily("kalam");
    obj.label2:setFontColor("red");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontSize(17);
    obj.label2:setName("label2");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(false);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.boxDetalhesDoItem);
    obj.label3:setText("Clique aqui para colocar imagem");
    obj.label3:setLeft(8);
    obj.label3:setTop(68);
    obj.label3:setAutoSize(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setName("label3");
    obj.label3:setFontColor("black");
    obj.label3:setTextTrimming("none");
    obj.label3:setFontFamily("kalam");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.boxDetalhesDoItem);
    obj.image4:setSRC("Imagens/quadradoImagem.png");
    obj.image4:setLeft(0.5);
    obj.image4:setTop(33);
    obj.image4:setWidth(134);
    obj.image4:setHeight(138);
    obj.image4:setName("image4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.boxDetalhesDoItem);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(131.5);
    obj.layout5:setName("layout5");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout5);
    obj.image5:setAlign("left");
    obj.image5:setEditable(true);
    obj.image5:setField("campoURLImagem");
    obj.image5:setWidth(130);
    obj.image5:setHeight(130);
    obj.image5:setMargins({top=-20});
    obj.image5:setName("image5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({left=2});
    obj.layout6:setName("layout6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setAlign("top");
    obj.edit2:setField("campoSubTitulo");
    obj.edit2:setHeight(30);
    obj.edit2:setName("edit2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout6);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setName("textEditor1");

    obj.FichaPrincipal = GUI.fromHandle(_obj_newObject("layout"));
    obj.FichaPrincipal:setParent(obj.frmDZ_Ficha1_svg);
    obj.FichaPrincipal:setName("FichaPrincipal");
    obj.FichaPrincipal:setAlign("client");
    obj.FichaPrincipal:setVisible(true);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.FichaPrincipal);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(1340);
    obj.rectangle2:setHeight(1188);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle2);
    obj.image6:setLeft(0);
    obj.image6:setTop(0);
    obj.image6:setWidth(918);
    obj.image6:setHeight(1188);
    obj.image6:setSRC("images/Pg1.png");
    obj.image6:setStyle("stretch");
    obj.image6:setOptimize(true);
    obj.image6:setName("image6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle2);
    obj.layout7:setLeft(165);
    obj.layout7:setTop(750);
    obj.layout7:setWidth(110);
    obj.layout7:setHeight(120);
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("client");
    obj.label4:setField("Saude_Total");
    obj.label4:setFontSize(30);
    obj.label4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");
    obj.label4:setFontColor("black");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);
    obj.label4:setFontFamily("kalam");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle2);
    obj.layout8:setLeft(121);
    obj.layout8:setTop(227);
    obj.layout8:setWidth(34);
    obj.layout8:setHeight(17);
    obj.layout8:setName("layout8");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#E52237");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setVertTextAlign("center");
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(34);
    obj.label5:setHeight(18);
    obj.label5:setField("Satts");
    obj.label5:setName("label5");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);
    obj.label5:setFontFamily("kalam");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle2);
    obj.layout9:setLeft(414);
    obj.layout9:setTop(225);
    obj.layout9:setWidth(38);
    obj.layout9:setHeight(17);
    obj.layout9:setName("layout9");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout9);
    obj.label6:setFontSize(12);
    obj.label6:setFontColor("#E52237");
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setVertTextAlign("center");
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setWidth(38);
    obj.label6:setHeight(18);
    obj.label6:setField("Sper");
    obj.label6:setName("label6");
    obj.label6:setTextTrimming("none");
    obj.label6:setWordWrap(false);
    obj.label6:setAutoSize(true);
    obj.label6:setFontFamily("kalam");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setLeft(652);
    obj.layout10:setTop(225);
    obj.layout10:setWidth(38);
    obj.layout10:setHeight(17);
    obj.layout10:setName("layout10");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout10);
    obj.label7:setFontSize(12);
    obj.label7:setFontColor("#E52237");
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setVertTextAlign("center");
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(38);
    obj.label7:setHeight(18);
    obj.label7:setField("Scir");
    obj.label7:setName("label7");
    obj.label7:setTextTrimming("none");
    obj.label7:setWordWrap(false);
    obj.label7:setAutoSize(true);
    obj.label7:setFontFamily("kalam");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle2);
    obj.layout11:setLeft(740);
    obj.layout11:setTop(977);
    obj.layout11:setWidth(23);
    obj.layout11:setHeight(19);
    obj.layout11:setName("layout11");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout11);
    obj.label8:setFontSize(12);
    obj.label8:setFontColor("#E52237");
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setVertTextAlign("center");
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(23);
    obj.label8:setHeight(20);
    obj.label8:setField("Svan");
    obj.label8:setName("label8");
    obj.label8:setTextTrimming("none");
    obj.label8:setWordWrap(false);
    obj.label8:setAutoSize(true);
    obj.label8:setFontFamily("kalam");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setLeft(716);
    obj.layout12:setTop(978);
    obj.layout12:setWidth(23);
    obj.layout12:setHeight(18);
    obj.layout12:setName("layout12");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout12);
    obj.label9:setFontSize(12);
    obj.label9:setFontColor("#000000");
    obj.label9:setVertTextAlign("center");
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(23);
    obj.label9:setHeight(19);
    obj.label9:setText("Exp:");
    obj.label9:setName("label9");
    obj.label9:setTextTrimming("none");
    obj.label9:setWordWrap(false);
    obj.label9:setAutoSize(true);
    obj.label9:setFontFamily("kalam");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setLeft(649);
    obj.layout13:setTop(52);
    obj.layout13:setWidth(250);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout13);
    obj.edit3:setTransparent(true);
    obj.edit3:setWidth(250);
    obj.edit3:setHeight(30);
    obj.edit3:setField("Disposicao");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#C0504D");
    obj.edit3:setFontSize(20);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setFontFamily("kalam");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(55);
    obj.layout14:setWidth(200);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout14);
    obj.edit4:setTransparent(true);
    obj.edit4:setWidth(205);
    obj.edit4:setHeight(30);
    obj.edit4:setField("Nick_Personagem");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#C0504D");
    obj.edit4:setFontSize(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setFontFamily("kalam");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setLeft(210);
    obj.layout15:setTop(55);
    obj.layout15:setWidth(78);
    obj.layout15:setHeight(50);
    obj.layout15:setName("layout15");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout15);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(15);
    obj.edit5:setWidth(78);
    obj.edit5:setHeight(30);
    obj.edit5:setField("Nick_Pessoa");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#C0504D");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setFontFamily("kalam");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setLeft(649);
    obj.layout16:setTop(110);
    obj.layout16:setWidth(254);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout16);
    obj.edit6:setTransparent(true);
    obj.edit6:setWidth(254);
    obj.edit6:setHeight(30);
    obj.edit6:setField("Nick_Cap");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#C0504D");
    obj.edit6:setFontSize(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setFontFamily("kalam");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setLeft(30);
    obj.layout17:setTop(110);
    obj.layout17:setWidth(210);
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout17);
    obj.edit7:setTransparent(true);
    obj.edit7:setWidth(210);
    obj.edit7:setHeight(30);
    obj.edit7:setField("Nick_Refugio");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#C0504D");
    obj.edit7:setFontSize(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setFontFamily("kalam");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle2);
    obj.layout18:setLeft(194);
    obj.layout18:setTop(270);
    obj.layout18:setWidth(71);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout18);
    obj.edit8:setWidth(71);
    obj.edit8:setHeight(30);
    obj.edit8:setField("FOR");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("#C0504D");
    obj.edit8:setFontSize(18);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setFontFamily("kalam");
    obj.edit8:setType("number");
    obj.edit8:setTransparent(true);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle2);
    obj.button2:setLeft(273);
    obj.button2:setTop(273);
    obj.button2:setWidth(14);
    obj.button2:setHeight(14);
    obj.button2:setText("R");
    obj.button2:setHint("Desc...");
    obj.button2:setName("button2");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle2);
    obj.image7:setWidth(17);
    obj.image7:setHeight(17);
    obj.image7:setLeft(272);
    obj.image7:setTop(273);
    obj.image7:setStyle("proportional");
    obj.image7:setCenter(true);
    obj.image7:setSRC("images/Dado.jpg");
    obj.image7:setName("image7");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle2);
    obj.layout19:setLeft(194);
    obj.layout19:setTop(306);
    obj.layout19:setWidth(71);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout19);
    obj.edit9:setWidth(71);
    obj.edit9:setHeight(30);
    obj.edit9:setField("DES");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("#C0504D");
    obj.edit9:setFontSize(18);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setFontFamily("kalam");
    obj.edit9:setType("number");
    obj.edit9:setTransparent(true);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle2);
    obj.button3:setLeft(273);
    obj.button3:setTop(309);
    obj.button3:setWidth(14);
    obj.button3:setHeight(14);
    obj.button3:setText("R");
    obj.button3:setHint("Desc...");
    obj.button3:setName("button3");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.rectangle2);
    obj.image8:setWidth(17);
    obj.image8:setHeight(17);
    obj.image8:setLeft(272);
    obj.image8:setTop(309);
    obj.image8:setStyle("proportional");
    obj.image8:setCenter(true);
    obj.image8:setSRC("images/Dado.jpg");
    obj.image8:setName("image8");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle2);
    obj.layout20:setLeft(194);
    obj.layout20:setTop(342);
    obj.layout20:setWidth(71);
    obj.layout20:setHeight(30);
    obj.layout20:setName("layout20");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout20);
    obj.edit10:setWidth(71);
    obj.edit10:setHeight(30);
    obj.edit10:setField("PRE");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("#C0504D");
    obj.edit10:setFontSize(18);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setFontFamily("kalam");
    obj.edit10:setType("number");
    obj.edit10:setTransparent(true);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle2);
    obj.button4:setLeft(273);
    obj.button4:setTop(345);
    obj.button4:setWidth(14);
    obj.button4:setHeight(14);
    obj.button4:setText("R");
    obj.button4:setHint("Desc...");
    obj.button4:setName("button4");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.rectangle2);
    obj.image9:setWidth(17);
    obj.image9:setHeight(17);
    obj.image9:setLeft(272);
    obj.image9:setTop(345);
    obj.image9:setStyle("proportional");
    obj.image9:setCenter(true);
    obj.image9:setSRC("images/Dado.jpg");
    obj.image9:setName("image9");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle2);
    obj.layout21:setLeft(194);
    obj.layout21:setTop(378);
    obj.layout21:setWidth(71);
    obj.layout21:setHeight(30);
    obj.layout21:setName("layout21");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout21);
    obj.edit11:setWidth(71);
    obj.edit11:setHeight(30);
    obj.edit11:setField("TAT");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#C0504D");
    obj.edit11:setFontSize(18);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setFontFamily("kalam");
    obj.edit11:setType("number");
    obj.edit11:setTransparent(true);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle2);
    obj.button5:setLeft(273);
    obj.button5:setTop(381);
    obj.button5:setWidth(14);
    obj.button5:setHeight(14);
    obj.button5:setText("R");
    obj.button5:setHint("Desc...");
    obj.button5:setName("button5");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle2);
    obj.image10:setWidth(17);
    obj.image10:setHeight(17);
    obj.image10:setLeft(272);
    obj.image10:setTop(381);
    obj.image10:setStyle("proportional");
    obj.image10:setCenter(true);
    obj.image10:setSRC("images/Dado.jpg");
    obj.image10:setName("image10");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle2);
    obj.layout22:setLeft(194);
    obj.layout22:setTop(413);
    obj.layout22:setWidth(71);
    obj.layout22:setHeight(30);
    obj.layout22:setName("layout22");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout22);
    obj.edit12:setWidth(71);
    obj.edit12:setHeight(30);
    obj.edit12:setField("PER");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("#C0504D");
    obj.edit12:setFontSize(18);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setFontFamily("kalam");
    obj.edit12:setType("number");
    obj.edit12:setTransparent(true);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle2);
    obj.button6:setLeft(273);
    obj.button6:setTop(416);
    obj.button6:setWidth(14);
    obj.button6:setHeight(14);
    obj.button6:setText("R");
    obj.button6:setHint("Desc...");
    obj.button6:setName("button6");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle2);
    obj.image11:setWidth(17);
    obj.image11:setHeight(17);
    obj.image11:setLeft(272);
    obj.image11:setTop(416);
    obj.image11:setStyle("proportional");
    obj.image11:setCenter(true);
    obj.image11:setSRC("images/Dado.jpg");
    obj.image11:setName("image11");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle2);
    obj.layout23:setLeft(194);
    obj.layout23:setTop(449);
    obj.layout23:setWidth(71);
    obj.layout23:setHeight(30);
    obj.layout23:setName("layout23");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout23);
    obj.edit13:setWidth(71);
    obj.edit13:setHeight(30);
    obj.edit13:setField("INT");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#C0504D");
    obj.edit13:setFontSize(18);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setFontFamily("kalam");
    obj.edit13:setType("number");
    obj.edit13:setTransparent(true);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle2);
    obj.button7:setLeft(273);
    obj.button7:setTop(452);
    obj.button7:setWidth(14);
    obj.button7:setHeight(14);
    obj.button7:setText("R");
    obj.button7:setHint("Desc...");
    obj.button7:setName("button7");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle2);
    obj.image12:setWidth(17);
    obj.image12:setHeight(17);
    obj.image12:setLeft(272);
    obj.image12:setTop(452);
    obj.image12:setStyle("proportional");
    obj.image12:setCenter(true);
    obj.image12:setSRC("images/Dado.jpg");
    obj.image12:setName("image12");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle2);
    obj.layout24:setLeft(178);
    obj.layout24:setTop(500);
    obj.layout24:setWidth(80);
    obj.layout24:setHeight(30);
    obj.layout24:setName("layout24");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout24);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(30);
    obj.edit14:setField("DET");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("#C0504D");
    obj.edit14:setFontSize(18);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setFontFamily("kalam");
    obj.edit14:setType("number");
    obj.edit14:setTransparent(true);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle2);
    obj.button8:setLeft(274);
    obj.button8:setTop(505);
    obj.button8:setWidth(16);
    obj.button8:setHeight(16);
    obj.button8:setText("R");
    obj.button8:setHint("Desc...");
    obj.button8:setName("button8");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle2);
    obj.image13:setWidth(19);
    obj.image13:setHeight(19);
    obj.image13:setLeft(272);
    obj.image13:setTop(505);
    obj.image13:setStyle("proportional");
    obj.image13:setCenter(true);
    obj.image13:setSRC("images/Dado.jpg");
    obj.image13:setName("image13");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle2);
    obj.layout25:setLeft(178);
    obj.layout25:setTop(536);
    obj.layout25:setWidth(80);
    obj.layout25:setHeight(30);
    obj.layout25:setName("layout25");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout25);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(30);
    obj.edit15:setField("SOR");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("#C0504D");
    obj.edit15:setFontSize(18);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setFontFamily("kalam");
    obj.edit15:setType("number");
    obj.edit15:setTransparent(true);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle2);
    obj.button9:setLeft(274);
    obj.button9:setTop(541);
    obj.button9:setWidth(16);
    obj.button9:setHeight(16);
    obj.button9:setText("R");
    obj.button9:setHint("Desc...");
    obj.button9:setName("button9");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle2);
    obj.image14:setWidth(19);
    obj.image14:setHeight(19);
    obj.image14:setLeft(272);
    obj.image14:setTop(541);
    obj.image14:setStyle("proportional");
    obj.image14:setCenter(true);
    obj.image14:setSRC("images/Dado.jpg");
    obj.image14:setName("image14");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle2);
    obj.layout26:setLeft(240);
    obj.layout26:setTop(499);
    obj.layout26:setWidth(80);
    obj.layout26:setHeight(30);
    obj.layout26:setName("layout26");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout26);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(18);
    obj.edit16:setFontColor("#C0504D");
    obj.edit16:setFontFamily("kalam");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(45);
    obj.edit16:setHeight(30);
    obj.edit16:setField("DETtemp");
    obj.edit16:setName("edit16");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle2);
    obj.layout27:setLeft(240);
    obj.layout27:setTop(536);
    obj.layout27:setWidth(80);
    obj.layout27:setHeight(30);
    obj.layout27:setName("layout27");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout27);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(18);
    obj.edit17:setFontColor("#C0504D");
    obj.edit17:setFontFamily("kalam");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(30);
    obj.edit17:setField("SORtemp");
    obj.edit17:setName("edit17");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle2);
    obj.layout28:setLeft(182);
    obj.layout28:setTop(590);
    obj.layout28:setWidth(100);
    obj.layout28:setHeight(27);
    obj.layout28:setName("layout28");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout28);
    obj.label10:setAlign("client");
    obj.label10:setField("Iniciativa");
    obj.label10:setFontColor("#00000");
    obj.label10:setName("label10");
    obj.label10:setTextTrimming("none");
    obj.label10:setWordWrap(false);
    obj.label10:setAutoSize(true);
    obj.label10:setFontFamily("kalam");
    obj.label10:setFontSize(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("center");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setFields({'DES', 'PER'});
    obj.dataLink3:setName("dataLink3");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle2);
    obj.button10:setLeft(284);
    obj.button10:setTop(591);
    obj.button10:setWidth(14);
    obj.button10:setHeight(14);
    obj.button10:setText("R");
    obj.button10:setHint("Desc... ");
    obj.button10:setName("button10");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.rectangle2);
    obj.image15:setWidth(17);
    obj.image15:setHeight(17);
    obj.image15:setLeft(283);
    obj.image15:setTop(591);
    obj.image15:setStyle("proportional");
    obj.image15:setCenter(true);
    obj.image15:setSRC("images/Dado.jpg");
    obj.image15:setName("image15");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setLeft(182);
    obj.comboBox1:setTop(655);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("StatusMoralidade");
    obj.comboBox1:setItems({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', 'Santo'});
    obj.comboBox1:setValues({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', Santo});
    obj.comboBox1:setFontSize(18);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontColor("#C0504D");
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setFontFamily("kalam");
    obj.comboBox1:setTransparent(true);

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle2);
    obj.layout29:setLeft(180);
    obj.layout29:setTop(695);
    obj.layout29:setWidth(100);
    obj.layout29:setHeight(30);
    obj.layout29:setName("layout29");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout29);
    obj.edit18:setFontColor("#00000");
    obj.edit18:setWidth(100);
    obj.edit18:setHeight(30);
    obj.edit18:setField("Moralidade");
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(18);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setFontFamily("kalam");
    obj.edit18:setType("number");
    obj.edit18:setTransparent(true);

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle2);
    obj.button11:setLeft(285);
    obj.button11:setTop(701);
    obj.button11:setWidth(14);
    obj.button11:setHeight(14);
    obj.button11:setText("R");
    obj.button11:setHint("Desc... ");
    obj.button11:setName("button11");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.rectangle2);
    obj.image16:setWidth(17);
    obj.image16:setHeight(17);
    obj.image16:setLeft(284);
    obj.image16:setTop(701);
    obj.image16:setStyle("proportional");
    obj.image16:setCenter(true);
    obj.image16:setSRC("images/Dado.jpg");
    obj.image16:setName("image16");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle2);
    obj.layout30:setLeft(68);
    obj.layout30:setTop(770);
    obj.layout30:setWidth(60);
    obj.layout30:setHeight(23);
    obj.layout30:setName("layout30");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout30);
    obj.label11:setAlign("client");
    obj.label11:setField("Saude_Base");
    obj.label11:setFontSize(20);
    obj.label11:setFontColor("#00000");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setTextTrimming("none");
    obj.label11:setWordWrap(false);
    obj.label11:setAutoSize(true);
    obj.label11:setFontFamily("kalam");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setFields({'FOR', 'SOR'});
    obj.dataLink4:setName("dataLink4");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle2);
    obj.layout31:setLeft(65);
    obj.layout31:setTop(815);
    obj.layout31:setWidth(60);
    obj.layout31:setHeight(30);
    obj.layout31:setName("layout31");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout31);
    obj.edit19:setFontSize(18);
    obj.edit19:setFontColor("#E10000");
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(30);
    obj.edit19:setField("Saude_Extra");
    obj.edit19:setName("edit19");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setFontFamily("kalam");
    obj.edit19:setType("number");
    obj.edit19:setTransparent(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setFields({'Saude_Extra', 'Saude_Base'});
    obj.dataLink5:setName("dataLink5");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle2);
    obj.layout32:setLeft(80);
    obj.layout32:setTop(973);
    obj.layout32:setWidth(80);
    obj.layout32:setHeight(40);
    obj.layout32:setName("layout32");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout32);
    obj.edit20:setFontColor("#000000");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setWidth(80);
    obj.edit20:setHeight(40);
    obj.edit20:setFontFamily("kalam");
    obj.edit20:setField("Lesionado");
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setTransparent(true);
    obj.edit20:setType("float");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle2);
    obj.layout33:setLeft(183);
    obj.layout33:setTop(973);
    obj.layout33:setWidth(80);
    obj.layout33:setHeight(40);
    obj.layout33:setName("layout33");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout33);
    obj.edit21:setFontColor("#C0504D");
    obj.edit21:setWidth(80);
    obj.edit21:setHeight(40);
    obj.edit21:setFontFamily("kalam");
    obj.edit21:setField("Lesionado_A");
    obj.edit21:setName("edit21");
    obj.edit21:setFontSize(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setTransparent(true);
    obj.edit21:setType("float");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle2);
    obj.layout34:setLeft(80);
    obj.layout34:setTop(900);
    obj.layout34:setWidth(80);
    obj.layout34:setHeight(40);
    obj.layout34:setName("layout34");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout34);
    obj.edit22:setFontColor("#000000");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setWidth(80);
    obj.edit22:setHeight(40);
    obj.edit22:setFontFamily("kalam");
    obj.edit22:setField("Machucado");
    obj.edit22:setName("edit22");
    obj.edit22:setFontSize(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setTransparent(true);
    obj.edit22:setType("float");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle2);
    obj.layout35:setLeft(183);
    obj.layout35:setTop(900);
    obj.layout35:setWidth(80);
    obj.layout35:setHeight(40);
    obj.layout35:setName("layout35");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout35);
    obj.edit23:setFontColor("#C0504D");
    obj.edit23:setWidth(80);
    obj.edit23:setHeight(40);
    obj.edit23:setFontFamily("kalam");
    obj.edit23:setField("Machucado_A");
    obj.edit23:setName("edit23");
    obj.edit23:setFontSize(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setTransparent(true);
    obj.edit23:setType("float");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle2);
    obj.layout36:setLeft(80);
    obj.layout36:setTop(1046);
    obj.layout36:setWidth(80);
    obj.layout36:setHeight(40);
    obj.layout36:setName("layout36");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout36);
    obj.edit24:setFontColor("#000000");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setWidth(80);
    obj.edit24:setHeight(40);
    obj.edit24:setFontFamily("kalam");
    obj.edit24:setField("Ferido");
    obj.edit24:setName("edit24");
    obj.edit24:setFontSize(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setTransparent(true);
    obj.edit24:setType("float");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle2);
    obj.layout37:setLeft(183);
    obj.layout37:setTop(1046);
    obj.layout37:setWidth(80);
    obj.layout37:setHeight(40);
    obj.layout37:setName("layout37");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout37);
    obj.edit25:setFontColor("#C0504D");
    obj.edit25:setWidth(80);
    obj.edit25:setHeight(40);
    obj.edit25:setField("Ferido_A");
    obj.edit25:setName("edit25");
    obj.edit25:setFontSize(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setFontFamily("kalam");
    obj.edit25:setTransparent(true);
    obj.edit25:setType("float");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setFields({'Saude_Total'});
    obj.dataLink6:setName("dataLink6");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle2);
    obj.layout38:setLeft(80);
    obj.layout38:setTop(1126);
    obj.layout38:setWidth(50);
    obj.layout38:setHeight(30);
    obj.layout38:setName("layout38");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout38);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(30);
    obj.edit26:setFontSize(16);
    obj.edit26:setField("Resistencia");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("#C0504D");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");
    obj.edit26:setFontFamily("kalam");
    obj.edit26:setType("number");
    obj.edit26:setTransparent(true);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle2);
    obj.dataLink7:setFields({'FOR'});
    obj.dataLink7:setName("dataLink7");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle2);
    obj.layout39:setLeft(377);
    obj.layout39:setTop(357);
    obj.layout39:setWidth(85);
    obj.layout39:setHeight(30);
    obj.layout39:setName("layout39");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout39);
    obj.edit27:setWidth(88);
    obj.edit27:setHeight(29);
    obj.edit27:setField("Construcao");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#C0504D");
    obj.edit27:setFontSize(15);
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setFontFamily("kalam");
    obj.edit27:setTransparent(true);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle2);
    obj.layout40:setLeft(396);
    obj.layout40:setTop(608);
    obj.layout40:setWidth(65);
    obj.layout40:setHeight(27);
    obj.layout40:setName("layout40");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout40);
    obj.edit28:setText("Geral");
    obj.edit28:setWidth(65);
    obj.edit28:setHeight(28);
    obj.edit28:setField("Conhecimento");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("#C0504D");
    obj.edit28:setFontSize(15);
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setFontFamily("kalam");
    obj.edit28:setTransparent(true);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle2);
    obj.layout41:setLeft(356);
    obj.layout41:setTop(637);
    obj.layout41:setWidth(100);
    obj.layout41:setHeight(27);
    obj.layout41:setName("layout41");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout41);
    obj.edit29:setWidth(88);
    obj.edit29:setHeight(29);
    obj.edit29:setField("Idiomas");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#C0504D");
    obj.edit29:setFontSize(15);
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setFontFamily("kalam");
    obj.edit29:setTransparent(true);

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle2);
    obj.layout42:setLeft(386);
    obj.layout42:setTop(794);
    obj.layout42:setWidth(72);
    obj.layout42:setHeight(30);
    obj.layout42:setName("layout42");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout42);
    obj.edit30:setWidth(88);
    obj.edit30:setHeight(29);
    obj.edit30:setField("Performance");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("#C0504D");
    obj.edit30:setFontSize(15);
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setFontFamily("kalam");
    obj.edit30:setTransparent(true);

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle2);
    obj.layout43:setLeft(372);
    obj.layout43:setTop(827);
    obj.layout43:setWidth(88);
    obj.layout43:setHeight(28);
    obj.layout43:setName("layout43");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout43);
    obj.edit31:setWidth(88);
    obj.edit31:setHeight(29);
    obj.edit31:setField("Pilotagem");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("#C0504D");
    obj.edit31:setFontSize(15);
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setFontFamily("kalam");
    obj.edit31:setTransparent(true);

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle2);
    obj.layout44:setLeft(368);
    obj.layout44:setTop(856);
    obj.layout44:setWidth(90);
    obj.layout44:setHeight(28);
    obj.layout44:setName("layout44");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout44);
    obj.edit32:setWidth(90);
    obj.edit32:setHeight(29);
    obj.edit32:setField("Conducao");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("#C0504D");
    obj.edit32:setFontSize(15);
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setFontFamily("kalam");
    obj.edit32:setTransparent(true);

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle2);
    obj.layout45:setLeft(310);
    obj.layout45:setTop(1077);
    obj.layout45:setWidth(148);
    obj.layout45:setHeight(28);
    obj.layout45:setName("layout45");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout45);
    obj.edit33:setWidth(148);
    obj.edit33:setHeight(29);
    obj.edit33:setField("Coringa1");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("#C0504D");
    obj.edit33:setFontSize(15);
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setFontFamily("kalam");
    obj.edit33:setTransparent(true);

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle2);
    obj.layout46:setLeft(309);
    obj.layout46:setTop(1109);
    obj.layout46:setWidth(148);
    obj.layout46:setHeight(28);
    obj.layout46:setName("layout46");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout46);
    obj.edit34:setWidth(148);
    obj.edit34:setHeight(29);
    obj.edit34:setField("Coringa2");
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("#C0504D");
    obj.edit34:setFontSize(15);
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setFontFamily("kalam");
    obj.edit34:setTransparent(true);

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle2);
    obj.layout47:setLeft(310);
    obj.layout47:setTop(1141);
    obj.layout47:setWidth(148);
    obj.layout47:setHeight(28);
    obj.layout47:setName("layout47");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout47);
    obj.edit35:setWidth(148);
    obj.edit35:setHeight(29);
    obj.edit35:setField("Coringa3");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("#C0504D");
    obj.edit35:setFontSize(15);
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setFontFamily("kalam");
    obj.edit35:setTransparent(true);

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle2);
    obj.button12:setLeft(553);
    obj.button12:setTop(268);
    obj.button12:setWidth(14);
    obj.button12:setHeight(14);
    obj.button12:setText("R");
    obj.button12:setHint("Desc... ");
    obj.button12:setName("button12");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.rectangle2);
    obj.image17:setWidth(17);
    obj.image17:setHeight(17);
    obj.image17:setLeft(552);
    obj.image17:setTop(268);
    obj.image17:setStyle("proportional");
    obj.image17:setCenter(true);
    obj.image17:setSRC("images/Dado.jpg");
    obj.image17:setName("image17");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle2);
    obj.button13:setLeft(553);
    obj.button13:setTop(300);
    obj.button13:setWidth(14);
    obj.button13:setHeight(14);
    obj.button13:setText("R");
    obj.button13:setHint("Desc... ");
    obj.button13:setName("button13");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.rectangle2);
    obj.image18:setWidth(17);
    obj.image18:setHeight(17);
    obj.image18:setLeft(552);
    obj.image18:setTop(300);
    obj.image18:setStyle("proportional");
    obj.image18:setCenter(true);
    obj.image18:setSRC("images/Dado.jpg");
    obj.image18:setName("image18");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle2);
    obj.button14:setLeft(553);
    obj.button14:setTop(332);
    obj.button14:setWidth(14);
    obj.button14:setHeight(14);
    obj.button14:setText("R");
    obj.button14:setHint("Desc... ");
    obj.button14:setName("button14");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.rectangle2);
    obj.image19:setWidth(17);
    obj.image19:setHeight(17);
    obj.image19:setLeft(553);
    obj.image19:setTop(332);
    obj.image19:setStyle("proportional");
    obj.image19:setCenter(true);
    obj.image19:setSRC("images/Dado.jpg");
    obj.image19:setName("image19");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle2);
    obj.button15:setLeft(553);
    obj.button15:setTop(364);
    obj.button15:setWidth(14);
    obj.button15:setHeight(14);
    obj.button15:setText("R");
    obj.button15:setHint("Desc... ");
    obj.button15:setName("button15");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.rectangle2);
    obj.image20:setWidth(17);
    obj.image20:setHeight(17);
    obj.image20:setLeft(552);
    obj.image20:setTop(364);
    obj.image20:setStyle("proportional");
    obj.image20:setCenter(true);
    obj.image20:setSRC("images/Dado.jpg");
    obj.image20:setName("image20");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle2);
    obj.button16:setLeft(553);
    obj.button16:setTop(394);
    obj.button16:setWidth(14);
    obj.button16:setHeight(14);
    obj.button16:setText("R");
    obj.button16:setHint("Desc... ");
    obj.button16:setName("button16");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.rectangle2);
    obj.image21:setWidth(17);
    obj.image21:setHeight(17);
    obj.image21:setLeft(552);
    obj.image21:setTop(394);
    obj.image21:setStyle("proportional");
    obj.image21:setCenter(true);
    obj.image21:setSRC("images/Dado.jpg");
    obj.image21:setName("image21");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle2);
    obj.button17:setLeft(553);
    obj.button17:setTop(425);
    obj.button17:setWidth(14);
    obj.button17:setHeight(14);
    obj.button17:setText("R");
    obj.button17:setHint("Desc... ");
    obj.button17:setName("button17");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.rectangle2);
    obj.image22:setWidth(17);
    obj.image22:setHeight(17);
    obj.image22:setLeft(552);
    obj.image22:setTop(425);
    obj.image22:setStyle("proportional");
    obj.image22:setCenter(true);
    obj.image22:setSRC("images/Dado.jpg");
    obj.image22:setName("image22");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle2);
    obj.button18:setLeft(553);
    obj.button18:setTop(456);
    obj.button18:setWidth(14);
    obj.button18:setHeight(14);
    obj.button18:setText("R");
    obj.button18:setHint("Desc... ");
    obj.button18:setName("button18");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.rectangle2);
    obj.image23:setWidth(17);
    obj.image23:setHeight(17);
    obj.image23:setLeft(552);
    obj.image23:setTop(456);
    obj.image23:setStyle("proportional");
    obj.image23:setCenter(true);
    obj.image23:setSRC("images/Dado.jpg");
    obj.image23:setName("image23");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle2);
    obj.button19:setLeft(553);
    obj.button19:setTop(487);
    obj.button19:setWidth(14);
    obj.button19:setHeight(14);
    obj.button19:setText("R");
    obj.button19:setHint("Desc... ");
    obj.button19:setName("button19");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.rectangle2);
    obj.image24:setWidth(17);
    obj.image24:setHeight(17);
    obj.image24:setLeft(552);
    obj.image24:setTop(487);
    obj.image24:setStyle("proportional");
    obj.image24:setCenter(true);
    obj.image24:setSRC("images/Dado.jpg");
    obj.image24:setName("image24");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle2);
    obj.button20:setLeft(553);
    obj.button20:setTop(518);
    obj.button20:setWidth(14);
    obj.button20:setHeight(14);
    obj.button20:setText("R");
    obj.button20:setHint("Desc... ");
    obj.button20:setName("button20");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.rectangle2);
    obj.image25:setWidth(17);
    obj.image25:setHeight(17);
    obj.image25:setLeft(552);
    obj.image25:setTop(518);
    obj.image25:setStyle("proportional");
    obj.image25:setCenter(true);
    obj.image25:setSRC("images/Dado.jpg");
    obj.image25:setName("image25");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle2);
    obj.button21:setLeft(553);
    obj.button21:setTop(550);
    obj.button21:setWidth(14);
    obj.button21:setHeight(14);
    obj.button21:setText("R");
    obj.button21:setHint("Desc... ");
    obj.button21:setName("button21");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.rectangle2);
    obj.image26:setWidth(17);
    obj.image26:setHeight(17);
    obj.image26:setLeft(552);
    obj.image26:setTop(550);
    obj.image26:setStyle("proportional");
    obj.image26:setCenter(true);
    obj.image26:setSRC("images/Dado.jpg");
    obj.image26:setName("image26");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle2);
    obj.button22:setLeft(553);
    obj.button22:setTop(581);
    obj.button22:setWidth(14);
    obj.button22:setHeight(14);
    obj.button22:setText("R");
    obj.button22:setHint("Desc... ");
    obj.button22:setName("button22");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.rectangle2);
    obj.image27:setWidth(17);
    obj.image27:setHeight(17);
    obj.image27:setLeft(552);
    obj.image27:setTop(581);
    obj.image27:setStyle("proportional");
    obj.image27:setCenter(true);
    obj.image27:setSRC("images/Dado.jpg");
    obj.image27:setName("image27");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle2);
    obj.button23:setLeft(553);
    obj.button23:setTop(611);
    obj.button23:setWidth(14);
    obj.button23:setHeight(14);
    obj.button23:setText("R");
    obj.button23:setHint("Desc... ");
    obj.button23:setName("button23");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.rectangle2);
    obj.image28:setWidth(17);
    obj.image28:setHeight(17);
    obj.image28:setLeft(552);
    obj.image28:setTop(611);
    obj.image28:setStyle("proportional");
    obj.image28:setCenter(true);
    obj.image28:setSRC("images/Dado.jpg");
    obj.image28:setName("image28");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle2);
    obj.button24:setLeft(553);
    obj.button24:setTop(644);
    obj.button24:setWidth(14);
    obj.button24:setHeight(14);
    obj.button24:setText("R");
    obj.button24:setHint("Desc... ");
    obj.button24:setName("button24");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.rectangle2);
    obj.image29:setWidth(17);
    obj.image29:setHeight(17);
    obj.image29:setLeft(552);
    obj.image29:setTop(644);
    obj.image29:setStyle("proportional");
    obj.image29:setCenter(true);
    obj.image29:setSRC("images/Dado.jpg");
    obj.image29:setName("image29");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle2);
    obj.button25:setLeft(553);
    obj.button25:setTop(675);
    obj.button25:setWidth(14);
    obj.button25:setHeight(14);
    obj.button25:setText("R");
    obj.button25:setHint("Desc... ");
    obj.button25:setName("button25");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.rectangle2);
    obj.image30:setWidth(17);
    obj.image30:setHeight(17);
    obj.image30:setLeft(552);
    obj.image30:setTop(675);
    obj.image30:setStyle("proportional");
    obj.image30:setCenter(true);
    obj.image30:setSRC("images/Dado.jpg");
    obj.image30:setName("image30");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle2);
    obj.button26:setLeft(553);
    obj.button26:setTop(706);
    obj.button26:setWidth(14);
    obj.button26:setHeight(14);
    obj.button26:setText("R");
    obj.button26:setHint("Desc... ");
    obj.button26:setName("button26");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.rectangle2);
    obj.image31:setWidth(17);
    obj.image31:setHeight(17);
    obj.image31:setLeft(552);
    obj.image31:setTop(706);
    obj.image31:setStyle("proportional");
    obj.image31:setCenter(true);
    obj.image31:setSRC("images/Dado.jpg");
    obj.image31:setName("image31");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle2);
    obj.button27:setLeft(553);
    obj.button27:setTop(737);
    obj.button27:setWidth(14);
    obj.button27:setHeight(14);
    obj.button27:setText("R");
    obj.button27:setHint("Desc... ");
    obj.button27:setName("button27");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.rectangle2);
    obj.image32:setWidth(17);
    obj.image32:setHeight(17);
    obj.image32:setLeft(552);
    obj.image32:setTop(737);
    obj.image32:setStyle("proportional");
    obj.image32:setCenter(true);
    obj.image32:setSRC("images/Dado.jpg");
    obj.image32:setName("image32");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.rectangle2);
    obj.button28:setLeft(553);
    obj.button28:setTop(769);
    obj.button28:setWidth(14);
    obj.button28:setHeight(14);
    obj.button28:setText("R");
    obj.button28:setHint("Desc... ");
    obj.button28:setName("button28");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.rectangle2);
    obj.image33:setWidth(17);
    obj.image33:setHeight(17);
    obj.image33:setLeft(552);
    obj.image33:setTop(769);
    obj.image33:setStyle("proportional");
    obj.image33:setCenter(true);
    obj.image33:setSRC("images/Dado.jpg");
    obj.image33:setName("image33");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.rectangle2);
    obj.button29:setLeft(553);
    obj.button29:setTop(801);
    obj.button29:setWidth(14);
    obj.button29:setHeight(14);
    obj.button29:setText("R");
    obj.button29:setHint("Desc... ");
    obj.button29:setName("button29");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.rectangle2);
    obj.image34:setWidth(17);
    obj.image34:setHeight(17);
    obj.image34:setLeft(552);
    obj.image34:setTop(801);
    obj.image34:setStyle("proportional");
    obj.image34:setCenter(true);
    obj.image34:setSRC("images/Dado.jpg");
    obj.image34:setName("image34");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.rectangle2);
    obj.button30:setLeft(553);
    obj.button30:setTop(832);
    obj.button30:setWidth(14);
    obj.button30:setHeight(14);
    obj.button30:setText("R");
    obj.button30:setHint("Desc... ");
    obj.button30:setName("button30");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.rectangle2);
    obj.image35:setWidth(17);
    obj.image35:setHeight(17);
    obj.image35:setLeft(552);
    obj.image35:setTop(832);
    obj.image35:setStyle("proportional");
    obj.image35:setCenter(true);
    obj.image35:setSRC("images/Dado.jpg");
    obj.image35:setName("image35");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.rectangle2);
    obj.button31:setLeft(553);
    obj.button31:setTop(863);
    obj.button31:setWidth(14);
    obj.button31:setHeight(14);
    obj.button31:setText("R");
    obj.button31:setHint("Desc... ");
    obj.button31:setName("button31");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.rectangle2);
    obj.image36:setWidth(17);
    obj.image36:setHeight(17);
    obj.image36:setLeft(552);
    obj.image36:setTop(863);
    obj.image36:setStyle("proportional");
    obj.image36:setCenter(true);
    obj.image36:setSRC("images/Dado.jpg");
    obj.image36:setName("image36");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.rectangle2);
    obj.button32:setLeft(553);
    obj.button32:setTop(894);
    obj.button32:setWidth(14);
    obj.button32:setHeight(14);
    obj.button32:setText("R");
    obj.button32:setHint("Desc... ");
    obj.button32:setName("button32");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.rectangle2);
    obj.image37:setWidth(17);
    obj.image37:setHeight(17);
    obj.image37:setLeft(552);
    obj.image37:setTop(894);
    obj.image37:setStyle("proportional");
    obj.image37:setCenter(true);
    obj.image37:setSRC("images/Dado.jpg");
    obj.image37:setName("image37");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.rectangle2);
    obj.button33:setLeft(553);
    obj.button33:setTop(926);
    obj.button33:setWidth(14);
    obj.button33:setHeight(14);
    obj.button33:setText("R");
    obj.button33:setHint("Desc... ");
    obj.button33:setName("button33");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.rectangle2);
    obj.image38:setWidth(17);
    obj.image38:setHeight(17);
    obj.image38:setLeft(552);
    obj.image38:setTop(926);
    obj.image38:setStyle("proportional");
    obj.image38:setCenter(true);
    obj.image38:setSRC("images/Dado.jpg");
    obj.image38:setName("image38");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.rectangle2);
    obj.button34:setLeft(553);
    obj.button34:setTop(956);
    obj.button34:setWidth(14);
    obj.button34:setHeight(14);
    obj.button34:setText("R");
    obj.button34:setHint("Desc... ");
    obj.button34:setName("button34");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.rectangle2);
    obj.image39:setWidth(17);
    obj.image39:setHeight(17);
    obj.image39:setLeft(552);
    obj.image39:setTop(956);
    obj.image39:setStyle("proportional");
    obj.image39:setCenter(true);
    obj.image39:setSRC("images/Dado.jpg");
    obj.image39:setName("image39");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.rectangle2);
    obj.button35:setLeft(553);
    obj.button35:setTop(989);
    obj.button35:setWidth(14);
    obj.button35:setHeight(14);
    obj.button35:setText("R");
    obj.button35:setHint("Desc... ");
    obj.button35:setName("button35");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.rectangle2);
    obj.image40:setWidth(17);
    obj.image40:setHeight(17);
    obj.image40:setLeft(552);
    obj.image40:setTop(989);
    obj.image40:setStyle("proportional");
    obj.image40:setCenter(true);
    obj.image40:setSRC("images/Dado.jpg");
    obj.image40:setName("image40");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.rectangle2);
    obj.button36:setLeft(555);
    obj.button36:setTop(1020);
    obj.button36:setWidth(14);
    obj.button36:setHeight(14);
    obj.button36:setText("R");
    obj.button36:setHint("Desc... ");
    obj.button36:setName("button36");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.rectangle2);
    obj.image41:setWidth(17);
    obj.image41:setHeight(17);
    obj.image41:setLeft(552);
    obj.image41:setTop(1020);
    obj.image41:setStyle("proportional");
    obj.image41:setCenter(true);
    obj.image41:setSRC("images/Dado.jpg");
    obj.image41:setName("image41");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.rectangle2);
    obj.button37:setLeft(555);
    obj.button37:setTop(1052);
    obj.button37:setWidth(14);
    obj.button37:setHeight(14);
    obj.button37:setText("R");
    obj.button37:setHint("Desc... ");
    obj.button37:setName("button37");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.rectangle2);
    obj.image42:setWidth(17);
    obj.image42:setHeight(17);
    obj.image42:setLeft(552);
    obj.image42:setTop(1052);
    obj.image42:setStyle("proportional");
    obj.image42:setCenter(true);
    obj.image42:setSRC("images/Dado.jpg");
    obj.image42:setName("image42");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.rectangle2);
    obj.button38:setLeft(556);
    obj.button38:setTop(1084);
    obj.button38:setWidth(14);
    obj.button38:setHeight(14);
    obj.button38:setText("R");
    obj.button38:setHint("Desc... ");
    obj.button38:setName("button38");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.rectangle2);
    obj.image43:setWidth(17);
    obj.image43:setHeight(17);
    obj.image43:setLeft(555);
    obj.image43:setTop(1084);
    obj.image43:setStyle("proportional");
    obj.image43:setCenter(true);
    obj.image43:setSRC("images/Dado.jpg");
    obj.image43:setName("image43");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.rectangle2);
    obj.button39:setLeft(556);
    obj.button39:setTop(1114);
    obj.button39:setWidth(14);
    obj.button39:setHeight(14);
    obj.button39:setText("R");
    obj.button39:setHint("Desc... ");
    obj.button39:setName("button39");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.rectangle2);
    obj.image44:setWidth(17);
    obj.image44:setHeight(17);
    obj.image44:setLeft(555);
    obj.image44:setTop(1114);
    obj.image44:setStyle("proportional");
    obj.image44:setCenter(true);
    obj.image44:setSRC("images/Dado.jpg");
    obj.image44:setName("image44");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.rectangle2);
    obj.button40:setLeft(557);
    obj.button40:setTop(1148);
    obj.button40:setWidth(14);
    obj.button40:setHeight(14);
    obj.button40:setText("R");
    obj.button40:setHint("Desc... ");
    obj.button40:setName("button40");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.rectangle2);
    obj.image45:setWidth(17);
    obj.image45:setHeight(17);
    obj.image45:setLeft(556);
    obj.image45:setTop(1148);
    obj.image45:setStyle("proportional");
    obj.image45:setCenter(true);
    obj.image45:setSRC("images/Dado.jpg");
    obj.image45:setName("image45");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle2);
    obj.layout48:setLeft(472);
    obj.layout48:setTop(261);
    obj.layout48:setWidth(74);
    obj.layout48:setHeight(26);
    obj.layout48:setName("layout48");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout48);
    obj.edit36:setField("Peri01");
    obj.edit36:setWidth(74);
    obj.edit36:setHeight(27);
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("#C0504D");
    obj.edit36:setFontSize(18);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setFontFamily("kalam");
    obj.edit36:setType("number");
    obj.edit36:setTransparent(true);

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle2);
    obj.layout49:setLeft(473);
    obj.layout49:setTop(293);
    obj.layout49:setWidth(71);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout49);
    obj.edit37:setField("Peri02");
    obj.edit37:setWidth(71);
    obj.edit37:setHeight(26);
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("#C0504D");
    obj.edit37:setFontSize(18);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setFontFamily("kalam");
    obj.edit37:setType("number");
    obj.edit37:setTransparent(true);

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle2);
    obj.layout50:setLeft(474);
    obj.layout50:setTop(325);
    obj.layout50:setWidth(72);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout50);
    obj.edit38:setField("Peri03");
    obj.edit38:setWidth(72);
    obj.edit38:setHeight(26);
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("#C0504D");
    obj.edit38:setFontSize(18);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setFontFamily("kalam");
    obj.edit38:setType("number");
    obj.edit38:setTransparent(true);

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle2);
    obj.layout51:setLeft(474);
    obj.layout51:setTop(357);
    obj.layout51:setWidth(70);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout51);
    obj.edit39:setField("Peri04");
    obj.edit39:setWidth(70);
    obj.edit39:setHeight(26);
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("#C0504D");
    obj.edit39:setFontSize(18);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setFontFamily("kalam");
    obj.edit39:setType("number");
    obj.edit39:setTransparent(true);

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle2);
    obj.layout52:setLeft(473);
    obj.layout52:setTop(387);
    obj.layout52:setWidth(72);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout52);
    obj.edit40:setField("Peri05");
    obj.edit40:setWidth(72);
    obj.edit40:setHeight(26);
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("#C0504D");
    obj.edit40:setFontSize(18);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setFontFamily("kalam");
    obj.edit40:setType("number");
    obj.edit40:setTransparent(true);

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle2);
    obj.layout53:setLeft(474);
    obj.layout53:setTop(418);
    obj.layout53:setWidth(71);
    obj.layout53:setHeight(26);
    obj.layout53:setName("layout53");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout53);
    obj.edit41:setField("Peri06");
    obj.edit41:setWidth(71);
    obj.edit41:setHeight(27);
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("#C0504D");
    obj.edit41:setFontSize(18);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit41, "fontStyle",  "bold");
    obj.edit41:setFontFamily("kalam");
    obj.edit41:setType("number");
    obj.edit41:setTransparent(true);

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle2);
    obj.layout54:setLeft(473);
    obj.layout54:setTop(449);
    obj.layout54:setWidth(74);
    obj.layout54:setHeight(26);
    obj.layout54:setName("layout54");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout54);
    obj.edit42:setField("Peri07");
    obj.edit42:setWidth(74);
    obj.edit42:setHeight(27);
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("#C0504D");
    obj.edit42:setFontSize(18);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit42, "fontStyle",  "bold");
    obj.edit42:setFontFamily("kalam");
    obj.edit42:setType("number");
    obj.edit42:setTransparent(true);

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle2);
    obj.layout55:setLeft(474);
    obj.layout55:setTop(480);
    obj.layout55:setWidth(74);
    obj.layout55:setHeight(26);
    obj.layout55:setName("layout55");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout55);
    obj.edit43:setField("Peri08");
    obj.edit43:setWidth(74);
    obj.edit43:setHeight(27);
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("#C0504D");
    obj.edit43:setFontSize(18);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");
    obj.edit43:setFontFamily("kalam");
    obj.edit43:setType("number");
    obj.edit43:setTransparent(true);

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle2);
    obj.layout56:setLeft(472);
    obj.layout56:setTop(511);
    obj.layout56:setWidth(74);
    obj.layout56:setHeight(26);
    obj.layout56:setName("layout56");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout56);
    obj.edit44:setField("Peri09");
    obj.edit44:setWidth(74);
    obj.edit44:setHeight(27);
    obj.edit44:setName("edit44");
    obj.edit44:setFontColor("#C0504D");
    obj.edit44:setFontSize(18);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit44, "fontStyle",  "bold");
    obj.edit44:setFontFamily("kalam");
    obj.edit44:setType("number");
    obj.edit44:setTransparent(true);

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle2);
    obj.layout57:setLeft(471);
    obj.layout57:setTop(543);
    obj.layout57:setWidth(77);
    obj.layout57:setHeight(26);
    obj.layout57:setName("layout57");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout57);
    obj.edit45:setField("Peri10");
    obj.edit45:setWidth(77);
    obj.edit45:setHeight(27);
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("#C0504D");
    obj.edit45:setFontSize(18);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit45, "fontStyle",  "bold");
    obj.edit45:setFontFamily("kalam");
    obj.edit45:setType("number");
    obj.edit45:setTransparent(true);

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle2);
    obj.layout58:setLeft(471);
    obj.layout58:setTop(574);
    obj.layout58:setWidth(76);
    obj.layout58:setHeight(26);
    obj.layout58:setName("layout58");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout58);
    obj.edit46:setField("Peri11");
    obj.edit46:setWidth(76);
    obj.edit46:setHeight(27);
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("#C0504D");
    obj.edit46:setFontSize(18);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setFontFamily("kalam");
    obj.edit46:setType("number");
    obj.edit46:setTransparent(true);

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle2);
    obj.layout59:setLeft(472);
    obj.layout59:setTop(604);
    obj.layout59:setWidth(76);
    obj.layout59:setHeight(26);
    obj.layout59:setName("layout59");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout59);
    obj.edit47:setField("Peri12");
    obj.edit47:setWidth(76);
    obj.edit47:setHeight(27);
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("#C0504D");
    obj.edit47:setFontSize(18);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit47, "fontStyle",  "bold");
    obj.edit47:setFontFamily("kalam");
    obj.edit47:setType("number");
    obj.edit47:setTransparent(true);

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle2);
    obj.layout60:setLeft(471);
    obj.layout60:setTop(637);
    obj.layout60:setWidth(75);
    obj.layout60:setHeight(26);
    obj.layout60:setName("layout60");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout60);
    obj.edit48:setField("Peri13");
    obj.edit48:setWidth(75);
    obj.edit48:setHeight(27);
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("#C0504D");
    obj.edit48:setFontSize(18);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit48, "fontStyle",  "bold");
    obj.edit48:setFontFamily("kalam");
    obj.edit48:setType("number");
    obj.edit48:setTransparent(true);

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle2);
    obj.layout61:setLeft(469);
    obj.layout61:setTop(668);
    obj.layout61:setWidth(76);
    obj.layout61:setHeight(26);
    obj.layout61:setName("layout61");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout61);
    obj.edit49:setField("Peri14");
    obj.edit49:setWidth(76);
    obj.edit49:setHeight(27);
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("#C0504D");
    obj.edit49:setFontSize(18);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setFontFamily("kalam");
    obj.edit49:setType("number");
    obj.edit49:setTransparent(true);

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle2);
    obj.layout62:setLeft(470);
    obj.layout62:setTop(699);
    obj.layout62:setWidth(74);
    obj.layout62:setHeight(26);
    obj.layout62:setName("layout62");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout62);
    obj.edit50:setField("Peri15");
    obj.edit50:setWidth(74);
    obj.edit50:setHeight(27);
    obj.edit50:setName("edit50");
    obj.edit50:setFontColor("#C0504D");
    obj.edit50:setFontSize(18);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit50, "fontStyle",  "bold");
    obj.edit50:setFontFamily("kalam");
    obj.edit50:setType("number");
    obj.edit50:setTransparent(true);

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle2);
    obj.layout63:setLeft(471);
    obj.layout63:setTop(730);
    obj.layout63:setWidth(74);
    obj.layout63:setHeight(27);
    obj.layout63:setName("layout63");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout63);
    obj.edit51:setField("Peri16");
    obj.edit51:setWidth(74);
    obj.edit51:setHeight(28);
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("#C0504D");
    obj.edit51:setFontSize(18);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit51, "fontStyle",  "bold");
    obj.edit51:setFontFamily("kalam");
    obj.edit51:setType("number");
    obj.edit51:setTransparent(true);

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle2);
    obj.layout64:setLeft(473);
    obj.layout64:setTop(762);
    obj.layout64:setWidth(73);
    obj.layout64:setHeight(26);
    obj.layout64:setName("layout64");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout64);
    obj.edit52:setField("Peri17");
    obj.edit52:setWidth(73);
    obj.edit52:setHeight(27);
    obj.edit52:setName("edit52");
    obj.edit52:setFontColor("#C0504D");
    obj.edit52:setFontSize(18);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit52, "fontStyle",  "bold");
    obj.edit52:setFontFamily("kalam");
    obj.edit52:setType("number");
    obj.edit52:setTransparent(true);

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle2);
    obj.layout65:setLeft(472);
    obj.layout65:setTop(794);
    obj.layout65:setWidth(74);
    obj.layout65:setHeight(26);
    obj.layout65:setName("layout65");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout65);
    obj.edit53:setField("Peri18");
    obj.edit53:setWidth(74);
    obj.edit53:setHeight(27);
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("#C0504D");
    obj.edit53:setFontSize(18);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit53, "fontStyle",  "bold");
    obj.edit53:setFontFamily("kalam");
    obj.edit53:setType("number");
    obj.edit53:setTransparent(true);

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle2);
    obj.layout66:setLeft(472);
    obj.layout66:setTop(825);
    obj.layout66:setWidth(74);
    obj.layout66:setHeight(26);
    obj.layout66:setName("layout66");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout66);
    obj.edit54:setField("Peri19");
    obj.edit54:setWidth(74);
    obj.edit54:setHeight(27);
    obj.edit54:setName("edit54");
    obj.edit54:setFontColor("#C0504D");
    obj.edit54:setFontSize(18);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit54, "fontStyle",  "bold");
    obj.edit54:setFontFamily("kalam");
    obj.edit54:setType("number");
    obj.edit54:setTransparent(true);

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle2);
    obj.layout67:setLeft(474);
    obj.layout67:setTop(856);
    obj.layout67:setWidth(70);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout67);
    obj.edit55:setField("Peri20");
    obj.edit55:setWidth(70);
    obj.edit55:setHeight(26);
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("#C0504D");
    obj.edit55:setFontSize(18);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit55, "fontStyle",  "bold");
    obj.edit55:setFontFamily("kalam");
    obj.edit55:setType("number");
    obj.edit55:setTransparent(true);

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle2);
    obj.layout68:setLeft(471);
    obj.layout68:setTop(887);
    obj.layout68:setWidth(75);
    obj.layout68:setHeight(26);
    obj.layout68:setName("layout68");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout68);
    obj.edit56:setField("Peri21");
    obj.edit56:setWidth(75);
    obj.edit56:setHeight(27);
    obj.edit56:setName("edit56");
    obj.edit56:setFontColor("#C0504D");
    obj.edit56:setFontSize(18);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit56, "fontStyle",  "bold");
    obj.edit56:setFontFamily("kalam");
    obj.edit56:setType("number");
    obj.edit56:setTransparent(true);

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle2);
    obj.layout69:setLeft(472);
    obj.layout69:setTop(919);
    obj.layout69:setWidth(74);
    obj.layout69:setHeight(26);
    obj.layout69:setName("layout69");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout69);
    obj.edit57:setField("Peri22");
    obj.edit57:setWidth(74);
    obj.edit57:setHeight(27);
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("#C0504D");
    obj.edit57:setFontSize(18);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit57, "fontStyle",  "bold");
    obj.edit57:setFontFamily("kalam");
    obj.edit57:setType("number");
    obj.edit57:setTransparent(true);

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle2);
    obj.layout70:setLeft(471);
    obj.layout70:setTop(949);
    obj.layout70:setWidth(73);
    obj.layout70:setHeight(26);
    obj.layout70:setName("layout70");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout70);
    obj.edit58:setField("Peri23");
    obj.edit58:setWidth(73);
    obj.edit58:setHeight(27);
    obj.edit58:setName("edit58");
    obj.edit58:setFontColor("#C0504D");
    obj.edit58:setFontSize(18);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit58, "fontStyle",  "bold");
    obj.edit58:setFontFamily("kalam");
    obj.edit58:setType("number");
    obj.edit58:setTransparent(true);

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle2);
    obj.layout71:setLeft(472);
    obj.layout71:setTop(982);
    obj.layout71:setWidth(74);
    obj.layout71:setHeight(27);
    obj.layout71:setName("layout71");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout71);
    obj.edit59:setField("Peri24");
    obj.edit59:setWidth(74);
    obj.edit59:setHeight(28);
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("#C0504D");
    obj.edit59:setFontSize(18);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit59, "fontStyle",  "bold");
    obj.edit59:setFontFamily("kalam");
    obj.edit59:setType("number");
    obj.edit59:setTransparent(true);

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle2);
    obj.layout72:setLeft(473);
    obj.layout72:setTop(1013);
    obj.layout72:setWidth(73);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout72);
    obj.edit60:setField("Peri25");
    obj.edit60:setWidth(73);
    obj.edit60:setHeight(26);
    obj.edit60:setName("edit60");
    obj.edit60:setFontColor("#C0504D");
    obj.edit60:setFontSize(18);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit60, "fontStyle",  "bold");
    obj.edit60:setFontFamily("kalam");
    obj.edit60:setType("number");
    obj.edit60:setTransparent(true);

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle2);
    obj.layout73:setLeft(473);
    obj.layout73:setTop(1045);
    obj.layout73:setWidth(73);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout73);
    obj.edit61:setField("Peri26");
    obj.edit61:setWidth(73);
    obj.edit61:setHeight(26);
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("#C0504D");
    obj.edit61:setFontSize(18);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit61, "fontStyle",  "bold");
    obj.edit61:setFontFamily("kalam");
    obj.edit61:setType("number");
    obj.edit61:setTransparent(true);

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle2);
    obj.layout74:setLeft(473);
    obj.layout74:setTop(1077);
    obj.layout74:setWidth(73);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout74);
    obj.edit62:setField("Peri27");
    obj.edit62:setWidth(73);
    obj.edit62:setHeight(26);
    obj.edit62:setName("edit62");
    obj.edit62:setFontColor("#C0504D");
    obj.edit62:setFontSize(18);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit62, "fontStyle",  "bold");
    obj.edit62:setFontFamily("kalam");
    obj.edit62:setType("number");
    obj.edit62:setTransparent(true);

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle2);
    obj.layout75:setLeft(474);
    obj.layout75:setTop(1107);
    obj.layout75:setWidth(73);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout75);
    obj.edit63:setField("Peri28");
    obj.edit63:setWidth(73);
    obj.edit63:setHeight(26);
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("#C0504D");
    obj.edit63:setFontSize(18);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit63, "fontStyle",  "bold");
    obj.edit63:setFontFamily("kalam");
    obj.edit63:setType("number");
    obj.edit63:setTransparent(true);

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle2);
    obj.layout76:setLeft(474);
    obj.layout76:setTop(1141);
    obj.layout76:setWidth(73);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout76);
    obj.edit64:setField("Peri29");
    obj.edit64:setWidth(73);
    obj.edit64:setHeight(26);
    obj.edit64:setName("edit64");
    obj.edit64:setFontColor("#C0504D");
    obj.edit64:setFontSize(18);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit64, "fontStyle",  "bold");
    obj.edit64:setFontFamily("kalam");
    obj.edit64:setType("number");
    obj.edit64:setTransparent(true);

    obj.DescCircunstancia1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia1:setParent(obj.rectangle2);
    obj.DescCircunstancia1:setName("DescCircunstancia1");
    obj.DescCircunstancia1:setWidth(300);
    obj.DescCircunstancia1:setHeight(300);
    obj.DescCircunstancia1:setBackOpacity(0.5);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.DescCircunstancia1);
    obj.textEditor2:setField("DCir1");
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setFontColor("#C0504D");
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setHorzTextAlign("leading");
    obj.textEditor2:setFontFamily("kalam");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setAlign("client");

    obj.DescCircunstancia2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia2:setParent(obj.rectangle2);
    obj.DescCircunstancia2:setName("DescCircunstancia2");
    obj.DescCircunstancia2:setWidth(300);
    obj.DescCircunstancia2:setHeight(300);
    obj.DescCircunstancia2:setBackOpacity(0.5);

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.DescCircunstancia2);
    obj.textEditor3:setField("DCir2");
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setFontColor("#C0504D");
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setHorzTextAlign("leading");
    obj.textEditor3:setFontFamily("kalam");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setAlign("client");

    obj.DescCircunstancia3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia3:setParent(obj.rectangle2);
    obj.DescCircunstancia3:setName("DescCircunstancia3");
    obj.DescCircunstancia3:setWidth(300);
    obj.DescCircunstancia3:setHeight(300);
    obj.DescCircunstancia3:setBackOpacity(0.5);

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.DescCircunstancia3);
    obj.textEditor4:setField("DCir3");
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setFontColor("#C0504D");
    obj.textEditor4:setFontSize(15);
    obj.textEditor4:setHorzTextAlign("leading");
    obj.textEditor4:setFontFamily("kalam");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setAlign("client");

    obj.DescCircunstancia4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia4:setParent(obj.rectangle2);
    obj.DescCircunstancia4:setName("DescCircunstancia4");
    obj.DescCircunstancia4:setWidth(300);
    obj.DescCircunstancia4:setHeight(300);
    obj.DescCircunstancia4:setBackOpacity(0.5);

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.DescCircunstancia4);
    obj.textEditor5:setField("DCir4");
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setFontColor("#C0504D");
    obj.textEditor5:setFontSize(15);
    obj.textEditor5:setHorzTextAlign("leading");
    obj.textEditor5:setFontFamily("kalam");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setAlign("client");

    obj.DescCircunstancia5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia5:setParent(obj.rectangle2);
    obj.DescCircunstancia5:setName("DescCircunstancia5");
    obj.DescCircunstancia5:setWidth(300);
    obj.DescCircunstancia5:setHeight(300);
    obj.DescCircunstancia5:setBackOpacity(0.5);

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.DescCircunstancia5);
    obj.textEditor6:setField("DCir5");
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setFontColor("#C0504D");
    obj.textEditor6:setFontSize(15);
    obj.textEditor6:setHorzTextAlign("leading");
    obj.textEditor6:setFontFamily("kalam");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setAlign("client");

    obj.DescCircunstancia6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia6:setParent(obj.rectangle2);
    obj.DescCircunstancia6:setName("DescCircunstancia6");
    obj.DescCircunstancia6:setWidth(300);
    obj.DescCircunstancia6:setHeight(300);
    obj.DescCircunstancia6:setBackOpacity(0.5);

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.DescCircunstancia6);
    obj.textEditor7:setField("DCir6");
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setFontColor("#C0504D");
    obj.textEditor7:setFontSize(15);
    obj.textEditor7:setHorzTextAlign("leading");
    obj.textEditor7:setFontFamily("kalam");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setAlign("client");

    obj.DescCircunstancia7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia7:setParent(obj.rectangle2);
    obj.DescCircunstancia7:setName("DescCircunstancia7");
    obj.DescCircunstancia7:setWidth(300);
    obj.DescCircunstancia7:setHeight(300);
    obj.DescCircunstancia7:setBackOpacity(0.5);

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.DescCircunstancia7);
    obj.textEditor8:setField("DCir7");
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setFontColor("#C0504D");
    obj.textEditor8:setFontSize(15);
    obj.textEditor8:setHorzTextAlign("leading");
    obj.textEditor8:setFontFamily("kalam");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setAlign("client");

    obj.DescCircunstancia8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia8:setParent(obj.rectangle2);
    obj.DescCircunstancia8:setName("DescCircunstancia8");
    obj.DescCircunstancia8:setWidth(300);
    obj.DescCircunstancia8:setHeight(300);
    obj.DescCircunstancia8:setBackOpacity(0.5);

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.DescCircunstancia8);
    obj.textEditor9:setField("DCir8");
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setFontColor("#C0504D");
    obj.textEditor9:setFontSize(15);
    obj.textEditor9:setHorzTextAlign("leading");
    obj.textEditor9:setFontFamily("kalam");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setAlign("client");

    obj.DescCircunstancia9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia9:setParent(obj.rectangle2);
    obj.DescCircunstancia9:setName("DescCircunstancia9");
    obj.DescCircunstancia9:setWidth(300);
    obj.DescCircunstancia9:setHeight(300);
    obj.DescCircunstancia9:setBackOpacity(0.5);

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.DescCircunstancia9);
    obj.textEditor10:setField("DCir9");
    obj.textEditor10:setName("textEditor10");
    obj.textEditor10:setFontColor("#C0504D");
    obj.textEditor10:setFontSize(15);
    obj.textEditor10:setHorzTextAlign("leading");
    obj.textEditor10:setFontFamily("kalam");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setAlign("client");

    obj.DescCircunstancia10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescCircunstancia10:setParent(obj.rectangle2);
    obj.DescCircunstancia10:setName("DescCircunstancia10");
    obj.DescCircunstancia10:setWidth(300);
    obj.DescCircunstancia10:setHeight(300);
    obj.DescCircunstancia10:setBackOpacity(0.5);

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.DescCircunstancia10);
    obj.textEditor11:setField("10");
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setFontColor("#C0504D");
    obj.textEditor11:setFontSize(15);
    obj.textEditor11:setHorzTextAlign("leading");
    obj.textEditor11:setFontFamily("kalam");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setAlign("client");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle2);
    obj.layout77:setLeft(578);
    obj.layout77:setTop(264);
    obj.layout77:setWidth(191);
    obj.layout77:setHeight(35);
    obj.layout77:setName("layout77");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout77);
    obj.edit65:setWidth(191);
    obj.edit65:setHeight(30);
    obj.edit65:setField("CircField_1");
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("#C0504D");
    obj.edit65:setFontSize(15);
    obj.edit65:setHorzTextAlign("leading");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setFontFamily("kalam");
    obj.edit65:setTransparent(true);

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle2);
    obj.layout78:setLeft(788);
    obj.layout78:setTop(270);
    obj.layout78:setWidth(67);
    obj.layout78:setHeight(29);
    obj.layout78:setName("layout78");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout78);
    obj.edit66:setTransparent(true);
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(67);
    obj.edit66:setHeight(30);
    obj.edit66:setField("CircXP_1");
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("#C0504D");
    obj.edit66:setFontSize(18);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit66, "fontStyle",  "bold");
    obj.edit66:setFontFamily("kalam");
    obj.edit66:setType("number");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.rectangle2);
    obj.button41:setText("i");
    obj.button41:setWidth(20);
    obj.button41:setLeft(867);
    obj.button41:setTop(273);
    obj.button41:setHeight(20);
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.rectangle2);
    obj.button42:setLeft(887);
    obj.button42:setTop(273);
    obj.button42:setWidth(14);
    obj.button42:setHeight(14);
    obj.button42:setText("R");
    obj.button42:setHint("Desc... ");
    obj.button42:setName("button42");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.rectangle2);
    obj.image46:setWidth(17);
    obj.image46:setHeight(17);
    obj.image46:setLeft(886);
    obj.image46:setTop(273);
    obj.image46:setStyle("proportional");
    obj.image46:setCenter(true);
    obj.image46:setSRC("images/Dado.jpg");
    obj.image46:setName("image46");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle2);
    obj.layout79:setLeft(578);
    obj.layout79:setTop(300);
    obj.layout79:setWidth(191);
    obj.layout79:setHeight(30);
    obj.layout79:setName("layout79");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout79);
    obj.edit67:setWidth(191);
    obj.edit67:setHeight(30);
    obj.edit67:setField("CircField_2");
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("#C0504D");
    obj.edit67:setFontSize(15);
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setFontFamily("kalam");
    obj.edit67:setTransparent(true);

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle2);
    obj.layout80:setLeft(788);
    obj.layout80:setTop(303);
    obj.layout80:setWidth(67);
    obj.layout80:setHeight(30);
    obj.layout80:setName("layout80");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout80);
    obj.edit68:setTransparent(true);
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(67);
    obj.edit68:setHeight(31);
    obj.edit68:setField("CircXP_2");
    obj.edit68:setName("edit68");
    obj.edit68:setFontColor("#C0504D");
    obj.edit68:setFontSize(18);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit68, "fontStyle",  "bold");
    obj.edit68:setFontFamily("kalam");
    obj.edit68:setType("number");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.rectangle2);
    obj.button43:setText("i");
    obj.button43:setWidth(20);
    obj.button43:setLeft(867);
    obj.button43:setTop(306);
    obj.button43:setHeight(20);
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle2);
    obj.button44:setLeft(887);
    obj.button44:setTop(306);
    obj.button44:setWidth(14);
    obj.button44:setHeight(14);
    obj.button44:setText("R");
    obj.button44:setHint("Desc... ");
    obj.button44:setName("button44");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.rectangle2);
    obj.image47:setWidth(17);
    obj.image47:setHeight(17);
    obj.image47:setLeft(886);
    obj.image47:setTop(306);
    obj.image47:setStyle("proportional");
    obj.image47:setCenter(true);
    obj.image47:setSRC("images/Dado.jpg");
    obj.image47:setName("image47");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle2);
    obj.layout81:setLeft(578);
    obj.layout81:setTop(335);
    obj.layout81:setWidth(191);
    obj.layout81:setHeight(30);
    obj.layout81:setName("layout81");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout81);
    obj.edit69:setWidth(191);
    obj.edit69:setHeight(30);
    obj.edit69:setField("CircField_3");
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("#C0504D");
    obj.edit69:setFontSize(15);
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setFontFamily("kalam");
    obj.edit69:setTransparent(true);

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle2);
    obj.layout82:setLeft(788);
    obj.layout82:setTop(338);
    obj.layout82:setWidth(67);
    obj.layout82:setHeight(29);
    obj.layout82:setName("layout82");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout82);
    obj.edit70:setTransparent(true);
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(67);
    obj.edit70:setHeight(30);
    obj.edit70:setField("CircXP_3");
    obj.edit70:setName("edit70");
    obj.edit70:setFontColor("#C0504D");
    obj.edit70:setFontSize(18);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit70, "fontStyle",  "bold");
    obj.edit70:setFontFamily("kalam");
    obj.edit70:setType("number");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.rectangle2);
    obj.button45:setText("i");
    obj.button45:setWidth(20);
    obj.button45:setLeft(867);
    obj.button45:setTop(341);
    obj.button45:setHeight(20);
    obj.button45:setName("button45");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.rectangle2);
    obj.button46:setLeft(887);
    obj.button46:setTop(341);
    obj.button46:setWidth(14);
    obj.button46:setHeight(14);
    obj.button46:setText("R");
    obj.button46:setHint("Desc... ");
    obj.button46:setName("button46");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.rectangle2);
    obj.image48:setWidth(17);
    obj.image48:setHeight(17);
    obj.image48:setLeft(886);
    obj.image48:setTop(341);
    obj.image48:setStyle("proportional");
    obj.image48:setCenter(true);
    obj.image48:setSRC("images/Dado.jpg");
    obj.image48:setName("image48");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle2);
    obj.layout83:setLeft(578);
    obj.layout83:setTop(370);
    obj.layout83:setWidth(191);
    obj.layout83:setHeight(30);
    obj.layout83:setName("layout83");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout83);
    obj.edit71:setWidth(191);
    obj.edit71:setHeight(30);
    obj.edit71:setField("CircField_4");
    obj.edit71:setName("edit71");
    obj.edit71:setFontColor("#C0504D");
    obj.edit71:setFontSize(15);
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setFontFamily("kalam");
    obj.edit71:setTransparent(true);

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle2);
    obj.layout84:setLeft(788);
    obj.layout84:setTop(372);
    obj.layout84:setWidth(67);
    obj.layout84:setHeight(29);
    obj.layout84:setName("layout84");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout84);
    obj.edit72:setTransparent(true);
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(67);
    obj.edit72:setHeight(30);
    obj.edit72:setField("CircXP_4");
    obj.edit72:setName("edit72");
    obj.edit72:setFontColor("#C0504D");
    obj.edit72:setFontSize(18);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit72, "fontStyle",  "bold");
    obj.edit72:setFontFamily("kalam");
    obj.edit72:setType("number");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.rectangle2);
    obj.button47:setText("i");
    obj.button47:setWidth(20);
    obj.button47:setLeft(867);
    obj.button47:setTop(375);
    obj.button47:setHeight(20);
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.rectangle2);
    obj.button48:setLeft(887);
    obj.button48:setTop(376);
    obj.button48:setWidth(14);
    obj.button48:setHeight(14);
    obj.button48:setText("R");
    obj.button48:setHint("Desc... ");
    obj.button48:setName("button48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.rectangle2);
    obj.image49:setWidth(17);
    obj.image49:setHeight(17);
    obj.image49:setLeft(886);
    obj.image49:setTop(376);
    obj.image49:setStyle("proportional");
    obj.image49:setCenter(true);
    obj.image49:setSRC("images/Dado.jpg");
    obj.image49:setName("image49");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle2);
    obj.layout85:setLeft(578);
    obj.layout85:setTop(403);
    obj.layout85:setWidth(191);
    obj.layout85:setHeight(30);
    obj.layout85:setName("layout85");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout85);
    obj.edit73:setWidth(191);
    obj.edit73:setHeight(30);
    obj.edit73:setField("CircField_5");
    obj.edit73:setName("edit73");
    obj.edit73:setFontColor("#C0504D");
    obj.edit73:setFontSize(15);
    obj.edit73:setHorzTextAlign("leading");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setFontFamily("kalam");
    obj.edit73:setTransparent(true);

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle2);
    obj.layout86:setLeft(788);
    obj.layout86:setTop(406);
    obj.layout86:setWidth(67);
    obj.layout86:setHeight(29);
    obj.layout86:setName("layout86");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout86);
    obj.edit74:setTransparent(true);
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(67);
    obj.edit74:setHeight(30);
    obj.edit74:setField("CircXP_5");
    obj.edit74:setName("edit74");
    obj.edit74:setFontColor("#C0504D");
    obj.edit74:setFontSize(18);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit74, "fontStyle",  "bold");
    obj.edit74:setFontFamily("kalam");
    obj.edit74:setType("number");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.rectangle2);
    obj.button49:setText("i");
    obj.button49:setWidth(20);
    obj.button49:setLeft(867);
    obj.button49:setTop(409);
    obj.button49:setHeight(20);
    obj.button49:setName("button49");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.rectangle2);
    obj.button50:setLeft(887);
    obj.button50:setTop(409);
    obj.button50:setWidth(14);
    obj.button50:setHeight(14);
    obj.button50:setText("R");
    obj.button50:setHint("Desc... ");
    obj.button50:setName("button50");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.rectangle2);
    obj.image50:setWidth(17);
    obj.image50:setHeight(17);
    obj.image50:setLeft(886);
    obj.image50:setTop(409);
    obj.image50:setStyle("proportional");
    obj.image50:setCenter(true);
    obj.image50:setSRC("images/Dado.jpg");
    obj.image50:setName("image50");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle2);
    obj.layout87:setLeft(578);
    obj.layout87:setTop(437);
    obj.layout87:setWidth(191);
    obj.layout87:setHeight(30);
    obj.layout87:setName("layout87");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout87);
    obj.edit75:setWidth(191);
    obj.edit75:setHeight(30);
    obj.edit75:setField("CircField_6");
    obj.edit75:setName("edit75");
    obj.edit75:setFontColor("#C0504D");
    obj.edit75:setFontSize(15);
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setFontFamily("kalam");
    obj.edit75:setTransparent(true);

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle2);
    obj.layout88:setLeft(788);
    obj.layout88:setTop(440);
    obj.layout88:setWidth(67);
    obj.layout88:setHeight(29);
    obj.layout88:setName("layout88");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout88);
    obj.edit76:setTransparent(true);
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(67);
    obj.edit76:setHeight(30);
    obj.edit76:setField("CircXP_6");
    obj.edit76:setName("edit76");
    obj.edit76:setFontColor("#C0504D");
    obj.edit76:setFontSize(18);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit76, "fontStyle",  "bold");
    obj.edit76:setFontFamily("kalam");
    obj.edit76:setType("number");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.rectangle2);
    obj.button51:setText("i");
    obj.button51:setWidth(20);
    obj.button51:setLeft(867);
    obj.button51:setTop(443);
    obj.button51:setHeight(20);
    obj.button51:setName("button51");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.rectangle2);
    obj.button52:setLeft(887);
    obj.button52:setTop(443);
    obj.button52:setWidth(14);
    obj.button52:setHeight(14);
    obj.button52:setText("R");
    obj.button52:setHint("Desc... ");
    obj.button52:setName("button52");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.rectangle2);
    obj.image51:setWidth(17);
    obj.image51:setHeight(17);
    obj.image51:setLeft(886);
    obj.image51:setTop(443);
    obj.image51:setStyle("proportional");
    obj.image51:setCenter(true);
    obj.image51:setSRC("images/Dado.jpg");
    obj.image51:setName("image51");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle2);
    obj.layout89:setLeft(578);
    obj.layout89:setTop(470);
    obj.layout89:setWidth(191);
    obj.layout89:setHeight(30);
    obj.layout89:setName("layout89");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout89);
    obj.edit77:setWidth(191);
    obj.edit77:setHeight(30);
    obj.edit77:setField("CircField_7");
    obj.edit77:setName("edit77");
    obj.edit77:setFontColor("#C0504D");
    obj.edit77:setFontSize(15);
    obj.edit77:setHorzTextAlign("leading");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setFontFamily("kalam");
    obj.edit77:setTransparent(true);

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle2);
    obj.layout90:setLeft(788);
    obj.layout90:setTop(474);
    obj.layout90:setWidth(67);
    obj.layout90:setHeight(29);
    obj.layout90:setName("layout90");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout90);
    obj.edit78:setTransparent(true);
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(67);
    obj.edit78:setHeight(30);
    obj.edit78:setField("CircXP_7");
    obj.edit78:setName("edit78");
    obj.edit78:setFontColor("#C0504D");
    obj.edit78:setFontSize(18);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit78, "fontStyle",  "bold");
    obj.edit78:setFontFamily("kalam");
    obj.edit78:setType("number");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.rectangle2);
    obj.button53:setText("i");
    obj.button53:setWidth(20);
    obj.button53:setLeft(867);
    obj.button53:setTop(477);
    obj.button53:setHeight(20);
    obj.button53:setName("button53");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.rectangle2);
    obj.button54:setLeft(887);
    obj.button54:setTop(476);
    obj.button54:setWidth(14);
    obj.button54:setHeight(14);
    obj.button54:setText("R");
    obj.button54:setHint("Desc... ");
    obj.button54:setName("button54");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.rectangle2);
    obj.image52:setWidth(17);
    obj.image52:setHeight(17);
    obj.image52:setLeft(886);
    obj.image52:setTop(476);
    obj.image52:setStyle("proportional");
    obj.image52:setCenter(true);
    obj.image52:setSRC("images/Dado.jpg");
    obj.image52:setName("image52");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle2);
    obj.layout91:setLeft(578);
    obj.layout91:setTop(504);
    obj.layout91:setWidth(191);
    obj.layout91:setHeight(30);
    obj.layout91:setName("layout91");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout91);
    obj.edit79:setWidth(191);
    obj.edit79:setHeight(30);
    obj.edit79:setField("CircField_8");
    obj.edit79:setName("edit79");
    obj.edit79:setFontColor("#C0504D");
    obj.edit79:setFontSize(15);
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setFontFamily("kalam");
    obj.edit79:setTransparent(true);

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle2);
    obj.layout92:setLeft(788);
    obj.layout92:setTop(508);
    obj.layout92:setWidth(67);
    obj.layout92:setHeight(29);
    obj.layout92:setName("layout92");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout92);
    obj.edit80:setTransparent(true);
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(67);
    obj.edit80:setHeight(30);
    obj.edit80:setField("CircXP_8");
    obj.edit80:setName("edit80");
    obj.edit80:setFontColor("#C0504D");
    obj.edit80:setFontSize(18);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit80, "fontStyle",  "bold");
    obj.edit80:setFontFamily("kalam");
    obj.edit80:setType("number");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.rectangle2);
    obj.button55:setText("i");
    obj.button55:setWidth(20);
    obj.button55:setLeft(867);
    obj.button55:setTop(511);
    obj.button55:setHeight(20);
    obj.button55:setName("button55");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.rectangle2);
    obj.button56:setLeft(887);
    obj.button56:setTop(510);
    obj.button56:setWidth(14);
    obj.button56:setHeight(14);
    obj.button56:setText("R");
    obj.button56:setHint("Desc... ");
    obj.button56:setName("button56");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.rectangle2);
    obj.image53:setWidth(17);
    obj.image53:setHeight(17);
    obj.image53:setLeft(886);
    obj.image53:setTop(510);
    obj.image53:setStyle("proportional");
    obj.image53:setCenter(true);
    obj.image53:setSRC("images/Dado.jpg");
    obj.image53:setName("image53");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle2);
    obj.layout93:setLeft(577);
    obj.layout93:setTop(538);
    obj.layout93:setWidth(191);
    obj.layout93:setHeight(30);
    obj.layout93:setName("layout93");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout93);
    obj.edit81:setWidth(191);
    obj.edit81:setHeight(30);
    obj.edit81:setField("CircField_9");
    obj.edit81:setName("edit81");
    obj.edit81:setFontColor("#C0504D");
    obj.edit81:setFontSize(15);
    obj.edit81:setHorzTextAlign("leading");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setFontFamily("kalam");
    obj.edit81:setTransparent(true);

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle2);
    obj.layout94:setLeft(788);
    obj.layout94:setTop(542);
    obj.layout94:setWidth(67);
    obj.layout94:setHeight(29);
    obj.layout94:setName("layout94");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout94);
    obj.edit82:setTransparent(true);
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(67);
    obj.edit82:setHeight(30);
    obj.edit82:setField("CircXP_9");
    obj.edit82:setName("edit82");
    obj.edit82:setFontColor("#C0504D");
    obj.edit82:setFontSize(18);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit82, "fontStyle",  "bold");
    obj.edit82:setFontFamily("kalam");
    obj.edit82:setType("number");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.rectangle2);
    obj.button57:setText("i");
    obj.button57:setWidth(20);
    obj.button57:setLeft(867);
    obj.button57:setTop(545);
    obj.button57:setHeight(20);
    obj.button57:setName("button57");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.rectangle2);
    obj.button58:setLeft(887);
    obj.button58:setTop(544);
    obj.button58:setWidth(14);
    obj.button58:setHeight(14);
    obj.button58:setText("R");
    obj.button58:setHint("Desc... ");
    obj.button58:setName("button58");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.rectangle2);
    obj.image54:setWidth(17);
    obj.image54:setHeight(17);
    obj.image54:setLeft(886);
    obj.image54:setTop(544);
    obj.image54:setStyle("proportional");
    obj.image54:setCenter(true);
    obj.image54:setSRC("images/Dado.jpg");
    obj.image54:setName("image54");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle2);
    obj.layout95:setLeft(577);
    obj.layout95:setTop(572);
    obj.layout95:setWidth(191);
    obj.layout95:setHeight(30);
    obj.layout95:setName("layout95");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout95);
    obj.edit83:setTransparent(true);
    obj.edit83:setWidth(191);
    obj.edit83:setHeight(30);
    obj.edit83:setField("CircField_1o");
    obj.edit83:setName("edit83");
    obj.edit83:setFontColor("#C0504D");
    obj.edit83:setFontSize(15);
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setFontFamily("kalam");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle2);
    obj.layout96:setLeft(788);
    obj.layout96:setTop(576);
    obj.layout96:setWidth(67);
    obj.layout96:setHeight(29);
    obj.layout96:setName("layout96");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout96);
    obj.edit84:setTransparent(true);
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(67);
    obj.edit84:setHeight(30);
    obj.edit84:setField("CircXP_10");
    obj.edit84:setName("edit84");
    obj.edit84:setFontColor("#C0504D");
    obj.edit84:setFontSize(18);
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit84, "fontStyle",  "bold");
    obj.edit84:setFontFamily("kalam");
    obj.edit84:setType("number");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.rectangle2);
    obj.button59:setText("i");
    obj.button59:setWidth(20);
    obj.button59:setLeft(867);
    obj.button59:setTop(579);
    obj.button59:setHeight(20);
    obj.button59:setName("button59");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.rectangle2);
    obj.button60:setLeft(887);
    obj.button60:setTop(578);
    obj.button60:setWidth(14);
    obj.button60:setHeight(14);
    obj.button60:setText("R");
    obj.button60:setHint("Desc... ");
    obj.button60:setName("button60");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.rectangle2);
    obj.image55:setWidth(17);
    obj.image55:setHeight(17);
    obj.image55:setLeft(886);
    obj.image55:setTop(578);
    obj.image55:setStyle("proportional");
    obj.image55:setCenter(true);
    obj.image55:setSRC("images/Dado.jpg");
    obj.image55:setName("image55");

    obj.DescVanDes1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes1:setParent(obj.rectangle2);
    obj.DescVanDes1:setName("DescVanDes1");
    obj.DescVanDes1:setWidth(300);
    obj.DescVanDes1:setHeight(300);
    obj.DescVanDes1:setBackOpacity(0.5);

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.DescVanDes1);
    obj.textEditor12:setField("DVanDes1");
    obj.textEditor12:setName("textEditor12");
    obj.textEditor12:setFontColor("#C0504D");
    obj.textEditor12:setFontSize(15);
    obj.textEditor12:setHorzTextAlign("leading");
    obj.textEditor12:setFontFamily("kalam");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setAlign("client");

    obj.DescVanDes2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes2:setParent(obj.rectangle2);
    obj.DescVanDes2:setName("DescVanDes2");
    obj.DescVanDes2:setWidth(300);
    obj.DescVanDes2:setHeight(300);
    obj.DescVanDes2:setBackOpacity(0.5);

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.DescVanDes2);
    obj.textEditor13:setField("DVanDes2");
    obj.textEditor13:setName("textEditor13");
    obj.textEditor13:setFontColor("#C0504D");
    obj.textEditor13:setFontSize(15);
    obj.textEditor13:setHorzTextAlign("leading");
    obj.textEditor13:setFontFamily("kalam");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setAlign("client");

    obj.DescVanDes3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes3:setParent(obj.rectangle2);
    obj.DescVanDes3:setName("DescVanDes3");
    obj.DescVanDes3:setWidth(300);
    obj.DescVanDes3:setHeight(300);
    obj.DescVanDes3:setBackOpacity(0.5);

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.DescVanDes3);
    obj.textEditor14:setField("DVanDes3");
    obj.textEditor14:setName("textEditor14");
    obj.textEditor14:setFontColor("#C0504D");
    obj.textEditor14:setFontSize(15);
    obj.textEditor14:setHorzTextAlign("leading");
    obj.textEditor14:setFontFamily("kalam");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setAlign("client");

    obj.DescVanDes4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes4:setParent(obj.rectangle2);
    obj.DescVanDes4:setName("DescVanDes4");
    obj.DescVanDes4:setWidth(300);
    obj.DescVanDes4:setHeight(300);
    obj.DescVanDes4:setBackOpacity(0.5);

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.DescVanDes4);
    obj.textEditor15:setField("DVanDes4");
    obj.textEditor15:setName("textEditor15");
    obj.textEditor15:setFontColor("#C0504D");
    obj.textEditor15:setFontSize(15);
    obj.textEditor15:setHorzTextAlign("leading");
    obj.textEditor15:setFontFamily("kalam");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setAlign("client");

    obj.DescVanDes5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes5:setParent(obj.rectangle2);
    obj.DescVanDes5:setName("DescVanDes5");
    obj.DescVanDes5:setWidth(300);
    obj.DescVanDes5:setHeight(300);
    obj.DescVanDes5:setBackOpacity(0.5);

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.DescVanDes5);
    obj.textEditor16:setField("DVanDes5");
    obj.textEditor16:setName("textEditor16");
    obj.textEditor16:setFontColor("#C0504D");
    obj.textEditor16:setFontSize(15);
    obj.textEditor16:setHorzTextAlign("leading");
    obj.textEditor16:setFontFamily("kalam");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setAlign("client");

    obj.DescVanDes6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes6:setParent(obj.rectangle2);
    obj.DescVanDes6:setName("DescVanDes6");
    obj.DescVanDes6:setWidth(300);
    obj.DescVanDes6:setHeight(300);
    obj.DescVanDes6:setBackOpacity(0.5);

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.DescVanDes6);
    obj.textEditor17:setField("DVanDes6");
    obj.textEditor17:setName("textEditor17");
    obj.textEditor17:setFontColor("#C0504D");
    obj.textEditor17:setFontSize(15);
    obj.textEditor17:setHorzTextAlign("leading");
    obj.textEditor17:setFontFamily("kalam");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setAlign("client");

    obj.DescVanDes7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes7:setParent(obj.rectangle2);
    obj.DescVanDes7:setName("DescVanDes7");
    obj.DescVanDes7:setWidth(300);
    obj.DescVanDes7:setHeight(300);
    obj.DescVanDes7:setBackOpacity(0.5);

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.DescVanDes7);
    obj.textEditor18:setField("DVanDes7");
    obj.textEditor18:setName("textEditor18");
    obj.textEditor18:setFontColor("#C0504D");
    obj.textEditor18:setFontSize(15);
    obj.textEditor18:setHorzTextAlign("leading");
    obj.textEditor18:setFontFamily("kalam");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setAlign("client");

    obj.DescVanDes8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes8:setParent(obj.rectangle2);
    obj.DescVanDes8:setName("DescVanDes8");
    obj.DescVanDes8:setWidth(300);
    obj.DescVanDes8:setHeight(300);
    obj.DescVanDes8:setBackOpacity(0.5);

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.DescVanDes8);
    obj.textEditor19:setField("DVanDes8");
    obj.textEditor19:setName("textEditor19");
    obj.textEditor19:setFontColor("#C0504D");
    obj.textEditor19:setFontSize(15);
    obj.textEditor19:setHorzTextAlign("leading");
    obj.textEditor19:setFontFamily("kalam");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setAlign("client");

    obj.DescVanDes9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.DescVanDes9:setParent(obj.rectangle2);
    obj.DescVanDes9:setName("DescVanDes9");
    obj.DescVanDes9:setWidth(300);
    obj.DescVanDes9:setHeight(300);
    obj.DescVanDes9:setBackOpacity(0.5);

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.DescVanDes9);
    obj.textEditor20:setField("DVanDes9");
    obj.textEditor20:setName("textEditor20");
    obj.textEditor20:setFontColor("#C0504D");
    obj.textEditor20:setFontSize(15);
    obj.textEditor20:setHorzTextAlign("leading");
    obj.textEditor20:setFontFamily("kalam");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setAlign("client");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle2);
    obj.layout97:setLeft(576);
    obj.layout97:setTop(672);
    obj.layout97:setWidth(193);
    obj.layout97:setHeight(30);
    obj.layout97:setName("layout97");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout97);
    obj.edit85:setWidth(193);
    obj.edit85:setHeight(31);
    obj.edit85:setField("VeD_Txt_1");
    obj.edit85:setName("edit85");
    obj.edit85:setFontColor("#C0504D");
    obj.edit85:setFontSize(15);
    obj.edit85:setHorzTextAlign("leading");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setFontFamily("kalam");
    obj.edit85:setTransparent(true);

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle2);
    obj.layout98:setLeft(783);
    obj.layout98:setTop(679);
    obj.layout98:setWidth(72);
    obj.layout98:setHeight(30);
    obj.layout98:setName("layout98");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout98);
    obj.edit86:setTransparent(true);
    obj.edit86:setWidth(72);
    obj.edit86:setHeight(30);
    obj.edit86:setField("VeD_01");
    obj.edit86:setName("edit86");
    obj.edit86:setFontColor("#C0504D");
    obj.edit86:setFontSize(18);
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit86, "fontStyle",  "bold");
    obj.edit86:setFontFamily("kalam");
    obj.edit86:setType("number");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.rectangle2);
    obj.button61:setText("i");
    obj.button61:setWidth(20);
    obj.button61:setLeft(864);
    obj.button61:setTop(682);
    obj.button61:setHeight(20);
    obj.button61:setName("button61");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle2);
    obj.layout99:setLeft(576);
    obj.layout99:setTop(707);
    obj.layout99:setWidth(193);
    obj.layout99:setHeight(30);
    obj.layout99:setName("layout99");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout99);
    obj.edit87:setWidth(193);
    obj.edit87:setHeight(31);
    obj.edit87:setField("VeD_Txt_2");
    obj.edit87:setName("edit87");
    obj.edit87:setFontColor("#C0504D");
    obj.edit87:setFontSize(15);
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setFontFamily("kalam");
    obj.edit87:setTransparent(true);

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle2);
    obj.layout100:setLeft(783);
    obj.layout100:setTop(713);
    obj.layout100:setWidth(72);
    obj.layout100:setHeight(30);
    obj.layout100:setName("layout100");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout100);
    obj.edit88:setTransparent(true);
    obj.edit88:setWidth(72);
    obj.edit88:setHeight(30);
    obj.edit88:setField("VeD_02");
    obj.edit88:setName("edit88");
    obj.edit88:setFontColor("#C0504D");
    obj.edit88:setFontSize(18);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit88, "fontStyle",  "bold");
    obj.edit88:setFontFamily("kalam");
    obj.edit88:setType("number");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.rectangle2);
    obj.button62:setText("i");
    obj.button62:setWidth(20);
    obj.button62:setLeft(864);
    obj.button62:setTop(716);
    obj.button62:setHeight(20);
    obj.button62:setName("button62");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle2);
    obj.layout101:setLeft(576);
    obj.layout101:setTop(742);
    obj.layout101:setWidth(193);
    obj.layout101:setHeight(30);
    obj.layout101:setName("layout101");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout101);
    obj.edit89:setWidth(193);
    obj.edit89:setHeight(31);
    obj.edit89:setField("VeD_Txt_3");
    obj.edit89:setName("edit89");
    obj.edit89:setFontColor("#C0504D");
    obj.edit89:setFontSize(15);
    obj.edit89:setHorzTextAlign("leading");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setFontFamily("kalam");
    obj.edit89:setTransparent(true);

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle2);
    obj.layout102:setLeft(784);
    obj.layout102:setTop(748);
    obj.layout102:setWidth(72);
    obj.layout102:setHeight(30);
    obj.layout102:setName("layout102");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout102);
    obj.edit90:setTransparent(true);
    obj.edit90:setWidth(72);
    obj.edit90:setHeight(30);
    obj.edit90:setField("VeD_03");
    obj.edit90:setName("edit90");
    obj.edit90:setFontColor("#C0504D");
    obj.edit90:setFontSize(18);
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit90, "fontStyle",  "bold");
    obj.edit90:setFontFamily("kalam");
    obj.edit90:setType("number");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.rectangle2);
    obj.button63:setText("i");
    obj.button63:setWidth(20);
    obj.button63:setLeft(864);
    obj.button63:setTop(751);
    obj.button63:setHeight(20);
    obj.button63:setName("button63");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle2);
    obj.layout103:setLeft(576);
    obj.layout103:setTop(776);
    obj.layout103:setWidth(193);
    obj.layout103:setHeight(30);
    obj.layout103:setName("layout103");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout103);
    obj.edit91:setWidth(193);
    obj.edit91:setHeight(31);
    obj.edit91:setField("VeD_Txt_4");
    obj.edit91:setName("edit91");
    obj.edit91:setFontColor("#C0504D");
    obj.edit91:setFontSize(15);
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setFontFamily("kalam");
    obj.edit91:setTransparent(true);

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle2);
    obj.layout104:setLeft(783);
    obj.layout104:setTop(782);
    obj.layout104:setWidth(72);
    obj.layout104:setHeight(30);
    obj.layout104:setName("layout104");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout104);
    obj.edit92:setTransparent(true);
    obj.edit92:setWidth(72);
    obj.edit92:setHeight(30);
    obj.edit92:setField("VeD_04");
    obj.edit92:setName("edit92");
    obj.edit92:setFontColor("#C0504D");
    obj.edit92:setFontSize(18);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit92, "fontStyle",  "bold");
    obj.edit92:setFontFamily("kalam");
    obj.edit92:setType("number");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.rectangle2);
    obj.button64:setText("i");
    obj.button64:setWidth(20);
    obj.button64:setLeft(864);
    obj.button64:setTop(785);
    obj.button64:setHeight(20);
    obj.button64:setName("button64");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle2);
    obj.layout105:setLeft(576);
    obj.layout105:setTop(810);
    obj.layout105:setWidth(193);
    obj.layout105:setHeight(30);
    obj.layout105:setName("layout105");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout105);
    obj.edit93:setWidth(193);
    obj.edit93:setHeight(31);
    obj.edit93:setField("VeD_Txt_5");
    obj.edit93:setName("edit93");
    obj.edit93:setFontColor("#C0504D");
    obj.edit93:setFontSize(15);
    obj.edit93:setHorzTextAlign("leading");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setFontFamily("kalam");
    obj.edit93:setTransparent(true);

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle2);
    obj.layout106:setLeft(783);
    obj.layout106:setTop(815);
    obj.layout106:setWidth(72);
    obj.layout106:setHeight(30);
    obj.layout106:setName("layout106");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout106);
    obj.edit94:setTransparent(true);
    obj.edit94:setWidth(72);
    obj.edit94:setHeight(30);
    obj.edit94:setField("VeD_05");
    obj.edit94:setName("edit94");
    obj.edit94:setFontColor("#C0504D");
    obj.edit94:setFontSize(18);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit94, "fontStyle",  "bold");
    obj.edit94:setFontFamily("kalam");
    obj.edit94:setType("number");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.rectangle2);
    obj.button65:setText("i");
    obj.button65:setWidth(20);
    obj.button65:setLeft(864);
    obj.button65:setTop(818);
    obj.button65:setHeight(20);
    obj.button65:setName("button65");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle2);
    obj.layout107:setLeft(576);
    obj.layout107:setTop(844);
    obj.layout107:setWidth(193);
    obj.layout107:setHeight(30);
    obj.layout107:setName("layout107");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout107);
    obj.edit95:setWidth(193);
    obj.edit95:setHeight(31);
    obj.edit95:setField("VeD_Txt_6");
    obj.edit95:setName("edit95");
    obj.edit95:setFontColor("#C0504D");
    obj.edit95:setFontSize(15);
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setFontFamily("kalam");
    obj.edit95:setTransparent(true);

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle2);
    obj.layout108:setLeft(785);
    obj.layout108:setTop(849);
    obj.layout108:setWidth(72);
    obj.layout108:setHeight(30);
    obj.layout108:setName("layout108");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout108);
    obj.edit96:setTransparent(true);
    obj.edit96:setWidth(72);
    obj.edit96:setHeight(30);
    obj.edit96:setField("VeD_06");
    obj.edit96:setName("edit96");
    obj.edit96:setFontColor("#C0504D");
    obj.edit96:setFontSize(18);
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit96, "fontStyle",  "bold");
    obj.edit96:setFontFamily("kalam");
    obj.edit96:setType("number");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.rectangle2);
    obj.button66:setText("i");
    obj.button66:setWidth(20);
    obj.button66:setLeft(864);
    obj.button66:setTop(852);
    obj.button66:setHeight(20);
    obj.button66:setName("button66");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle2);
    obj.layout109:setLeft(576);
    obj.layout109:setTop(879);
    obj.layout109:setWidth(193);
    obj.layout109:setHeight(30);
    obj.layout109:setName("layout109");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout109);
    obj.edit97:setWidth(193);
    obj.edit97:setHeight(31);
    obj.edit97:setField("VeD_Txt_7");
    obj.edit97:setName("edit97");
    obj.edit97:setFontColor("#C0504D");
    obj.edit97:setFontSize(15);
    obj.edit97:setHorzTextAlign("leading");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setFontFamily("kalam");
    obj.edit97:setTransparent(true);

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle2);
    obj.layout110:setLeft(784);
    obj.layout110:setTop(884);
    obj.layout110:setWidth(72);
    obj.layout110:setHeight(30);
    obj.layout110:setName("layout110");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout110);
    obj.edit98:setTransparent(true);
    obj.edit98:setWidth(72);
    obj.edit98:setHeight(30);
    obj.edit98:setField("VeD_07");
    obj.edit98:setName("edit98");
    obj.edit98:setFontColor("#C0504D");
    obj.edit98:setFontSize(18);
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit98, "fontStyle",  "bold");
    obj.edit98:setFontFamily("kalam");
    obj.edit98:setType("number");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.rectangle2);
    obj.button67:setText("i");
    obj.button67:setWidth(20);
    obj.button67:setLeft(864);
    obj.button67:setTop(887);
    obj.button67:setHeight(20);
    obj.button67:setName("button67");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle2);
    obj.layout111:setLeft(578);
    obj.layout111:setTop(913);
    obj.layout111:setWidth(191);
    obj.layout111:setHeight(30);
    obj.layout111:setName("layout111");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout111);
    obj.edit99:setWidth(191);
    obj.edit99:setHeight(31);
    obj.edit99:setField("VeD_Txt_8");
    obj.edit99:setName("edit99");
    obj.edit99:setFontColor("#C0504D");
    obj.edit99:setFontSize(15);
    obj.edit99:setHorzTextAlign("leading");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setFontFamily("kalam");
    obj.edit99:setTransparent(true);

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle2);
    obj.layout112:setLeft(784);
    obj.layout112:setTop(917);
    obj.layout112:setWidth(72);
    obj.layout112:setHeight(30);
    obj.layout112:setName("layout112");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout112);
    obj.edit100:setTransparent(true);
    obj.edit100:setWidth(72);
    obj.edit100:setHeight(30);
    obj.edit100:setField("VeD_08");
    obj.edit100:setName("edit100");
    obj.edit100:setFontColor("#C0504D");
    obj.edit100:setFontSize(18);
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit100, "fontStyle",  "bold");
    obj.edit100:setFontFamily("kalam");
    obj.edit100:setType("number");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.rectangle2);
    obj.button68:setText("i");
    obj.button68:setWidth(20);
    obj.button68:setLeft(864);
    obj.button68:setTop(920);
    obj.button68:setHeight(20);
    obj.button68:setName("button68");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle2);
    obj.layout113:setLeft(575);
    obj.layout113:setTop(949);
    obj.layout113:setWidth(194);
    obj.layout113:setHeight(30);
    obj.layout113:setName("layout113");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout113);
    obj.edit101:setWidth(194);
    obj.edit101:setHeight(31);
    obj.edit101:setField("VeD_Txt_9");
    obj.edit101:setName("edit101");
    obj.edit101:setFontColor("#C0504D");
    obj.edit101:setFontSize(15);
    obj.edit101:setHorzTextAlign("leading");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setFontFamily("kalam");
    obj.edit101:setTransparent(true);

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle2);
    obj.layout114:setLeft(785);
    obj.layout114:setTop(951);
    obj.layout114:setWidth(72);
    obj.layout114:setHeight(30);
    obj.layout114:setName("layout114");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout114);
    obj.edit102:setTransparent(true);
    obj.edit102:setWidth(72);
    obj.edit102:setHeight(30);
    obj.edit102:setField("VeD_09");
    obj.edit102:setName("edit102");
    obj.edit102:setFontColor("#C0504D");
    obj.edit102:setFontSize(18);
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit102, "fontStyle",  "bold");
    obj.edit102:setFontFamily("kalam");
    obj.edit102:setType("number");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.rectangle2);
    obj.button69:setText("i");
    obj.button69:setWidth(20);
    obj.button69:setLeft(864);
    obj.button69:setTop(954);
    obj.button69:setHeight(20);
    obj.button69:setName("button69");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle2);
    obj.layout115:setLeft(739);
    obj.layout115:setTop(1082);
    obj.layout115:setWidth(112);
    obj.layout115:setHeight(50);
    obj.layout115:setName("layout115");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout115);
    obj.label12:setFontSize(30);
    obj.label12:setFontColor("#000000");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("center");
    obj.label12:setLeft(30);
    obj.label12:setTop(15);
    obj.label12:setWidth(112);
    obj.label12:setHeight(50);
    obj.label12:setField("XP_t");
    obj.label12:setName("label12");
    obj.label12:setTextTrimming("none");
    obj.label12:setWordWrap(false);
    obj.label12:setAutoSize(true);
    obj.label12:setFontFamily("kalam");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle2);
    obj.layout116:setLeft(592);
    obj.layout116:setTop(1084);
    obj.layout116:setWidth(114);
    obj.layout116:setHeight(61);
    obj.layout116:setName("layout116");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout116);
    obj.label13:setFontSize(30);
    obj.label13:setFontColor("#000000");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("center");
    obj.label13:setLeft(30);
    obj.label13:setTop(15);
    obj.label13:setWidth(114);
    obj.label13:setHeight(62);
    obj.label13:setField("Exp_nUtil");
    obj.label13:setName("label13");
    obj.label13:setTextTrimming("none");
    obj.label13:setWordWrap(false);
    obj.label13:setAutoSize(true);
    obj.label13:setFontFamily("kalam");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle2);
    obj.dataLink8:setFields({'XP_t', 'XP_t_gasta'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle2);
    obj.dataLink9:setFields({'Satts', 'Sper', 'Scir', 'Svan', 'Saude_Extra', 'XP_Gasto_Adicional', 'ExpMoralidadeG' });
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle2);
    obj.dataLink10:setFields({'Saude_Extra'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle2);
    obj.dataLink11:setFields({'XPInicial', 'XPS1', 'XPS2', 'XPS3', 'XPS4', 'XPS5', 'XPS6', 'XPS7', 'XPS8', 'XPS9', 'XPS10', 'ExpExtraGanha'});
    obj.dataLink11:setName("dataLink11");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.rectangle2);
    obj.button70:setText("i");
    obj.button70:setWidth(20);
    obj.button70:setLeft(762);
    obj.button70:setTop(1035);
    obj.button70:setHeight(20);
    obj.button70:setName("button70");

    obj.PopExp = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopExp:setParent(obj.rectangle2);
    obj.PopExp:setName("PopExp");
    obj.PopExp:setWidth(360);
    obj.PopExp:setHeight(600);
    obj.PopExp:setBackOpacity(0.5);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.PopExp);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox3);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(20);
    obj.layout117:setName("layout117");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout117);
    obj.label14:setText("Exp Atributo:");
    obj.label14:setAlign("left");
    obj.label14:setWidth(50);
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setName("label14");
    obj.label14:setFontColor("black");
    obj.label14:setTextTrimming("none");
    obj.label14:setWordWrap(false);
    obj.label14:setAutoSize(true);
    obj.label14:setFontFamily("kalam");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout117);
    obj.label15:setField("Satts");
    obj.label15:setAlign("right");
    obj.label15:setHorzTextAlign("trailing");
    obj.label15:setWidth(50);
    obj.label15:setFontColor("#000000");
    obj.label15:setName("label15");
    obj.label15:setTextTrimming("none");
    obj.label15:setWordWrap(false);
    obj.label15:setAutoSize(true);
    obj.label15:setFontFamily("kalam");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox3);
    obj.layout118:setAlign("top");
    obj.layout118:setHeight(20);
    obj.layout118:setName("layout118");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout118);
    obj.label16:setText("Exp Pericia:");
    obj.label16:setAlign("left");
    obj.label16:setWidth(50);
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setFontColor("#696969");
    obj.label16:setName("label16");
    obj.label16:setTextTrimming("none");
    obj.label16:setWordWrap(false);
    obj.label16:setAutoSize(true);
    obj.label16:setFontFamily("kalam");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout118);
    obj.label17:setField("Sper");
    obj.label17:setAlign("right");
    obj.label17:setHorzTextAlign("trailing");
    obj.label17:setWidth(50);
    obj.label17:setFontColor("#696969");
    obj.label17:setName("label17");
    obj.label17:setTextTrimming("none");
    obj.label17:setWordWrap(false);
    obj.label17:setAutoSize(true);
    obj.label17:setFontFamily("kalam");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox3);
    obj.layout119:setAlign("top");
    obj.layout119:setHeight(20);
    obj.layout119:setName("layout119");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout119);
    obj.label18:setText("Exp Circunstancia:");
    obj.label18:setAlign("left");
    obj.label18:setWidth(50);
    obj.label18:setHorzTextAlign("trailing");
    obj.label18:setName("label18");
    obj.label18:setFontColor("black");
    obj.label18:setTextTrimming("none");
    obj.label18:setWordWrap(false);
    obj.label18:setAutoSize(true);
    obj.label18:setFontFamily("kalam");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout119);
    obj.label19:setField("Scir");
    obj.label19:setAlign("right");
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setWidth(50);
    obj.label19:setFontColor("#000000");
    obj.label19:setName("label19");
    obj.label19:setTextTrimming("none");
    obj.label19:setWordWrap(false);
    obj.label19:setAutoSize(true);
    obj.label19:setFontFamily("kalam");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox3);
    obj.layout120:setAlign("top");
    obj.layout120:setHeight(20);
    obj.layout120:setName("layout120");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout120);
    obj.label20:setText("Exp Van e Des:");
    obj.label20:setAlign("left");
    obj.label20:setWidth(50);
    obj.label20:setHorzTextAlign("trailing");
    obj.label20:setFontColor("#696969");
    obj.label20:setName("label20");
    obj.label20:setTextTrimming("none");
    obj.label20:setWordWrap(false);
    obj.label20:setAutoSize(true);
    obj.label20:setFontFamily("kalam");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout120);
    obj.label21:setField("Svan");
    obj.label21:setAlign("right");
    obj.label21:setHorzTextAlign("trailing");
    obj.label21:setWidth(50);
    obj.label21:setFontColor("#696969");
    obj.label21:setName("label21");
    obj.label21:setTextTrimming("none");
    obj.label21:setWordWrap(false);
    obj.label21:setAutoSize(true);
    obj.label21:setFontFamily("kalam");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox3);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(20);
    obj.layout121:setName("layout121");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout121);
    obj.label22:setText("Exp Saúde Extra:");
    obj.label22:setAlign("left");
    obj.label22:setWidth(50);
    obj.label22:setHorzTextAlign("trailing");
    obj.label22:setName("label22");
    obj.label22:setFontColor("black");
    obj.label22:setTextTrimming("none");
    obj.label22:setWordWrap(false);
    obj.label22:setAutoSize(true);
    obj.label22:setFontFamily("kalam");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout121);
    obj.label23:setField("ExpSaudeExtra");
    obj.label23:setAlign("right");
    obj.label23:setHorzTextAlign("trailing");
    obj.label23:setWidth(50);
    obj.label23:setFontColor("#000000");
    obj.label23:setName("label23");
    obj.label23:setTextTrimming("none");
    obj.label23:setWordWrap(false);
    obj.label23:setAutoSize(true);
    obj.label23:setFontFamily("kalam");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox3);
    obj.layout122:setAlign("top");
    obj.layout122:setHeight(20);
    obj.layout122:setName("layout122");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout122);
    obj.label24:setText("Exp Moralidade:");
    obj.label24:setAlign("left");
    obj.label24:setWidth(50);
    obj.label24:setHorzTextAlign("trailing");
    obj.label24:setFontColor("#696969");
    obj.label24:setName("label24");
    obj.label24:setTextTrimming("none");
    obj.label24:setWordWrap(false);
    obj.label24:setAutoSize(true);
    obj.label24:setFontFamily("kalam");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout122);
    obj.edit103:setField("ExpMoralidadeG");
    obj.edit103:setAlign("right");
    obj.edit103:setHorzTextAlign("trailing");
    obj.edit103:setWidth(300);
    obj.edit103:setTransparent(true);
    obj.edit103:setFontColor("#696969");
    obj.edit103:setName("edit103");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox3);
    obj.layout123:setAlign("top");
    obj.layout123:setHeight(20);
    obj.layout123:setName("layout123");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout123);
    obj.label25:setText("Exp Extra:");
    obj.label25:setAlign("left");
    obj.label25:setWidth(50);
    obj.label25:setHorzTextAlign("trailing");
    obj.label25:setFontColor("#696969");
    obj.label25:setName("label25");
    obj.label25:setTextTrimming("none");
    obj.label25:setWordWrap(false);
    obj.label25:setAutoSize(true);
    obj.label25:setFontFamily("kalam");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout123);
    obj.edit104:setField("ExpExtraGanha");
    obj.edit104:setAlign("right");
    obj.edit104:setHorzTextAlign("trailing");
    obj.edit104:setWidth(300);
    obj.edit104:setTransparent(true);
    obj.edit104:setFontColor("#696969");
    obj.edit104:setName("edit104");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox3);
    obj.layout124:setAlign("top");
    obj.layout124:setHeight(20);
    obj.layout124:setName("layout124");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout124);
    obj.label26:setText("...Exp Gasta");
    obj.label26:setAlign("right");
    obj.label26:setWidth(50);
    obj.label26:setHorzTextAlign("trailing");
    obj.label26:setFontColor("#C0504D");
    obj.label26:setName("label26");
    obj.label26:setTextTrimming("none");
    obj.label26:setWordWrap(false);
    obj.label26:setAutoSize(true);
    obj.label26:setFontFamily("kalam");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout124);
    obj.edit105:setField("XP_t_gasta");
    obj.edit105:setAlign("right");
    obj.edit105:setHorzTextAlign("trailing");
    obj.edit105:setWidth(50);
    obj.edit105:setTransparent(true);
    obj.edit105:setFontColor("#C0504D");
    obj.edit105:setName("edit105");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox3);
    obj.layout125:setAlign("top");
    obj.layout125:setHeight(20);
    obj.layout125:setName("layout125");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout125);
    obj.label27:setText("Exp Inicial:");
    obj.label27:setAlign("left");
    obj.label27:setWidth(50);
    obj.label27:setHorzTextAlign("trailing");
    obj.label27:setFontColor("#000000");
    obj.label27:setName("label27");
    obj.label27:setTextTrimming("none");
    obj.label27:setWordWrap(false);
    obj.label27:setAutoSize(true);
    obj.label27:setFontFamily("kalam");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout125);
    obj.edit106:setField("XPInicial");
    obj.edit106:setAlign("right");
    obj.edit106:setHorzTextAlign("trailing");
    obj.edit106:setWidth(300);
    obj.edit106:setTransparent(true);
    obj.edit106:setFontColor("#000000");
    obj.edit106:setName("edit106");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox3);
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(20);
    obj.layout126:setName("layout126");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout126);
    obj.label28:setText("Exp 1° Sessão:");
    obj.label28:setAlign("left");
    obj.label28:setWidth(50);
    obj.label28:setHorzTextAlign("trailing");
    obj.label28:setFontColor("#696969");
    obj.label28:setName("label28");
    obj.label28:setTextTrimming("none");
    obj.label28:setWordWrap(false);
    obj.label28:setAutoSize(true);
    obj.label28:setFontFamily("kalam");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout126);
    obj.edit107:setField("XPS1");
    obj.edit107:setAlign("right");
    obj.edit107:setHorzTextAlign("trailing");
    obj.edit107:setWidth(300);
    obj.edit107:setTransparent(true);
    obj.edit107:setFontColor("#696969");
    obj.edit107:setName("edit107");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox3);
    obj.layout127:setAlign("top");
    obj.layout127:setHeight(20);
    obj.layout127:setName("layout127");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout127);
    obj.label29:setText("Exp 2° Sessão:");
    obj.label29:setAlign("left");
    obj.label29:setWidth(50);
    obj.label29:setHorzTextAlign("trailing");
    obj.label29:setFontColor("#000000");
    obj.label29:setName("label29");
    obj.label29:setTextTrimming("none");
    obj.label29:setWordWrap(false);
    obj.label29:setAutoSize(true);
    obj.label29:setFontFamily("kalam");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout127);
    obj.edit108:setField("XPS2");
    obj.edit108:setAlign("right");
    obj.edit108:setHorzTextAlign("trailing");
    obj.edit108:setWidth(300);
    obj.edit108:setTransparent(true);
    obj.edit108:setFontColor("#000000");
    obj.edit108:setName("edit108");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox3);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(20);
    obj.layout128:setName("layout128");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout128);
    obj.label30:setText("Exp 3° Sessão:");
    obj.label30:setAlign("left");
    obj.label30:setWidth(50);
    obj.label30:setHorzTextAlign("trailing");
    obj.label30:setFontColor("#696969");
    obj.label30:setName("label30");
    obj.label30:setTextTrimming("none");
    obj.label30:setWordWrap(false);
    obj.label30:setAutoSize(true);
    obj.label30:setFontFamily("kalam");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout128);
    obj.edit109:setField("XPS3");
    obj.edit109:setAlign("right");
    obj.edit109:setHorzTextAlign("trailing");
    obj.edit109:setWidth(300);
    obj.edit109:setTransparent(true);
    obj.edit109:setFontColor("#696969");
    obj.edit109:setName("edit109");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.scrollBox3);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(20);
    obj.layout129:setName("layout129");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout129);
    obj.label31:setText("Exp 4° Sessão:");
    obj.label31:setAlign("left");
    obj.label31:setWidth(50);
    obj.label31:setHorzTextAlign("trailing");
    obj.label31:setFontColor("#000000");
    obj.label31:setName("label31");
    obj.label31:setTextTrimming("none");
    obj.label31:setWordWrap(false);
    obj.label31:setAutoSize(true);
    obj.label31:setFontFamily("kalam");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout129);
    obj.edit110:setField("XPS4");
    obj.edit110:setAlign("right");
    obj.edit110:setHorzTextAlign("trailing");
    obj.edit110:setWidth(300);
    obj.edit110:setTransparent(true);
    obj.edit110:setFontColor("#000000");
    obj.edit110:setName("edit110");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.scrollBox3);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(20);
    obj.layout130:setName("layout130");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout130);
    obj.label32:setText("Exp 5° Sessão:");
    obj.label32:setAlign("left");
    obj.label32:setWidth(50);
    obj.label32:setHorzTextAlign("trailing");
    obj.label32:setFontColor("#696969");
    obj.label32:setName("label32");
    obj.label32:setTextTrimming("none");
    obj.label32:setWordWrap(false);
    obj.label32:setAutoSize(true);
    obj.label32:setFontFamily("kalam");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout130);
    obj.edit111:setField("XPS5");
    obj.edit111:setAlign("right");
    obj.edit111:setHorzTextAlign("trailing");
    obj.edit111:setWidth(300);
    obj.edit111:setTransparent(true);
    obj.edit111:setFontColor("#696969");
    obj.edit111:setName("edit111");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.scrollBox3);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(20);
    obj.layout131:setName("layout131");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout131);
    obj.label33:setText("Exp 6° Sessão:");
    obj.label33:setAlign("left");
    obj.label33:setWidth(50);
    obj.label33:setHorzTextAlign("trailing");
    obj.label33:setFontColor("#000000");
    obj.label33:setName("label33");
    obj.label33:setTextTrimming("none");
    obj.label33:setWordWrap(false);
    obj.label33:setAutoSize(true);
    obj.label33:setFontFamily("kalam");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout131);
    obj.edit112:setField("XPS6");
    obj.edit112:setAlign("right");
    obj.edit112:setHorzTextAlign("trailing");
    obj.edit112:setWidth(300);
    obj.edit112:setTransparent(true);
    obj.edit112:setFontColor("#000000");
    obj.edit112:setName("edit112");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox3);
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(20);
    obj.layout132:setName("layout132");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout132);
    obj.label34:setText("Exp 7° Sessão:");
    obj.label34:setAlign("left");
    obj.label34:setWidth(50);
    obj.label34:setHorzTextAlign("trailing");
    obj.label34:setFontColor("#696969");
    obj.label34:setName("label34");
    obj.label34:setTextTrimming("none");
    obj.label34:setWordWrap(false);
    obj.label34:setAutoSize(true);
    obj.label34:setFontFamily("kalam");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout132);
    obj.edit113:setField("XPS7");
    obj.edit113:setAlign("right");
    obj.edit113:setHorzTextAlign("trailing");
    obj.edit113:setWidth(300);
    obj.edit113:setTransparent(true);
    obj.edit113:setFontColor("#696969");
    obj.edit113:setName("edit113");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.scrollBox3);
    obj.layout133:setAlign("top");
    obj.layout133:setHeight(20);
    obj.layout133:setName("layout133");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout133);
    obj.label35:setText("Exp 8° Sessão:");
    obj.label35:setAlign("left");
    obj.label35:setWidth(50);
    obj.label35:setHorzTextAlign("trailing");
    obj.label35:setFontColor("#000000");
    obj.label35:setName("label35");
    obj.label35:setTextTrimming("none");
    obj.label35:setWordWrap(false);
    obj.label35:setAutoSize(true);
    obj.label35:setFontFamily("kalam");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout133);
    obj.edit114:setField("XPS8");
    obj.edit114:setAlign("right");
    obj.edit114:setHorzTextAlign("trailing");
    obj.edit114:setWidth(300);
    obj.edit114:setTransparent(true);
    obj.edit114:setFontColor("#000000");
    obj.edit114:setName("edit114");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.scrollBox3);
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(20);
    obj.layout134:setName("layout134");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout134);
    obj.label36:setText("Exp 9° Sessão:");
    obj.label36:setAlign("left");
    obj.label36:setWidth(50);
    obj.label36:setHorzTextAlign("trailing");
    obj.label36:setFontColor("#696969");
    obj.label36:setName("label36");
    obj.label36:setTextTrimming("none");
    obj.label36:setWordWrap(false);
    obj.label36:setAutoSize(true);
    obj.label36:setFontFamily("kalam");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout134);
    obj.edit115:setField("XPS9");
    obj.edit115:setAlign("right");
    obj.edit115:setHorzTextAlign("trailing");
    obj.edit115:setWidth(300);
    obj.edit115:setTransparent(true);
    obj.edit115:setFontColor("#696969");
    obj.edit115:setName("edit115");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox3);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(20);
    obj.layout135:setName("layout135");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout135);
    obj.label37:setText("Exp 10° Sessão:");
    obj.label37:setAlign("left");
    obj.label37:setWidth(50);
    obj.label37:setHorzTextAlign("trailing");
    obj.label37:setFontColor("#000000");
    obj.label37:setName("label37");
    obj.label37:setTextTrimming("none");
    obj.label37:setWordWrap(false);
    obj.label37:setAutoSize(true);
    obj.label37:setFontFamily("kalam");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout135);
    obj.edit116:setField("XPS10");
    obj.edit116:setAlign("right");
    obj.edit116:setHorzTextAlign("trailing");
    obj.edit116:setWidth(300);
    obj.edit116:setTransparent(true);
    obj.edit116:setFontColor("#000000");
    obj.edit116:setName("edit116");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.scrollBox3);
    obj.layout136:setAlign("top");
    obj.layout136:setHeight(20);
    obj.layout136:setName("layout136");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout136);
    obj.label38:setText("...Exp Adquirida");
    obj.label38:setAlign("right");
    obj.label38:setWidth(50);
    obj.label38:setHorzTextAlign("trailing");
    obj.label38:setFontColor("#C0504D");
    obj.label38:setName("label38");
    obj.label38:setTextTrimming("none");
    obj.label38:setWordWrap(false);
    obj.label38:setAutoSize(true);
    obj.label38:setFontFamily("kalam");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout136);
    obj.edit117:setField("XP_t");
    obj.edit117:setAlign("right");
    obj.edit117:setHorzTextAlign("trailing");
    obj.edit117:setWidth(50);
    obj.edit117:setTransparent(true);
    obj.edit117:setFontColor("#C0504D");
    obj.edit117:setName("edit117");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle2);
    obj.dataLink12:setFields({'Peri01', 'Peri02', 'Peri03', 'Peri04', 'Peri05', 'Peri06', 'Peri07', 'Peri08', 'Peri09', 'Peri10', 'Peri11', 'Peri12', 'Peri13', 'Peri14', 'Peri15', 'Peri16', 'Peri17', 'Peri18', 'Peri19', 'Peri20', 'Peri21', 'Peri22', 'Peri23', 'Peri24', 'Peri25', 'Peri26', 'Peri27', 'Peri28', 'Peri29'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle2);
    obj.dataLink13:setFields({'CircXP_1', 'CircXP_2', 'CircXP_3', 'CircXP_4', 'CircXP_5', 'CircXP_6', 'CircXP_7 ', 'CircXP_8', 'CircXP_9', 'CircXP_10'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle2);
    obj.dataLink14:setFields({'VeD_01', 'VeD_02', 'VeD_03', 'VeD_04', 'VeD_05', 'VeD_06', 'VeD_07', 'VeD_08', 'VeD_09'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle2);
    obj.dataLink15:setFields({'FOR', 'DES', 'PRE', 'TAT', 'PER', 'INT', 'DET', 'SOR'});
    obj.dataLink15:setName("dataLink15");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle2);
    obj.layout137:setTop(200);
    obj.layout137:setLeft(920);
    obj.layout137:setWidth(250);
    obj.layout137:setHeight(700);
    obj.layout137:setName("layout137");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.layout137);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.scrollBox4);
    obj.button71:setHeight(25);
    obj.button71:setFontFamily("kalam");
    obj.button71:setText("+");
    obj.button71:setTop(5);
    obj.button71:setWidth(25);
    obj.button71:setLeft(35);
    obj.button71:setHint("Adiciona um novo ataque.");
    obj.button71:setName("button71");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.scrollBox4);
    obj.label39:setFontSize(25);
    obj.label39:setFontColor("#000000");
    obj.label39:setHorzTextAlign("leading");
    obj.label39:setVertTextAlign("trailing");
    obj.label39:setLeft(60);
    obj.label39:setTop(0);
    obj.label39:setWidth(170);
    obj.label39:setHeight(30);
    obj.label39:setText("ATAQUES");
    obj.label39:setFontFamily("DK Umbilical Noose");
    obj.label39:setName("label39");
    obj.label39:setTextTrimming("none");
    obj.label39:setWordWrap(false);
    obj.label39:setAutoSize(true);

    obj.rclAtaque = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaque:setParent(obj.scrollBox4);
    obj.rclAtaque:setName("rclAtaque");
    obj.rclAtaque:setField("Ataque");
    obj.rclAtaque:setTemplateForm("Ataque");
    obj.rclAtaque:setTop(50);
    obj.rclAtaque:setWidth(230);
    obj.rclAtaque:setHeight(600);
    obj.rclAtaque:setAutoHeight(true);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setWidth(200);
    obj.rectangle3:setHeight(300);
    obj.rectangle3:setTop(950);
    obj.rectangle3:setLeft(950);
    obj.rectangle3:setColor("#00000000");
    obj.rectangle3:setName("rectangle3");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle3);
    obj.label40:setFontSize(25);
    obj.label40:setFontColor("#000000");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("center");
    obj.label40:setWidth(200);
    obj.label40:setHeight(30);
    obj.label40:setLeft(30);
    obj.label40:setText("ARMADURA");
    obj.label40:setFontFamily("DK Umbilical Noose");
    obj.label40:setName("label40");
    obj.label40:setTextTrimming("none");
    obj.label40:setWordWrap(false);
    obj.label40:setAutoSize(true);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setTop(32);
    obj.rectangle4:setLeft(1);
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setHeight(30);
    lfm_setPropAsString(obj.rectangle4, "sides",  "bottom");
    obj.rectangle4:setColor("#00000000");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle3);
    obj.edit118:setWidth(200);
    obj.edit118:setField("ARMADURA_nick");
    obj.edit118:setHeight(40);
    obj.edit118:setTop(32);
    obj.edit118:setLeft(1);
    obj.edit118:setName("edit118");
    obj.edit118:setFontColor("#C0504D");
    obj.edit118:setFontSize(20);
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setVertTextAlign("leading");
    lfm_setPropAsString(obj.edit118, "fontStyle",  "bold");
    obj.edit118:setFontFamily("kalam");
    obj.edit118:setTransparent(true);

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle3);
    obj.label41:setText("Torso");
    obj.label41:setWidth(50);
    obj.label41:setHeight(30);
    obj.label41:setTop(80);
    obj.label41:setLeft(1);
    obj.label41:setName("label41");
    obj.label41:setFontColor("black");
    obj.label41:setTextTrimming("none");
    obj.label41:setWordWrap(false);
    obj.label41:setAutoSize(true);
    obj.label41:setFontFamily("kalam");
    obj.label41:setFontSize(15);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle3);
    obj.rectangle5:setTop(80);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setLeft(60);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setColor("#00000000");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setXradius(8);
    obj.rectangle5:setYradius(8);

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle5);
    obj.edit119:setField("ARMADURA_TorsoA");
    obj.edit119:setWidth(45);
    obj.edit119:setHeight(30);
    obj.edit119:setName("edit119");
    obj.edit119:setFontColor("#C0504D");
    obj.edit119:setFontSize(18);
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit119, "fontStyle",  "bold");
    obj.edit119:setFontFamily("kalam");
    obj.edit119:setTransparent(true);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle5);
    obj.label42:setText("/");
    obj.label42:setWidth(10);
    obj.label42:setHeight(30);
    obj.label42:setTop(3);
    obj.label42:setLeft(46);
    obj.label42:setName("label42");
    obj.label42:setFontColor("black");
    obj.label42:setTextTrimming("none");
    obj.label42:setWordWrap(false);
    obj.label42:setAutoSize(true);
    obj.label42:setFontFamily("kalam");
    obj.label42:setFontSize(15);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle5);
    obj.edit120:setField("ARMADURA_TorsoB");
    obj.edit120:setWidth(45);
    obj.edit120:setHeight(30);
    obj.edit120:setLeft(46);
    obj.edit120:setName("edit120");
    obj.edit120:setFontColor("#C0504D");
    obj.edit120:setFontSize(18);
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit120, "fontStyle",  "bold");
    obj.edit120:setFontFamily("kalam");
    obj.edit120:setTransparent(true);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle3);
    obj.label43:setText("CD");
    obj.label43:setWidth(50);
    obj.label43:setHeight(30);
    obj.label43:setTop(65);
    obj.label43:setLeft(165);
    obj.label43:setFontSize(10);
    obj.label43:setName("label43");
    obj.label43:setFontColor("black");
    obj.label43:setTextTrimming("none");
    obj.label43:setWordWrap(false);
    obj.label43:setAutoSize(true);
    obj.label43:setFontFamily("kalam");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setVertTextAlign("center");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle3);
    obj.rectangle6:setTop(80);
    obj.rectangle6:setLeft(150);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setColor("#00000000");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setXradius(8);
    obj.rectangle6:setYradius(8);

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle6);
    obj.edit121:setField("ARMADURA_TorsoCD");
    obj.edit121:setWidth(40);
    obj.edit121:setHeight(30);
    obj.edit121:setName("edit121");
    obj.edit121:setFontColor("#C0504D");
    obj.edit121:setFontSize(18);
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit121, "fontStyle",  "bold");
    obj.edit121:setFontFamily("kalam");
    obj.edit121:setType("number");
    obj.edit121:setTransparent(true);

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.rectangle3);
    obj.button72:setLeft(190);
    obj.button72:setTop(85);
    obj.button72:setWidth(14);
    obj.button72:setHeight(14);
    obj.button72:setText("R");
    obj.button72:setHint("Desc... ");
    obj.button72:setName("button72");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.rectangle3);
    obj.image56:setWidth(17);
    obj.image56:setHeight(17);
    obj.image56:setLeft(189);
    obj.image56:setTop(85);
    obj.image56:setStyle("proportional");
    obj.image56:setCenter(true);
    obj.image56:setSRC("images/Dado.jpg");
    obj.image56:setName("image56");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle3);
    obj.label44:setText("Cabeça");
    obj.label44:setWidth(50);
    obj.label44:setHeight(30);
    obj.label44:setTop(120);
    obj.label44:setLeft(1);
    obj.label44:setName("label44");
    obj.label44:setFontColor("black");
    obj.label44:setTextTrimming("none");
    obj.label44:setWordWrap(false);
    obj.label44:setAutoSize(true);
    obj.label44:setFontFamily("kalam");
    obj.label44:setFontSize(15);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("center");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle3);
    obj.rectangle7:setTop(120);
    obj.rectangle7:setLeft(60);
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setColor("#00000000");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setXradius(8);
    obj.rectangle7:setYradius(8);

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle7);
    obj.edit122:setField("ARMADURA_CabecaA");
    obj.edit122:setWidth(45);
    obj.edit122:setHeight(30);
    obj.edit122:setName("edit122");
    obj.edit122:setFontColor("#C0504D");
    obj.edit122:setFontSize(18);
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit122, "fontStyle",  "bold");
    obj.edit122:setFontFamily("kalam");
    obj.edit122:setTransparent(true);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle7);
    obj.label45:setText("/");
    obj.label45:setWidth(10);
    obj.label45:setHeight(30);
    obj.label45:setTop(3);
    obj.label45:setLeft(46);
    obj.label45:setName("label45");
    obj.label45:setFontColor("black");
    obj.label45:setTextTrimming("none");
    obj.label45:setWordWrap(false);
    obj.label45:setAutoSize(true);
    obj.label45:setFontFamily("kalam");
    obj.label45:setFontSize(15);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle7);
    obj.edit123:setField("ARMADURA_CabecaB");
    obj.edit123:setWidth(45);
    obj.edit123:setLeft(46);
    obj.edit123:setHeight(30);
    obj.edit123:setName("edit123");
    obj.edit123:setFontColor("#C0504D");
    obj.edit123:setFontSize(18);
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit123, "fontStyle",  "bold");
    obj.edit123:setFontFamily("kalam");
    obj.edit123:setTransparent(true);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle3);
    obj.label46:setText("CD");
    obj.label46:setWidth(50);
    obj.label46:setHeight(30);
    obj.label46:setTop(108);
    obj.label46:setFontSize(10);
    obj.label46:setLeft(165);
    obj.label46:setName("label46");
    obj.label46:setFontColor("black");
    obj.label46:setTextTrimming("none");
    obj.label46:setWordWrap(false);
    obj.label46:setAutoSize(true);
    obj.label46:setFontFamily("kalam");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle3);
    obj.rectangle8:setTop(120);
    obj.rectangle8:setLeft(150);
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setColor("#00000000");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setXradius(8);
    obj.rectangle8:setYradius(8);

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle8);
    obj.edit124:setField("ARMADURA_CabecaCD");
    obj.edit124:setWidth(40);
    obj.edit124:setHeight(30);
    obj.edit124:setName("edit124");
    obj.edit124:setFontColor("#C0504D");
    obj.edit124:setFontSize(18);
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit124, "fontStyle",  "bold");
    obj.edit124:setFontFamily("kalam");
    obj.edit124:setType("number");
    obj.edit124:setTransparent(true);

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.rectangle3);
    obj.button73:setLeft(190);
    obj.button73:setTop(125);
    obj.button73:setWidth(14);
    obj.button73:setHeight(14);
    obj.button73:setText("R");
    obj.button73:setHint("Desc... ");
    obj.button73:setName("button73");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.rectangle3);
    obj.image57:setWidth(17);
    obj.image57:setHeight(17);
    obj.image57:setLeft(189);
    obj.image57:setTop(125);
    obj.image57:setStyle("proportional");
    obj.image57:setCenter(true);
    obj.image57:setSRC("images/Dado.jpg");
    obj.image57:setName("image57");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle3);
    obj.edit125:setText("Outro");
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(30);
    obj.edit125:setTop(160);
    obj.edit125:setLeft(1);
    obj.edit125:setTransparent(true);
    obj.edit125:setName("edit125");
    obj.edit125:setFontColor("#000000");
    obj.edit125:setFontSize(15);
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setFontFamily("kalam");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle3);
    obj.rectangle9:setTop(160);
    obj.rectangle9:setLeft(60);
    obj.rectangle9:setWidth(100);
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setColor("#00000000");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setXradius(8);
    obj.rectangle9:setYradius(8);

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle9);
    obj.edit126:setField("ARMADURA_OutroA");
    obj.edit126:setWidth(45);
    obj.edit126:setHeight(30);
    obj.edit126:setName("edit126");
    obj.edit126:setFontColor("#C0504D");
    obj.edit126:setFontSize(18);
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit126, "fontStyle",  "bold");
    obj.edit126:setFontFamily("kalam");
    obj.edit126:setTransparent(true);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle9);
    obj.label47:setText("/");
    obj.label47:setWidth(10);
    obj.label47:setHeight(30);
    obj.label47:setTop(3);
    obj.label47:setLeft(46);
    obj.label47:setName("label47");
    obj.label47:setFontColor("black");
    obj.label47:setTextTrimming("none");
    obj.label47:setWordWrap(false);
    obj.label47:setAutoSize(true);
    obj.label47:setFontFamily("kalam");
    obj.label47:setFontSize(15);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle9);
    obj.edit127:setField("ARMADURA_OutroB");
    obj.edit127:setWidth(45);
    obj.edit127:setLeft(46);
    obj.edit127:setHeight(30);
    obj.edit127:setName("edit127");
    obj.edit127:setFontColor("#C0504D");
    obj.edit127:setFontSize(18);
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit127, "fontStyle",  "bold");
    obj.edit127:setFontFamily("kalam");
    obj.edit127:setTransparent(true);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle3);
    obj.label48:setText("CD");
    obj.label48:setWidth(50);
    obj.label48:setHeight(30);
    obj.label48:setTop(148);
    obj.label48:setLeft(165);
    obj.label48:setFontSize(10);
    obj.label48:setName("label48");
    obj.label48:setFontColor("black");
    obj.label48:setTextTrimming("none");
    obj.label48:setWordWrap(false);
    obj.label48:setAutoSize(true);
    obj.label48:setFontFamily("kalam");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setVertTextAlign("center");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle3);
    obj.rectangle10:setTop(160);
    obj.rectangle10:setLeft(150);
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setColor("#00000000");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setXradius(8);
    obj.rectangle10:setYradius(8);

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.rectangle10);
    obj.edit128:setField("ARMADURA_OutroCD");
    obj.edit128:setWidth(40);
    obj.edit128:setHeight(30);
    obj.edit128:setName("edit128");
    obj.edit128:setFontColor("#C0504D");
    obj.edit128:setFontSize(18);
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit128, "fontStyle",  "bold");
    obj.edit128:setFontFamily("kalam");
    obj.edit128:setType("number");
    obj.edit128:setTransparent(true);

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.rectangle3);
    obj.button74:setLeft(190);
    obj.button74:setTop(165);
    obj.button74:setWidth(14);
    obj.button74:setHeight(14);
    obj.button74:setText("R");
    obj.button74:setHint("Desc... ");
    obj.button74:setName("button74");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.rectangle3);
    obj.image58:setWidth(17);
    obj.image58:setHeight(17);
    obj.image58:setLeft(189);
    obj.image58:setTop(165);
    obj.image58:setStyle("proportional");
    obj.image58:setCenter(true);
    obj.image58:setSRC("images/Dado.jpg");
    obj.image58:setName("image58");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle3);
    obj.label49:setText("Movimento");
    obj.label49:setWidth(50);
    obj.label49:setHeight(30);
    obj.label49:setTop(200);
    obj.label49:setLeft(5);
    obj.label49:setFontSize(15);
    obj.label49:setName("label49");
    obj.label49:setFontColor("black");
    obj.label49:setTextTrimming("none");
    obj.label49:setWordWrap(false);
    obj.label49:setAutoSize(true);
    obj.label49:setFontFamily("kalam");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setVertTextAlign("center");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle3);
    obj.rectangle11:setTop(200);
    obj.rectangle11:setLeft(80);
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setColor("#00000000");
    obj.rectangle11:setStrokeColor("red");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setXradius(8);
    obj.rectangle11:setYradius(8);

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.rectangle11);
    obj.edit129:setField("PenalidadeMovimento");
    obj.edit129:setWidth(40);
    obj.edit129:setHeight(30);
    obj.edit129:setName("edit129");
    obj.edit129:setFontColor("#C0504D");
    obj.edit129:setFontSize(18);
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit129, "fontStyle",  "bold");
    obj.edit129:setFontFamily("kalam");
    obj.edit129:setType("number");
    obj.edit129:setTransparent(true);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle3);
    obj.label50:setText("Percepção");
    obj.label50:setWidth(50);
    obj.label50:setHeight(30);
    obj.label50:setTop(200);
    obj.label50:setLeft(130);
    obj.label50:setFontSize(15);
    obj.label50:setName("label50");
    obj.label50:setFontColor("black");
    obj.label50:setTextTrimming("none");
    obj.label50:setWordWrap(false);
    obj.label50:setAutoSize(true);
    obj.label50:setFontFamily("kalam");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle3);
    obj.rectangle12:setTop(200);
    obj.rectangle12:setLeft(200);
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setColor("#00000000");
    obj.rectangle12:setStrokeColor("red");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setXradius(8);
    obj.rectangle12:setYradius(8);

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.rectangle12);
    obj.edit130:setField("PenalidadedePercepcao");
    obj.edit130:setWidth(40);
    obj.edit130:setHeight(30);
    obj.edit130:setName("edit130");
    obj.edit130:setFontColor("#C0504D");
    obj.edit130:setFontSize(18);
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit130, "fontStyle",  "bold");
    obj.edit130:setFontFamily("kalam");
    obj.edit130:setType("number");
    obj.edit130:setTransparent(true);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle2);
    obj.label51:setText("Mochila");
    obj.label51:setWidth(50);
    obj.label51:setHeight(30);
    obj.label51:setTop(180);
    obj.label51:setLeft(1225);
    obj.label51:setFontSize(15);
    obj.label51:setName("label51");
    obj.label51:setFontColor("black");
    obj.label51:setTextTrimming("none");
    obj.label51:setWordWrap(false);
    obj.label51:setAutoSize(true);
    obj.label51:setFontFamily("kalam");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setVertTextAlign("center");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.rectangle2);
    obj.button75:setWidth(100);
    obj.button75:setHeight(100);
    obj.button75:setLeft(1200);
    obj.button75:setTop(200);
    obj.button75:setName("button75");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.rectangle2);
    obj.image59:setWidth(100);
    obj.image59:setHeight(100);
    obj.image59:setLeft(1200);
    obj.image59:setTop(200);
    obj.image59:setStyle("proportional");
    obj.image59:setCenter(true);
    obj.image59:setSRC("images/Mochila.png");
    obj.image59:setName("image59");

    obj.PopInventario = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopInventario:setParent(obj.rectangle2);
    obj.PopInventario:setName("PopInventario");
    obj.PopInventario:setWidth(450);
    obj.PopInventario:setHeight(600);
    obj.PopInventario:setBackOpacity(0.5);

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.PopInventario);
    obj.textEditor21:setField("InventarioE");
    obj.textEditor21:setName("textEditor21");
    obj.textEditor21:setFontColor("#C0504D");
    obj.textEditor21:setFontSize(15);
    obj.textEditor21:setHorzTextAlign("leading");
    obj.textEditor21:setFontFamily("kalam");
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setAlign("client");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.PopInventario);
    obj.rectangle13:setWidth(450);
    obj.rectangle13:setHeight(600);
    obj.rectangle13:setColor("white");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle13);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.scrollBox5);
    obj.label52:setFontSize(25);
    obj.label52:setFontColor("#000000");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("center");
    obj.label52:setWidth(200);
    obj.label52:setLeft(125);
    obj.label52:setHeight(30);
    obj.label52:setText("EQUIPAMENTOS");
    obj.label52:setFontFamily("DK Umbilical Noose");
    obj.label52:setName("label52");
    obj.label52:setTextTrimming("none");
    obj.label52:setWordWrap(false);
    obj.label52:setAutoSize(true);

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.scrollBox5);
    obj.button76:setLeft(10);
    obj.button76:setTop(50);
    obj.button76:setHeight(25);
    obj.button76:setText("Novo Item");
    obj.button76:setWidth(80);
    obj.button76:setName("button76");

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.scrollBox5);
    obj.image60:setWidth(50);
    obj.image60:setHeight(50);
    obj.image60:setLeft(180);
    obj.image60:setTop(40);
    obj.image60:setStyle("proportional");
    obj.image60:setCenter(true);
    obj.image60:setSRC("images/Mochila.png");
    obj.image60:setName("image60");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox5);
    obj.rectangle14:setTop(60);
    obj.rectangle14:setLeft(300);
    obj.rectangle14:setWidth(100);
    lfm_setPropAsString(obj.rectangle14, "sides",  "bottom");
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setColor("#00000000");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setXradius(8);
    obj.rectangle14:setYradius(8);

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.rectangle14);
    obj.edit131:setField("PesoA");
    obj.edit131:setWidth(45);
    obj.edit131:setHeight(30);
    obj.edit131:setFontColor("black");
    obj.edit131:setName("edit131");
    obj.edit131:setFontSize(18);
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit131, "fontStyle",  "bold");
    obj.edit131:setFontFamily("kalam");
    obj.edit131:setTransparent(true);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle14);
    obj.label53:setText("/");
    obj.label53:setWidth(10);
    obj.label53:setHeight(30);
    obj.label53:setTop(3);
    obj.label53:setLeft(46);
    obj.label53:setName("label53");
    obj.label53:setFontColor("black");
    obj.label53:setTextTrimming("none");
    obj.label53:setWordWrap(false);
    obj.label53:setAutoSize(true);
    obj.label53:setFontFamily("kalam");
    obj.label53:setFontSize(15);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.rectangle14);
    obj.edit132:setField("PesoB");
    obj.edit132:setWidth(45);
    obj.edit132:setLeft(48);
    obj.edit132:setHeight(30);
    obj.edit132:setFontColor("black");
    obj.edit132:setName("edit132");
    obj.edit132:setFontSize(18);
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit132, "fontStyle",  "bold");
    obj.edit132:setFontFamily("kalam");
    obj.edit132:setTransparent(true);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle2);
    obj.label54:setText("Transporte");
    obj.label54:setWidth(50);
    obj.label54:setHeight(30);
    obj.label54:setTop(570);
    obj.label54:setLeft(1220);
    obj.label54:setFontSize(15);
    obj.label54:setName("label54");
    obj.label54:setFontColor("black");
    obj.label54:setTextTrimming("none");
    obj.label54:setWordWrap(false);
    obj.label54:setAutoSize(true);
    obj.label54:setFontFamily("kalam");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("center");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.rectangle2);
    obj.button77:setWidth(100);
    obj.button77:setHeight(100);
    obj.button77:setLeft(1200);
    obj.button77:setTop(590);
    obj.button77:setName("button77");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.rectangle2);
    obj.image61:setWidth(100);
    obj.image61:setHeight(100);
    obj.image61:setLeft(1200);
    obj.image61:setTop(590);
    obj.image61:setStyle("proportional");
    obj.image61:setCenter(true);
    obj.image61:setSRC("images/Carro.png");
    obj.image61:setName("image61");

    obj.PopCar = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopCar:setParent(obj.rectangle2);
    obj.PopCar:setName("PopCar");
    obj.PopCar:setWidth(1010);
    obj.PopCar:setHeight(650);
    obj.PopCar:setBackOpacity(0.5);

    obj.frmCAR = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCAR:setParent(obj.PopCar);
    obj.frmCAR:setName("frmCAR");
    obj.frmCAR:setHeight(650);
    obj.frmCAR:setWidth(1010);
    obj.frmCAR:setTheme("light");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.frmCAR);
    obj.rectangle15:setWidth(1010);
    obj.rectangle15:setHeight(650);
    obj.rectangle15:setColor("white");
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setXradius(8);
    obj.rectangle15:setYradius(8);
    obj.rectangle15:setName("rectangle15");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle15);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.scrollBox6);
    obj.layout138:setLeft(0);
    obj.layout138:setTop(0);
    obj.layout138:setWidth(500);
    obj.layout138:setHeight(650);
    obj.layout138:setName("layout138");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.layout138);
    obj.image62:setWidth(500);
    obj.image62:setHeight(400);
    obj.image62:setLeft(0);
    obj.image62:setTop(0);
    obj.image62:setStyle("proportional");
    obj.image62:setCenter(true);
    obj.image62:setSRC("images/FichaCAR.png");
    obj.image62:setName("image62");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout138);
    obj.label55:setText("VEICULO");
    obj.label55:setFontSize(30);
    obj.label55:setWidth(200);
    obj.label55:setHeight(30);
    obj.label55:setTop(45);
    obj.label55:setLeft(70);
    obj.label55:setName("label55");
    obj.label55:setFontColor("black");
    obj.label55:setTextTrimming("none");
    obj.label55:setWordWrap(false);
    obj.label55:setAutoSize(true);
    obj.label55:setFontFamily("kalam");
    obj.label55:setHorzTextAlign("leading");
    obj.label55:setVertTextAlign("center");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout138);
    obj.edit133:setField("Conducao_Nick");
    obj.edit133:setWidth(250);
    obj.edit133:setHorzTextAlign("leading");
    obj.edit133:setFontSize(30);
    lfm_setPropAsString(obj.edit133, "fontStyle",  "bold");
    obj.edit133:setHeight(40);
    obj.edit133:setTop(50);
    obj.edit133:setLeft(190);
    obj.edit133:setName("edit133");
    obj.edit133:setFontColor("#C0504D");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setFontFamily("kalam");
    obj.edit133:setTransparent(true);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout138);
    obj.label56:setText("Manobra");
    obj.label56:setFontSize(20);
    obj.label56:setWidth(60);
    obj.label56:setHeight(30);
    obj.label56:setTop(110);
    obj.label56:setLeft(70);
    obj.label56:setName("label56");
    obj.label56:setFontColor("black");
    obj.label56:setTextTrimming("none");
    obj.label56:setWordWrap(false);
    obj.label56:setAutoSize(true);
    obj.label56:setFontFamily("kalam");
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setVertTextAlign("center");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout138);
    obj.edit134:setField("Conducao_Manobra");
    obj.edit134:setWidth(30);
    obj.edit134:setHeight(30);
    obj.edit134:setTop(110);
    obj.edit134:setLeft(170);
    obj.edit134:setName("edit134");
    obj.edit134:setFontSize(20);
    obj.edit134:setFontColor("#C0504D");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setFontFamily("kalam");
    obj.edit134:setTransparent(true);

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout138);
    obj.label57:setText("Blindagem");
    obj.label57:setFontSize(20);
    obj.label57:setFontColor("black");
    obj.label57:setWidth(60);
    obj.label57:setHeight(30);
    obj.label57:setTop(145);
    obj.label57:setLeft(55);
    obj.label57:setName("label57");
    obj.label57:setTextTrimming("none");
    obj.label57:setWordWrap(false);
    obj.label57:setAutoSize(true);
    obj.label57:setFontFamily("kalam");
    obj.label57:setHorzTextAlign("leading");
    obj.label57:setVertTextAlign("center");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout138);
    obj.edit135:setField("Conducao_Blindagem");
    obj.edit135:setWidth(30);
    obj.edit135:setHeight(30);
    obj.edit135:setTop(145);
    obj.edit135:setLeft(170);
    obj.edit135:setName("edit135");
    obj.edit135:setFontSize(20);
    obj.edit135:setFontColor("#C0504D");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setFontFamily("kalam");
    obj.edit135:setTransparent(true);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout138);
    obj.label58:setText("Capacidade");
    obj.label58:setFontSize(20);
    obj.label58:setWidth(60);
    obj.label58:setHeight(30);
    obj.label58:setTop(178);
    obj.label58:setLeft(51);
    obj.label58:setName("label58");
    obj.label58:setFontColor("black");
    obj.label58:setTextTrimming("none");
    obj.label58:setWordWrap(false);
    obj.label58:setAutoSize(true);
    obj.label58:setFontFamily("kalam");
    obj.label58:setHorzTextAlign("leading");
    obj.label58:setVertTextAlign("center");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout138);
    obj.edit136:setField("Conducao_Capacidade");
    obj.edit136:setWidth(30);
    obj.edit136:setHeight(30);
    obj.edit136:setTop(175);
    obj.edit136:setLeft(170);
    obj.edit136:setName("edit136");
    obj.edit136:setFontSize(20);
    obj.edit136:setFontColor("#C0504D");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setFontFamily("kalam");
    obj.edit136:setTransparent(true);

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout138);
    obj.label59:setText("CD");
    obj.label59:setFontSize(20);
    obj.label59:setFontColor("black");
    obj.label59:setWidth(60);
    obj.label59:setHeight(30);
    obj.label59:setTop(207);
    obj.label59:setLeft(100);
    obj.label59:setName("label59");
    obj.label59:setTextTrimming("none");
    obj.label59:setWordWrap(false);
    obj.label59:setAutoSize(true);
    obj.label59:setFontFamily("kalam");
    obj.label59:setHorzTextAlign("leading");
    obj.label59:setVertTextAlign("center");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout138);
    obj.edit137:setField("Conducao_CD");
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(30);
    obj.edit137:setTop(207);
    obj.edit137:setLeft(170);
    obj.edit137:setName("edit137");
    obj.edit137:setFontSize(20);
    obj.edit137:setFontColor("#C0504D");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setFontFamily("kalam");
    obj.edit137:setTransparent(true);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout138);
    obj.label60:setText("Integridade");
    obj.label60:setFontSize(20);
    obj.label60:setWidth(80);
    obj.label60:setHeight(30);
    obj.label60:setTop(100);
    obj.label60:setLeft(230);
    obj.label60:setName("label60");
    obj.label60:setFontColor("black");
    obj.label60:setTextTrimming("none");
    obj.label60:setWordWrap(false);
    obj.label60:setAutoSize(true);
    obj.label60:setFontFamily("kalam");
    obj.label60:setHorzTextAlign("leading");
    obj.label60:setVertTextAlign("center");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout138);
    obj.edit138:setField("Conducao_Integridade1");
    obj.edit138:setWidth(30);
    obj.edit138:setHeight(30);
    obj.edit138:setTop(142);
    obj.edit138:setLeft(240);
    obj.edit138:setName("edit138");
    obj.edit138:setFontSize(20);
    obj.edit138:setFontColor("#C0504D");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setFontFamily("kalam");
    obj.edit138:setTransparent(true);

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout138);
    obj.edit139:setField("Conducao_Integridade2");
    obj.edit139:setWidth(30);
    obj.edit139:setHeight(30);
    obj.edit139:setTop(142);
    obj.edit139:setLeft(275);
    obj.edit139:setName("edit139");
    obj.edit139:setFontSize(20);
    obj.edit139:setFontColor("#C0504D");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setFontFamily("kalam");
    obj.edit139:setTransparent(true);

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout138);
    obj.edit140:setField("Conducao_Integridade3");
    obj.edit140:setWidth(30);
    obj.edit140:setHeight(30);
    obj.edit140:setTop(142);
    obj.edit140:setLeft(310);
    obj.edit140:setName("edit140");
    obj.edit140:setFontSize(20);
    obj.edit140:setFontColor("#C0504D");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setFontFamily("kalam");
    obj.edit140:setTransparent(true);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout138);
    obj.label61:setText("Gasolina");
    obj.label61:setFontSize(20);
    obj.label61:setFontColor("black");
    obj.label61:setWidth(80);
    obj.label61:setHeight(30);
    obj.label61:setTop(100);
    obj.label61:setLeft(370);
    obj.label61:setName("label61");
    obj.label61:setTextTrimming("none");
    obj.label61:setWordWrap(false);
    obj.label61:setAutoSize(true);
    obj.label61:setFontFamily("kalam");
    obj.label61:setHorzTextAlign("leading");
    obj.label61:setVertTextAlign("center");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout138);
    obj.edit141:setField("Conducao_Gasolina1");
    obj.edit141:setWidth(30);
    obj.edit141:setHeight(30);
    obj.edit141:setTop(142);
    obj.edit141:setLeft(370);
    obj.edit141:setName("edit141");
    obj.edit141:setFontSize(20);
    obj.edit141:setFontColor("#C0504D");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setFontFamily("kalam");
    obj.edit141:setTransparent(true);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout138);
    obj.label62:setText("Perm");
    obj.label62:setFontSize(10);
    obj.label62:setFontColor("#C0C0C0");
    obj.label62:setWidth(30);
    obj.label62:setHeight(45);
    obj.label62:setTop(130);
    obj.label62:setLeft(375);
    obj.label62:setName("label62");
    obj.label62:setTextTrimming("none");
    obj.label62:setWordWrap(false);
    obj.label62:setAutoSize(true);
    obj.label62:setFontFamily("kalam");
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setVertTextAlign("center");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout138);
    obj.edit142:setField("Conducao_Gasolina2");
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(30);
    obj.edit142:setTop(142);
    obj.edit142:setLeft(425);
    obj.edit142:setName("edit142");
    obj.edit142:setFontSize(20);
    obj.edit142:setFontColor("#C0504D");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setFontFamily("kalam");
    obj.edit142:setTransparent(true);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout138);
    obj.label63:setText("Temp");
    obj.label63:setFontSize(10);
    obj.label63:setFontColor("#C0C0C0");
    obj.label63:setWidth(30);
    obj.label63:setHeight(45);
    obj.label63:setTop(130);
    obj.label63:setLeft(430);
    obj.label63:setName("label63");
    obj.label63:setTextTrimming("none");
    obj.label63:setWordWrap(false);
    obj.label63:setAutoSize(true);
    obj.label63:setFontFamily("kalam");
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setVertTextAlign("center");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout138);
    obj.label64:setText("Equipamentos:");
    obj.label64:setFontSize(20);
    obj.label64:setWidth(80);
    obj.label64:setHeight(30);
    obj.label64:setTop(178);
    obj.label64:setLeft(230);
    obj.label64:setName("label64");
    obj.label64:setFontColor("black");
    obj.label64:setTextTrimming("none");
    obj.label64:setWordWrap(false);
    obj.label64:setAutoSize(true);
    obj.label64:setFontFamily("kalam");
    obj.label64:setHorzTextAlign("leading");
    obj.label64:setVertTextAlign("center");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout138);
    obj.layout139:setLeft(230);
    obj.layout139:setTop(208);
    obj.layout139:setWidth(230);
    obj.layout139:setHeight(160);
    obj.layout139:setName("layout139");

    obj.Conducao_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Equipamentos:setParent(obj.layout139);
    obj.Conducao_Equipamentos:setName("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setFontFamily("kalam");
    obj.Conducao_Equipamentos:setWidth(230);
    obj.Conducao_Equipamentos:setHeight(160);
    obj.Conducao_Equipamentos:setFontSize(15);
    obj.Conducao_Equipamentos:setFontColor("#548DD4");
    obj.Conducao_Equipamentos:setField("Conducao_Equipamentos");
    obj.Conducao_Equipamentos:setTransparent(true);

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout138);
    obj.label65:setText("Circunstancia:");
    obj.label65:setFontSize(20);
    obj.label65:setWidth(80);
    obj.label65:setHeight(30);
    obj.label65:setTop(260);
    obj.label65:setLeft(40);
    obj.label65:setName("label65");
    obj.label65:setFontColor("black");
    obj.label65:setTextTrimming("none");
    obj.label65:setWordWrap(false);
    obj.label65:setAutoSize(true);
    obj.label65:setFontFamily("kalam");
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setVertTextAlign("center");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout138);
    obj.layout140:setLeft(25);
    obj.layout140:setTop(290);
    obj.layout140:setWidth(200);
    obj.layout140:setHeight(78);
    obj.layout140:setName("layout140");

    obj.Conducao_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao_Circunstancia:setParent(obj.layout140);
    obj.Conducao_Circunstancia:setName("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setFontFamily("kalam");
    obj.Conducao_Circunstancia:setWidth(200);
    obj.Conducao_Circunstancia:setHeight(80);
    obj.Conducao_Circunstancia:setFontSize(15);
    obj.Conducao_Circunstancia:setFontColor("#548DD4");
    obj.Conducao_Circunstancia:setField("Conducao_Circunstancia");
    obj.Conducao_Circunstancia:setTransparent(true);

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.layout138);
    obj.image63:setWidth(500);
    obj.image63:setHeight(250);
    obj.image63:setLeft(0);
    obj.image63:setTop(385);
    obj.image63:setStyle("proportional");
    obj.image63:setCenter(true);
    obj.image63:setEditable(true);
    obj.image63:setSRC("images/ImgSize_250x500.png");
    obj.image63:setField("CarII");
    obj.image63:setName("image63");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.scrollBox6);
    obj.layout141:setLeft(500);
    obj.layout141:setTop(0);
    obj.layout141:setWidth(500);
    obj.layout141:setHeight(650);
    obj.layout141:setName("layout141");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.layout141);
    obj.image64:setWidth(500);
    obj.image64:setHeight(400);
    obj.image64:setLeft(0);
    obj.image64:setTop(0);
    obj.image64:setStyle("proportional");
    obj.image64:setCenter(true);
    obj.image64:setSRC("images/FichaCAR.png");
    obj.image64:setName("image64");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout141);
    obj.label66:setText("VEICULO");
    obj.label66:setFontSize(30);
    obj.label66:setWidth(200);
    obj.label66:setHeight(30);
    obj.label66:setTop(45);
    obj.label66:setLeft(70);
    obj.label66:setName("label66");
    obj.label66:setFontColor("black");
    obj.label66:setTextTrimming("none");
    obj.label66:setWordWrap(false);
    obj.label66:setAutoSize(true);
    obj.label66:setFontFamily("kalam");
    obj.label66:setHorzTextAlign("leading");
    obj.label66:setVertTextAlign("center");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout141);
    obj.edit143:setField("Conducao2_Nick");
    obj.edit143:setWidth(250);
    lfm_setPropAsString(obj.edit143, "fontStyle",  "bold");
    obj.edit143:setFontSize(30);
    obj.edit143:setHorzTextAlign("leading");
    obj.edit143:setHeight(40);
    obj.edit143:setTop(50);
    obj.edit143:setLeft(190);
    obj.edit143:setName("edit143");
    obj.edit143:setFontColor("#C0504D");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setFontFamily("kalam");
    obj.edit143:setTransparent(true);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout141);
    obj.label67:setText("Manobra");
    obj.label67:setFontSize(20);
    obj.label67:setWidth(60);
    obj.label67:setHeight(30);
    obj.label67:setTop(110);
    obj.label67:setLeft(70);
    obj.label67:setName("label67");
    obj.label67:setFontColor("black");
    obj.label67:setTextTrimming("none");
    obj.label67:setWordWrap(false);
    obj.label67:setAutoSize(true);
    obj.label67:setFontFamily("kalam");
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setVertTextAlign("center");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout141);
    obj.edit144:setField("Conducao2_Manobra");
    obj.edit144:setWidth(30);
    obj.edit144:setHeight(30);
    obj.edit144:setTop(110);
    obj.edit144:setLeft(170);
    obj.edit144:setName("edit144");
    obj.edit144:setFontSize(20);
    obj.edit144:setFontColor("#C0504D");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setFontFamily("kalam");
    obj.edit144:setTransparent(true);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout141);
    obj.label68:setText("Blindagem");
    obj.label68:setFontSize(20);
    obj.label68:setFontColor("black");
    obj.label68:setWidth(60);
    obj.label68:setHeight(30);
    obj.label68:setTop(145);
    obj.label68:setLeft(55);
    obj.label68:setName("label68");
    obj.label68:setTextTrimming("none");
    obj.label68:setWordWrap(false);
    obj.label68:setAutoSize(true);
    obj.label68:setFontFamily("kalam");
    obj.label68:setHorzTextAlign("leading");
    obj.label68:setVertTextAlign("center");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout141);
    obj.edit145:setField("Conducao2_Blindagem");
    obj.edit145:setWidth(30);
    obj.edit145:setHeight(30);
    obj.edit145:setTop(145);
    obj.edit145:setLeft(170);
    obj.edit145:setName("edit145");
    obj.edit145:setFontSize(20);
    obj.edit145:setFontColor("#C0504D");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setFontFamily("kalam");
    obj.edit145:setTransparent(true);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout141);
    obj.label69:setText("Capacidade");
    obj.label69:setFontSize(20);
    obj.label69:setWidth(60);
    obj.label69:setHeight(30);
    obj.label69:setTop(178);
    obj.label69:setLeft(51);
    obj.label69:setName("label69");
    obj.label69:setFontColor("black");
    obj.label69:setTextTrimming("none");
    obj.label69:setWordWrap(false);
    obj.label69:setAutoSize(true);
    obj.label69:setFontFamily("kalam");
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setVertTextAlign("center");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout141);
    obj.edit146:setField("Conducao2_Capacidade");
    obj.edit146:setWidth(30);
    obj.edit146:setHeight(30);
    obj.edit146:setTop(175);
    obj.edit146:setLeft(170);
    obj.edit146:setName("edit146");
    obj.edit146:setFontSize(20);
    obj.edit146:setFontColor("#C0504D");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setFontFamily("kalam");
    obj.edit146:setTransparent(true);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout141);
    obj.label70:setText("CD");
    obj.label70:setFontSize(20);
    obj.label70:setFontColor("black");
    obj.label70:setWidth(60);
    obj.label70:setHeight(30);
    obj.label70:setTop(207);
    obj.label70:setLeft(100);
    obj.label70:setName("label70");
    obj.label70:setTextTrimming("none");
    obj.label70:setWordWrap(false);
    obj.label70:setAutoSize(true);
    obj.label70:setFontFamily("kalam");
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setVertTextAlign("center");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout141);
    obj.edit147:setField("Conducao2_CD");
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(30);
    obj.edit147:setTop(207);
    obj.edit147:setLeft(170);
    obj.edit147:setName("edit147");
    obj.edit147:setFontSize(20);
    obj.edit147:setFontColor("#C0504D");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setFontFamily("kalam");
    obj.edit147:setTransparent(true);

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout141);
    obj.label71:setText("Integridade");
    obj.label71:setFontSize(20);
    obj.label71:setWidth(80);
    obj.label71:setHeight(30);
    obj.label71:setTop(100);
    obj.label71:setLeft(230);
    obj.label71:setName("label71");
    obj.label71:setFontColor("black");
    obj.label71:setTextTrimming("none");
    obj.label71:setWordWrap(false);
    obj.label71:setAutoSize(true);
    obj.label71:setFontFamily("kalam");
    obj.label71:setHorzTextAlign("leading");
    obj.label71:setVertTextAlign("center");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout141);
    obj.edit148:setField("Conducao2_Integridade1");
    obj.edit148:setWidth(30);
    obj.edit148:setHeight(30);
    obj.edit148:setTop(142);
    obj.edit148:setLeft(240);
    obj.edit148:setName("edit148");
    obj.edit148:setFontSize(20);
    obj.edit148:setFontColor("#C0504D");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setFontFamily("kalam");
    obj.edit148:setTransparent(true);

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout141);
    obj.edit149:setField("Conducao2_Integridade2");
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(30);
    obj.edit149:setTop(142);
    obj.edit149:setLeft(275);
    obj.edit149:setName("edit149");
    obj.edit149:setFontSize(20);
    obj.edit149:setFontColor("#C0504D");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setFontFamily("kalam");
    obj.edit149:setTransparent(true);

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout141);
    obj.edit150:setField("Conducao2_Integridade3");
    obj.edit150:setWidth(30);
    obj.edit150:setHeight(30);
    obj.edit150:setTop(142);
    obj.edit150:setLeft(310);
    obj.edit150:setName("edit150");
    obj.edit150:setFontSize(20);
    obj.edit150:setFontColor("#C0504D");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setFontFamily("kalam");
    obj.edit150:setTransparent(true);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout141);
    obj.label72:setText("Gasolina");
    obj.label72:setFontSize(20);
    obj.label72:setFontColor("black");
    obj.label72:setWidth(80);
    obj.label72:setHeight(30);
    obj.label72:setTop(100);
    obj.label72:setLeft(370);
    obj.label72:setName("label72");
    obj.label72:setTextTrimming("none");
    obj.label72:setWordWrap(false);
    obj.label72:setAutoSize(true);
    obj.label72:setFontFamily("kalam");
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setVertTextAlign("center");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout141);
    obj.edit151:setField("Conducao2_Gasolina1");
    obj.edit151:setWidth(30);
    obj.edit151:setHeight(30);
    obj.edit151:setTop(142);
    obj.edit151:setLeft(370);
    obj.edit151:setName("edit151");
    obj.edit151:setFontSize(20);
    obj.edit151:setFontColor("#C0504D");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setFontFamily("kalam");
    obj.edit151:setTransparent(true);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout141);
    obj.label73:setText("Perm");
    obj.label73:setFontSize(10);
    obj.label73:setFontColor("#C0C0C0");
    obj.label73:setWidth(30);
    obj.label73:setHeight(45);
    obj.label73:setTop(130);
    obj.label73:setLeft(375);
    obj.label73:setName("label73");
    obj.label73:setTextTrimming("none");
    obj.label73:setWordWrap(false);
    obj.label73:setAutoSize(true);
    obj.label73:setFontFamily("kalam");
    obj.label73:setHorzTextAlign("leading");
    obj.label73:setVertTextAlign("center");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout141);
    obj.edit152:setField("Conducao2_Gasolina2");
    obj.edit152:setWidth(30);
    obj.edit152:setHeight(30);
    obj.edit152:setTop(142);
    obj.edit152:setLeft(425);
    obj.edit152:setName("edit152");
    obj.edit152:setFontSize(20);
    obj.edit152:setFontColor("#C0504D");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setFontFamily("kalam");
    obj.edit152:setTransparent(true);

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout141);
    obj.label74:setText("Temp");
    obj.label74:setFontSize(10);
    obj.label74:setFontColor("#C0C0C0");
    obj.label74:setWidth(30);
    obj.label74:setHeight(45);
    obj.label74:setTop(130);
    obj.label74:setLeft(430);
    obj.label74:setName("label74");
    obj.label74:setTextTrimming("none");
    obj.label74:setWordWrap(false);
    obj.label74:setAutoSize(true);
    obj.label74:setFontFamily("kalam");
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setVertTextAlign("center");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout141);
    obj.label75:setText("Equipamentos:");
    obj.label75:setFontSize(20);
    obj.label75:setWidth(80);
    obj.label75:setHeight(30);
    obj.label75:setTop(178);
    obj.label75:setLeft(230);
    obj.label75:setName("label75");
    obj.label75:setFontColor("black");
    obj.label75:setTextTrimming("none");
    obj.label75:setWordWrap(false);
    obj.label75:setAutoSize(true);
    obj.label75:setFontFamily("kalam");
    obj.label75:setHorzTextAlign("leading");
    obj.label75:setVertTextAlign("center");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setLeft(230);
    obj.layout142:setTop(208);
    obj.layout142:setWidth(230);
    obj.layout142:setHeight(160);
    obj.layout142:setName("layout142");

    obj.Conducao2_Equipamentos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Equipamentos:setParent(obj.layout142);
    obj.Conducao2_Equipamentos:setName("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setFontFamily("kalam");
    obj.Conducao2_Equipamentos:setWidth(230);
    obj.Conducao2_Equipamentos:setHeight(160);
    obj.Conducao2_Equipamentos:setFontSize(15);
    obj.Conducao2_Equipamentos:setFontColor("#548DD4");
    obj.Conducao2_Equipamentos:setField("Conducao2_Equipamentos");
    obj.Conducao2_Equipamentos:setTransparent(true);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout141);
    obj.label76:setText("Circunstancia:");
    obj.label76:setFontSize(20);
    obj.label76:setWidth(80);
    obj.label76:setHeight(30);
    obj.label76:setTop(260);
    obj.label76:setLeft(40);
    obj.label76:setName("label76");
    obj.label76:setFontColor("black");
    obj.label76:setTextTrimming("none");
    obj.label76:setWordWrap(false);
    obj.label76:setAutoSize(true);
    obj.label76:setFontFamily("kalam");
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setVertTextAlign("center");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout141);
    obj.layout143:setLeft(25);
    obj.layout143:setTop(290);
    obj.layout143:setWidth(200);
    obj.layout143:setHeight(78);
    obj.layout143:setName("layout143");

    obj.Conducao2_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Conducao2_Circunstancia:setParent(obj.layout143);
    obj.Conducao2_Circunstancia:setName("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setFontFamily("kalam");
    obj.Conducao2_Circunstancia:setWidth(200);
    obj.Conducao2_Circunstancia:setHeight(80);
    obj.Conducao2_Circunstancia:setFontSize(15);
    obj.Conducao2_Circunstancia:setFontColor("#548DD4");
    obj.Conducao2_Circunstancia:setField("Conducao2_Circunstancia");
    obj.Conducao2_Circunstancia:setTransparent(true);

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.layout141);
    obj.image65:setWidth(500);
    obj.image65:setHeight(250);
    obj.image65:setLeft(0);
    obj.image65:setTop(385);
    obj.image65:setStyle("proportional");
    obj.image65:setCenter(true);
    obj.image65:setEditable(true);
    obj.image65:setField("Car2II");
    obj.image65:setSRC("images/ImgSize_250x500.png");
    obj.image65:setName("image65");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle2);
    obj.label77:setText("Animal");
    obj.label77:setWidth(50);
    obj.label77:setHeight(30);
    obj.label77:setTop(440);
    obj.label77:setLeft(1225);
    obj.label77:setFontSize(15);
    obj.label77:setName("label77");
    obj.label77:setFontColor("black");
    obj.label77:setTextTrimming("none");
    obj.label77:setWordWrap(false);
    obj.label77:setAutoSize(true);
    obj.label77:setFontFamily("kalam");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setVertTextAlign("center");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.rectangle2);
    obj.button78:setWidth(100);
    obj.button78:setHeight(100);
    obj.button78:setLeft(1200);
    obj.button78:setTop(460);
    obj.button78:setName("button78");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.rectangle2);
    obj.image66:setWidth(100);
    obj.image66:setHeight(100);
    obj.image66:setLeft(1200);
    obj.image66:setTop(460);
    obj.image66:setStyle("proportional");
    obj.image66:setCenter(true);
    obj.image66:setSRC("images/Horse.png");
    obj.image66:setName("image66");

    obj.PopAnimal = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopAnimal:setParent(obj.rectangle2);
    obj.PopAnimal:setName("PopAnimal");
    obj.PopAnimal:setWidth(1200);
    obj.PopAnimal:setHeight(800);
    obj.PopAnimal:setBackOpacity(0.5);

    obj.frmAnimal = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAnimal:setParent(obj.PopAnimal);
    obj.frmAnimal:setName("frmAnimal");
    obj.frmAnimal:setHeight(800);
    obj.frmAnimal:setWidth(1200);
    obj.frmAnimal:setTheme("light");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.frmAnimal);
    obj.rectangle16:setWidth(1200);
    obj.rectangle16:setHeight(800);
    obj.rectangle16:setColor("white");
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setXradius(8);
    obj.rectangle16:setYradius(8);
    obj.rectangle16:setName("rectangle16");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle16);
    obj.layout144:setLeft(0);
    obj.layout144:setTop(0);
    obj.layout144:setWidth(600);
    obj.layout144:setHeight(800);
    obj.layout144:setName("layout144");

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.layout144);
    obj.image67:setWidth(600);
    obj.image67:setHeight(400);
    obj.image67:setLeft(10);
    obj.image67:setTop(140);
    obj.image67:setStyle("proportional");
    obj.image67:setCenter(true);
    obj.image67:setSRC("images/FichaPET.png");
    obj.image67:setName("image67");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout144);
    obj.edit153:setField("Pet_Nick");
    obj.edit153:setWidth(500);
    obj.edit153:setHeight(60);
    obj.edit153:setTop(150);
    obj.edit153:setLeft(100);
    obj.edit153:setFontSize(30);
    obj.edit153:setHorzTextAlign("leading");
    obj.edit153:setName("edit153");
    obj.edit153:setFontColor("#C0504D");
    obj.edit153:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit153, "fontStyle",  "bold");
    obj.edit153:setFontFamily("kalam");
    obj.edit153:setTransparent(true);

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout144);
    obj.edit154:setField("Pet_Fisico");
    obj.edit154:setWidth(40);
    obj.edit154:setHeight(30);
    obj.edit154:setTop(208);
    obj.edit154:setLeft(180);
    obj.edit154:setName("edit154");
    obj.edit154:setFontColor("#C0504D");
    obj.edit154:setFontSize(15);
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit154, "fontStyle",  "bold");
    obj.edit154:setFontFamily("kalam");
    obj.edit154:setTransparent(true);

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout144);
    obj.edit155:setField("Pet_Social");
    obj.edit155:setWidth(40);
    obj.edit155:setHeight(30);
    obj.edit155:setTop(240);
    obj.edit155:setLeft(180);
    obj.edit155:setName("edit155");
    obj.edit155:setFontColor("#C0504D");
    obj.edit155:setFontSize(15);
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit155, "fontStyle",  "bold");
    obj.edit155:setFontFamily("kalam");
    obj.edit155:setTransparent(true);

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout144);
    obj.edit156:setField("Pet_Inteligencia");
    obj.edit156:setWidth(40);
    obj.edit156:setHeight(30);
    obj.edit156:setTop(270);
    obj.edit156:setLeft(180);
    obj.edit156:setName("edit156");
    obj.edit156:setFontColor("#C0504D");
    obj.edit156:setFontSize(15);
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit156, "fontStyle",  "bold");
    obj.edit156:setFontFamily("kalam");
    obj.edit156:setTransparent(true);

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout144);
    obj.edit157:setField("Pet_Percep");
    obj.edit157:setWidth(40);
    obj.edit157:setHeight(30);
    obj.edit157:setTop(310);
    obj.edit157:setLeft(180);
    obj.edit157:setName("edit157");
    obj.edit157:setFontColor("#C0504D");
    obj.edit157:setFontSize(15);
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit157, "fontStyle",  "bold");
    obj.edit157:setFontFamily("kalam");
    obj.edit157:setTransparent(true);

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout144);
    obj.edit158:setField("Pet_Espiritual");
    obj.edit158:setWidth(40);
    obj.edit158:setHeight(30);
    obj.edit158:setTop(340);
    obj.edit158:setLeft(180);
    obj.edit158:setName("edit158");
    obj.edit158:setFontColor("#C0504D");
    obj.edit158:setFontSize(15);
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit158, "fontStyle",  "bold");
    obj.edit158:setFontFamily("kalam");
    obj.edit158:setTransparent(true);

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout144);
    obj.edit159:setField("Pet_Per1");
    obj.edit159:setWidth(40);
    obj.edit159:setHeight(30);
    obj.edit159:setTop(208);
    obj.edit159:setLeft(325);
    obj.edit159:setName("edit159");
    obj.edit159:setFontColor("#C0504D");
    obj.edit159:setFontSize(15);
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit159, "fontStyle",  "bold");
    obj.edit159:setFontFamily("kalam");
    obj.edit159:setTransparent(true);

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout144);
    obj.edit160:setField("Pet_Per2");
    obj.edit160:setWidth(40);
    obj.edit160:setHeight(30);
    obj.edit160:setTop(240);
    obj.edit160:setLeft(325);
    obj.edit160:setName("edit160");
    obj.edit160:setFontColor("#C0504D");
    obj.edit160:setFontSize(15);
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit160, "fontStyle",  "bold");
    obj.edit160:setFontFamily("kalam");
    obj.edit160:setTransparent(true);

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout144);
    obj.edit161:setField("Pet_Per3");
    obj.edit161:setWidth(40);
    obj.edit161:setHeight(30);
    obj.edit161:setTop(270);
    obj.edit161:setLeft(325);
    obj.edit161:setName("edit161");
    obj.edit161:setFontColor("#C0504D");
    obj.edit161:setFontSize(15);
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit161, "fontStyle",  "bold");
    obj.edit161:setFontFamily("kalam");
    obj.edit161:setTransparent(true);

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout144);
    obj.edit162:setField("Pet_Per4");
    obj.edit162:setWidth(40);
    obj.edit162:setHeight(30);
    obj.edit162:setTop(300);
    obj.edit162:setLeft(325);
    obj.edit162:setName("edit162");
    obj.edit162:setFontColor("#C0504D");
    obj.edit162:setFontSize(15);
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit162, "fontStyle",  "bold");
    obj.edit162:setFontFamily("kalam");
    obj.edit162:setTransparent(true);

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout144);
    obj.edit163:setField("Pet_Per5");
    obj.edit163:setWidth(40);
    obj.edit163:setHeight(30);
    obj.edit163:setTop(330);
    obj.edit163:setLeft(325);
    obj.edit163:setName("edit163");
    obj.edit163:setFontColor("#C0504D");
    obj.edit163:setFontSize(15);
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit163, "fontStyle",  "bold");
    obj.edit163:setFontFamily("kalam");
    obj.edit163:setTransparent(true);

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout144);
    obj.edit164:setField("Pet_Per6");
    obj.edit164:setWidth(40);
    obj.edit164:setHeight(30);
    obj.edit164:setTop(360);
    obj.edit164:setLeft(325);
    obj.edit164:setName("edit164");
    obj.edit164:setFontColor("#C0504D");
    obj.edit164:setFontSize(15);
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit164, "fontStyle",  "bold");
    obj.edit164:setFontFamily("kalam");
    obj.edit164:setTransparent(true);

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout144);
    obj.edit165:setField("Pet_Per7");
    obj.edit165:setWidth(40);
    obj.edit165:setHeight(30);
    obj.edit165:setTop(400);
    obj.edit165:setLeft(325);
    obj.edit165:setName("edit165");
    obj.edit165:setFontColor("#C0504D");
    obj.edit165:setFontSize(15);
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit165, "fontStyle",  "bold");
    obj.edit165:setFontFamily("kalam");
    obj.edit165:setTransparent(true);

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout144);
    obj.edit166:setField("Pet_Saude1");
    obj.edit166:setWidth(40);
    obj.edit166:setHeight(30);
    obj.edit166:setTop(256);
    obj.edit166:setLeft(385);
    obj.edit166:setName("edit166");
    obj.edit166:setFontColor("#C0504D");
    obj.edit166:setFontSize(15);
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit166, "fontStyle",  "bold");
    obj.edit166:setFontFamily("kalam");
    obj.edit166:setTransparent(true);

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout144);
    obj.edit167:setField("Pet_Saude2");
    obj.edit167:setWidth(40);
    obj.edit167:setHeight(30);
    obj.edit167:setTop(256);
    obj.edit167:setLeft(422);
    obj.edit167:setName("edit167");
    obj.edit167:setFontColor("#C0504D");
    obj.edit167:setFontSize(15);
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit167, "fontStyle",  "bold");
    obj.edit167:setFontFamily("kalam");
    obj.edit167:setTransparent(true);

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout144);
    obj.edit168:setField("Pet_Saude3");
    obj.edit168:setWidth(40);
    obj.edit168:setHeight(30);
    obj.edit168:setTop(256);
    obj.edit168:setLeft(452);
    obj.edit168:setName("edit168");
    obj.edit168:setFontColor("#C0504D");
    obj.edit168:setFontSize(15);
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit168, "fontStyle",  "bold");
    obj.edit168:setFontFamily("kalam");
    obj.edit168:setTransparent(true);

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout144);
    obj.edit169:setField("Pet_Iniciativa");
    obj.edit169:setWidth(40);
    obj.edit169:setHeight(30);
    obj.edit169:setTop(325);
    obj.edit169:setLeft(470);
    obj.edit169:setName("edit169");
    obj.edit169:setFontColor("#C0504D");
    obj.edit169:setFontSize(15);
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit169, "fontStyle",  "bold");
    obj.edit169:setFontFamily("kalam");
    obj.edit169:setTransparent(true);

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout144);
    obj.edit170:setField("Pet_AtkNick");
    obj.edit170:setWidth(200);
    obj.edit170:setHeight(30);
    obj.edit170:setTop(430);
    obj.edit170:setLeft(100);
    obj.edit170:setFontSize(20);
    obj.edit170:setName("edit170");
    obj.edit170:setFontColor("black");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit170, "fontStyle",  "bold");
    obj.edit170:setFontFamily("kalam");
    obj.edit170:setTransparent(true);

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout144);
    obj.edit171:setField("Pet_AtkGolpe");
    obj.edit171:setWidth(200);
    obj.edit171:setHeight(30);
    obj.edit171:setTop(458);
    obj.edit171:setLeft(200);
    obj.edit171:setFontColor("gray");
    obj.edit171:setHorzTextAlign("leading");
    obj.edit171:setName("edit171");
    obj.edit171:setFontSize(15);
    obj.edit171:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit171, "fontStyle",  "bold");
    obj.edit171:setFontFamily("kalam");
    obj.edit171:setTransparent(true);

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout144);
    obj.edit172:setField("Pet_AtkDano");
    obj.edit172:setWidth(40);
    obj.edit172:setHeight(30);
    obj.edit172:setTop(478);
    obj.edit172:setLeft(195);
    obj.edit172:setFontColor("gray");
    obj.edit172:setName("edit172");
    obj.edit172:setFontSize(15);
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit172, "fontStyle",  "bold");
    obj.edit172:setFontFamily("kalam");
    obj.edit172:setTransparent(true);

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout144);
    obj.edit173:setField("Pet_AtkCD");
    obj.edit173:setWidth(40);
    obj.edit173:setHeight(30);
    obj.edit173:setTop(478);
    obj.edit173:setLeft(270);
    obj.edit173:setName("edit173");
    obj.edit173:setFontColor("#C0504D");
    obj.edit173:setFontSize(15);
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit173, "fontStyle",  "bold");
    obj.edit173:setFontFamily("kalam");
    obj.edit173:setTransparent(true);

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout144);
    obj.edit174:setField("Pet_Des");
    obj.edit174:setWidth(140);
    obj.edit174:setHeight(30);
    obj.edit174:setTop(400);
    obj.edit174:setLeft(385);
    obj.edit174:setHorzTextAlign("leading");
    obj.edit174:setName("edit174");
    obj.edit174:setFontColor("black");
    obj.edit174:setFontSize(15);
    obj.edit174:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit174, "fontStyle",  "bold");
    obj.edit174:setFontFamily("kalam");
    obj.edit174:setTransparent(true);

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout144);
    obj.edit175:setField("Pet_Des2");
    obj.edit175:setWidth(140);
    obj.edit175:setHeight(30);
    obj.edit175:setTop(420);
    obj.edit175:setLeft(385);
    obj.edit175:setHorzTextAlign("leading");
    obj.edit175:setName("edit175");
    obj.edit175:setFontColor("black");
    obj.edit175:setFontSize(15);
    obj.edit175:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit175, "fontStyle",  "bold");
    obj.edit175:setFontFamily("kalam");
    obj.edit175:setTransparent(true);

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.layout144);
    obj.image68:setWidth(400);
    obj.image68:setHeight(300);
    obj.image68:setLeft(100);
    obj.image68:setTop(505);
    obj.image68:setSRC("images/ImgSize_400x300.png");
    obj.image68:setStyle("proportional");
    obj.image68:setEditable(true);
    obj.image68:setShowProgress(true);
    obj.image68:setOptimize(true);
    obj.image68:setField("PetII");
    obj.image68:setName("image68");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle16);
    obj.layout145:setLeft(600);
    obj.layout145:setTop(0);
    obj.layout145:setWidth(600);
    obj.layout145:setHeight(800);
    obj.layout145:setName("layout145");

    obj.image69 = GUI.fromHandle(_obj_newObject("image"));
    obj.image69:setParent(obj.layout145);
    obj.image69:setWidth(600);
    obj.image69:setHeight(400);
    obj.image69:setLeft(10);
    obj.image69:setTop(140);
    obj.image69:setStyle("proportional");
    obj.image69:setCenter(true);
    obj.image69:setSRC("images/FichaPET.png");
    obj.image69:setName("image69");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout145);
    obj.edit176:setField("Pet2_Nick");
    obj.edit176:setWidth(500);
    obj.edit176:setHeight(60);
    obj.edit176:setTop(150);
    obj.edit176:setLeft(100);
    obj.edit176:setFontSize(30);
    obj.edit176:setHorzTextAlign("leading");
    obj.edit176:setName("edit176");
    obj.edit176:setFontColor("#C0504D");
    obj.edit176:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit176, "fontStyle",  "bold");
    obj.edit176:setFontFamily("kalam");
    obj.edit176:setTransparent(true);

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout145);
    obj.edit177:setField("Pet2_Fisico");
    obj.edit177:setWidth(40);
    obj.edit177:setHeight(30);
    obj.edit177:setTop(208);
    obj.edit177:setLeft(180);
    obj.edit177:setName("edit177");
    obj.edit177:setFontColor("#C0504D");
    obj.edit177:setFontSize(15);
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit177, "fontStyle",  "bold");
    obj.edit177:setFontFamily("kalam");
    obj.edit177:setTransparent(true);

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout145);
    obj.edit178:setField("Pet2_Social");
    obj.edit178:setWidth(40);
    obj.edit178:setHeight(30);
    obj.edit178:setTop(240);
    obj.edit178:setLeft(180);
    obj.edit178:setName("edit178");
    obj.edit178:setFontColor("#C0504D");
    obj.edit178:setFontSize(15);
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit178, "fontStyle",  "bold");
    obj.edit178:setFontFamily("kalam");
    obj.edit178:setTransparent(true);

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout145);
    obj.edit179:setField("Pet2_Inteligencia");
    obj.edit179:setWidth(40);
    obj.edit179:setHeight(30);
    obj.edit179:setTop(270);
    obj.edit179:setLeft(180);
    obj.edit179:setName("edit179");
    obj.edit179:setFontColor("#C0504D");
    obj.edit179:setFontSize(15);
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit179, "fontStyle",  "bold");
    obj.edit179:setFontFamily("kalam");
    obj.edit179:setTransparent(true);

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout145);
    obj.edit180:setField("Pet2_Percep");
    obj.edit180:setWidth(40);
    obj.edit180:setHeight(30);
    obj.edit180:setTop(310);
    obj.edit180:setLeft(180);
    obj.edit180:setName("edit180");
    obj.edit180:setFontColor("#C0504D");
    obj.edit180:setFontSize(15);
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit180, "fontStyle",  "bold");
    obj.edit180:setFontFamily("kalam");
    obj.edit180:setTransparent(true);

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout145);
    obj.edit181:setField("Pet2_Espiritual");
    obj.edit181:setWidth(40);
    obj.edit181:setHeight(30);
    obj.edit181:setTop(340);
    obj.edit181:setLeft(180);
    obj.edit181:setName("edit181");
    obj.edit181:setFontColor("#C0504D");
    obj.edit181:setFontSize(15);
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit181, "fontStyle",  "bold");
    obj.edit181:setFontFamily("kalam");
    obj.edit181:setTransparent(true);

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout145);
    obj.edit182:setField("Pet2_Per1");
    obj.edit182:setWidth(40);
    obj.edit182:setHeight(30);
    obj.edit182:setTop(208);
    obj.edit182:setLeft(325);
    obj.edit182:setName("edit182");
    obj.edit182:setFontColor("#C0504D");
    obj.edit182:setFontSize(15);
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit182, "fontStyle",  "bold");
    obj.edit182:setFontFamily("kalam");
    obj.edit182:setTransparent(true);

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout145);
    obj.edit183:setField("Pet2_Per2");
    obj.edit183:setWidth(40);
    obj.edit183:setHeight(30);
    obj.edit183:setTop(240);
    obj.edit183:setLeft(325);
    obj.edit183:setName("edit183");
    obj.edit183:setFontColor("#C0504D");
    obj.edit183:setFontSize(15);
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit183, "fontStyle",  "bold");
    obj.edit183:setFontFamily("kalam");
    obj.edit183:setTransparent(true);

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout145);
    obj.edit184:setField("Pet2_Per3");
    obj.edit184:setWidth(40);
    obj.edit184:setHeight(30);
    obj.edit184:setTop(270);
    obj.edit184:setLeft(325);
    obj.edit184:setName("edit184");
    obj.edit184:setFontColor("#C0504D");
    obj.edit184:setFontSize(15);
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit184, "fontStyle",  "bold");
    obj.edit184:setFontFamily("kalam");
    obj.edit184:setTransparent(true);

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout145);
    obj.edit185:setField("Pet2_Per4");
    obj.edit185:setWidth(40);
    obj.edit185:setHeight(30);
    obj.edit185:setTop(300);
    obj.edit185:setLeft(325);
    obj.edit185:setName("edit185");
    obj.edit185:setFontColor("#C0504D");
    obj.edit185:setFontSize(15);
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit185, "fontStyle",  "bold");
    obj.edit185:setFontFamily("kalam");
    obj.edit185:setTransparent(true);

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout145);
    obj.edit186:setField("Pet2_Per5");
    obj.edit186:setWidth(40);
    obj.edit186:setHeight(30);
    obj.edit186:setTop(330);
    obj.edit186:setLeft(325);
    obj.edit186:setName("edit186");
    obj.edit186:setFontColor("#C0504D");
    obj.edit186:setFontSize(15);
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit186, "fontStyle",  "bold");
    obj.edit186:setFontFamily("kalam");
    obj.edit186:setTransparent(true);

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout145);
    obj.edit187:setField("Pet2_Per6");
    obj.edit187:setWidth(40);
    obj.edit187:setHeight(30);
    obj.edit187:setTop(360);
    obj.edit187:setLeft(325);
    obj.edit187:setName("edit187");
    obj.edit187:setFontColor("#C0504D");
    obj.edit187:setFontSize(15);
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit187, "fontStyle",  "bold");
    obj.edit187:setFontFamily("kalam");
    obj.edit187:setTransparent(true);

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout145);
    obj.edit188:setField("Pet2_Per7");
    obj.edit188:setWidth(40);
    obj.edit188:setHeight(30);
    obj.edit188:setTop(400);
    obj.edit188:setLeft(325);
    obj.edit188:setName("edit188");
    obj.edit188:setFontColor("#C0504D");
    obj.edit188:setFontSize(15);
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit188, "fontStyle",  "bold");
    obj.edit188:setFontFamily("kalam");
    obj.edit188:setTransparent(true);

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout145);
    obj.edit189:setField("Pet2_Saude1");
    obj.edit189:setWidth(40);
    obj.edit189:setHeight(30);
    obj.edit189:setTop(256);
    obj.edit189:setLeft(385);
    obj.edit189:setName("edit189");
    obj.edit189:setFontColor("#C0504D");
    obj.edit189:setFontSize(15);
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit189, "fontStyle",  "bold");
    obj.edit189:setFontFamily("kalam");
    obj.edit189:setTransparent(true);

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout145);
    obj.edit190:setField("Pet2_Saude2");
    obj.edit190:setWidth(40);
    obj.edit190:setHeight(30);
    obj.edit190:setTop(256);
    obj.edit190:setLeft(422);
    obj.edit190:setName("edit190");
    obj.edit190:setFontColor("#C0504D");
    obj.edit190:setFontSize(15);
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit190, "fontStyle",  "bold");
    obj.edit190:setFontFamily("kalam");
    obj.edit190:setTransparent(true);

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout145);
    obj.edit191:setField("Pet2_Saude3");
    obj.edit191:setWidth(40);
    obj.edit191:setHeight(30);
    obj.edit191:setTop(256);
    obj.edit191:setLeft(452);
    obj.edit191:setName("edit191");
    obj.edit191:setFontColor("#C0504D");
    obj.edit191:setFontSize(15);
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit191, "fontStyle",  "bold");
    obj.edit191:setFontFamily("kalam");
    obj.edit191:setTransparent(true);

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout145);
    obj.edit192:setField("Pet2_Iniciativa");
    obj.edit192:setWidth(40);
    obj.edit192:setHeight(30);
    obj.edit192:setTop(325);
    obj.edit192:setLeft(470);
    obj.edit192:setName("edit192");
    obj.edit192:setFontColor("#C0504D");
    obj.edit192:setFontSize(15);
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit192, "fontStyle",  "bold");
    obj.edit192:setFontFamily("kalam");
    obj.edit192:setTransparent(true);

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout145);
    obj.edit193:setField("Pet2_AtkNick");
    obj.edit193:setWidth(200);
    obj.edit193:setHeight(30);
    obj.edit193:setTop(430);
    obj.edit193:setLeft(100);
    obj.edit193:setFontSize(20);
    obj.edit193:setName("edit193");
    obj.edit193:setFontColor("black");
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit193, "fontStyle",  "bold");
    obj.edit193:setFontFamily("kalam");
    obj.edit193:setTransparent(true);

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout145);
    obj.edit194:setField("Pet2_AtkGolpe");
    obj.edit194:setWidth(200);
    obj.edit194:setHeight(30);
    obj.edit194:setTop(458);
    obj.edit194:setLeft(200);
    obj.edit194:setFontColor("gray");
    obj.edit194:setHorzTextAlign("leading");
    obj.edit194:setName("edit194");
    obj.edit194:setFontSize(15);
    obj.edit194:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit194, "fontStyle",  "bold");
    obj.edit194:setFontFamily("kalam");
    obj.edit194:setTransparent(true);

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout145);
    obj.edit195:setField("Pet2_AtkDano");
    obj.edit195:setWidth(40);
    obj.edit195:setHeight(30);
    obj.edit195:setTop(478);
    obj.edit195:setLeft(195);
    obj.edit195:setFontColor("gray");
    obj.edit195:setName("edit195");
    obj.edit195:setFontSize(15);
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit195, "fontStyle",  "bold");
    obj.edit195:setFontFamily("kalam");
    obj.edit195:setTransparent(true);

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout145);
    obj.edit196:setField("Pet2_AtkCD");
    obj.edit196:setWidth(40);
    obj.edit196:setHeight(30);
    obj.edit196:setTop(478);
    obj.edit196:setLeft(270);
    obj.edit196:setName("edit196");
    obj.edit196:setFontColor("#C0504D");
    obj.edit196:setFontSize(15);
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit196, "fontStyle",  "bold");
    obj.edit196:setFontFamily("kalam");
    obj.edit196:setTransparent(true);

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout145);
    obj.edit197:setField("Pet2_Des");
    obj.edit197:setWidth(140);
    obj.edit197:setHeight(30);
    obj.edit197:setTop(400);
    obj.edit197:setLeft(385);
    obj.edit197:setHorzTextAlign("leading");
    obj.edit197:setName("edit197");
    obj.edit197:setFontColor("black");
    obj.edit197:setFontSize(15);
    obj.edit197:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit197, "fontStyle",  "bold");
    obj.edit197:setFontFamily("kalam");
    obj.edit197:setTransparent(true);

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout145);
    obj.edit198:setField("Pet2_Des2");
    obj.edit198:setWidth(140);
    obj.edit198:setHeight(30);
    obj.edit198:setTop(420);
    obj.edit198:setLeft(385);
    obj.edit198:setHorzTextAlign("leading");
    obj.edit198:setName("edit198");
    obj.edit198:setFontColor("black");
    obj.edit198:setFontSize(15);
    obj.edit198:setVertTextAlign("center");
    lfm_setPropAsString(obj.edit198, "fontStyle",  "bold");
    obj.edit198:setFontFamily("kalam");
    obj.edit198:setTransparent(true);

    obj.image70 = GUI.fromHandle(_obj_newObject("image"));
    obj.image70:setParent(obj.layout145);
    obj.image70:setWidth(400);
    obj.image70:setHeight(300);
    obj.image70:setLeft(100);
    obj.image70:setTop(505);
    obj.image70:setSRC("images/ImgSize_400x300.png");
    obj.image70:setStyle("proportional");
    obj.image70:setEditable(true);
    obj.image70:setShowProgress(true);
    obj.image70:setOptimize(true);
    obj.image70:setField("Pet2II");
    obj.image70:setName("image70");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle2);
    obj.label78:setText("NPC's");
    obj.label78:setWidth(50);
    obj.label78:setHeight(30);
    obj.label78:setTop(310);
    obj.label78:setLeft(1236);
    obj.label78:setFontSize(15);
    obj.label78:setName("label78");
    obj.label78:setFontColor("black");
    obj.label78:setTextTrimming("none");
    obj.label78:setWordWrap(false);
    obj.label78:setAutoSize(true);
    obj.label78:setFontFamily("kalam");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.rectangle2);
    obj.button79:setWidth(100);
    obj.button79:setHeight(100);
    obj.button79:setLeft(1200);
    obj.button79:setTop(330);
    obj.button79:setName("button79");

    obj.image71 = GUI.fromHandle(_obj_newObject("image"));
    obj.image71:setParent(obj.rectangle2);
    obj.image71:setWidth(100);
    obj.image71:setHeight(100);
    obj.image71:setLeft(1200);
    obj.image71:setTop(330);
    obj.image71:setStyle("proportional");
    obj.image71:setCenter(true);
    obj.image71:setSRC("images/NPC.png");
    obj.image71:setName("image71");

    obj.PopNPCfrente = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopNPCfrente:setParent(obj.rectangle2);
    obj.PopNPCfrente:setName("PopNPCfrente");
    obj.PopNPCfrente:setWidth(1340);
    obj.PopNPCfrente:setHeight(620);
    obj.PopNPCfrente:setBackOpacity(0.5);

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.PopNPCfrente);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.frmDZ_NPC_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDZ_NPC_svg:setParent(obj.scrollBox7);
    obj.frmDZ_NPC_svg:setName("frmDZ_NPC_svg");
    obj.frmDZ_NPC_svg:setPadding({left=4, top=4, right=4, bottom=4});
    obj.frmDZ_NPC_svg:setHeight(600);
    obj.frmDZ_NPC_svg:setWidth(1200);
    obj.frmDZ_NPC_svg:setTheme("light");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.frmDZ_NPC_svg);
    obj.layout146:setAlign("top");
    obj.layout146:setHeight(30);
    obj.layout146:setMargins({bottom=4});
    obj.layout146:setName("layout146");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout146);
    obj.button80:setText("Adicionar");
    obj.button80:setWidth(120);
    obj.button80:setAlign("left");
    obj.button80:setName("button80");
    obj.button80:setFontColor("#000000");
    obj.button80:setFontSize(20);
    obj.button80:setHorzTextAlign("center");
    obj.button80:setVertTextAlign("center");
    lfm_setPropAsString(obj.button80, "fontStyle",  "bold");
    obj.button80:setFontFamily("kalam");

    obj.rclListaNPC = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaNPC:setParent(obj.frmDZ_NPC_svg);
    obj.rclListaNPC:setName("rclListaNPC");
    obj.rclListaNPC:setField("ListagemNPC");
    obj.rclListaNPC:setTemplateForm("frmListaNPC");
    obj.rclListaNPC:setAlign("client");
    obj.rclListaNPC:setSelectable(true);

    obj.boxDetalhesDoItem3 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem3:setParent(obj.frmDZ_NPC_svg);
    obj.boxDetalhesDoItem3:setName("boxDetalhesDoItem3");
    obj.boxDetalhesDoItem3:setVisible(false);
    obj.boxDetalhesDoItem3:setAlign("right");
    obj.boxDetalhesDoItem3:setWidth(900);
    obj.boxDetalhesDoItem3:setMargins({left=4, right=4});

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.boxDetalhesDoItem3);
    obj.rectangle17:setWidth(900);
    obj.rectangle17:setHeight(600);
    obj.rectangle17:setColor("Transparent");
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setName("rectangle17");

    obj.image72 = GUI.fromHandle(_obj_newObject("image"));
    obj.image72:setParent(obj.rectangle17);
    obj.image72:setLeft(0);
    obj.image72:setTop(0);
    obj.image72:setWidth(600);
    obj.image72:setHeight(600);
    obj.image72:setSRC("images/FichaNPC.png");
    obj.image72:setStyle("proportional");
    obj.image72:setOptimize(true);
    obj.image72:setAlign("left");
    obj.image72:setName("image72");

    obj.image73 = GUI.fromHandle(_obj_newObject("image"));
    obj.image73:setParent(obj.rectangle17);
    obj.image73:setWidth(300);
    obj.image73:setHeight(600);
    obj.image73:setSRC("images/silhu.png");
    obj.image73:setStyle("proportional");
    obj.image73:setEditable(true);
    obj.image73:setShowProgress(true);
    obj.image73:setOptimize(true);
    obj.image73:setHint("O ideal é: 300x600 em png");
    obj.image73:setAlign("right");
    obj.image73:setField("NpcII");
    obj.image73:setName("image73");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.rectangle17);
    obj.edit199:setTransparent(true);
    obj.edit199:setFontSize(28);
    obj.edit199:setLeft(125);
    obj.edit199:setTop(20);
    obj.edit199:setWidth(300);
    obj.edit199:setHeight(50);
    obj.edit199:setField("NPC_nick");
    obj.edit199:setHorzTextAlign("leading");
    obj.edit199:setVertTextAlign("leading");
    obj.edit199:setName("edit199");
    obj.edit199:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit199, "fontStyle",  "bold");
    obj.edit199:setFontFamily("kalam");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.rectangle17);
    obj.edit200:setTransparent(true);
    obj.edit200:setFontSize(30);
    obj.edit200:setLeft(500);
    obj.edit200:setTop(20);
    obj.edit200:setWidth(50);
    obj.edit200:setHeight(50);
    obj.edit200:setField("NPC_idade");
    obj.edit200:setHorzTextAlign("leading");
    obj.edit200:setVertTextAlign("leading");
    obj.edit200:setName("edit200");
    obj.edit200:setFontColor("#C0504D");
    lfm_setPropAsString(obj.edit200, "fontStyle",  "bold");
    obj.edit200:setFontFamily("kalam");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.rectangle17);
    obj.edit201:setTransparent(true);
    obj.edit201:setLeft(146);
    obj.edit201:setTop(80);
    obj.edit201:setWidth(25);
    obj.edit201:setHeight(30);
    obj.edit201:setField("NPC_fisico");
    obj.edit201:setVertTextAlign("leading");
    obj.edit201:setName("edit201");
    obj.edit201:setFontColor("#C0504D");
    obj.edit201:setFontSize(15);
    obj.edit201:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit201, "fontStyle",  "bold");
    obj.edit201:setFontFamily("kalam");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.rectangle17);
    obj.edit202:setTransparent(true);
    obj.edit202:setLeft(146);
    obj.edit202:setTop(105);
    obj.edit202:setWidth(25);
    obj.edit202:setHeight(30);
    obj.edit202:setField("NPC_social");
    obj.edit202:setVertTextAlign("leading");
    obj.edit202:setName("edit202");
    obj.edit202:setFontColor("#C0504D");
    obj.edit202:setFontSize(15);
    obj.edit202:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit202, "fontStyle",  "bold");
    obj.edit202:setFontFamily("kalam");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.rectangle17);
    obj.edit203:setTransparent(true);
    obj.edit203:setLeft(146);
    obj.edit203:setTop(130);
    obj.edit203:setWidth(25);
    obj.edit203:setHeight(30);
    obj.edit203:setField("NPC_mental");
    obj.edit203:setVertTextAlign("leading");
    obj.edit203:setName("edit203");
    obj.edit203:setFontColor("#C0504D");
    obj.edit203:setFontSize(15);
    obj.edit203:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit203, "fontStyle",  "bold");
    obj.edit203:setFontFamily("kalam");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.rectangle17);
    obj.edit204:setTransparent(true);
    obj.edit204:setLeft(146);
    obj.edit204:setTop(155);
    obj.edit204:setWidth(25);
    obj.edit204:setHeight(30);
    obj.edit204:setField("NPC_espiritual");
    obj.edit204:setVertTextAlign("leading");
    obj.edit204:setName("edit204");
    obj.edit204:setFontColor("#C0504D");
    obj.edit204:setFontSize(15);
    obj.edit204:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit204, "fontStyle",  "bold");
    obj.edit204:setFontFamily("kalam");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.rectangle17);
    obj.edit205:setTransparent(true);
    obj.edit205:setLeft(275);
    obj.edit205:setTop(75);
    obj.edit205:setWidth(25);
    obj.edit205:setHeight(30);
    obj.edit205:setField("NPC_P1");
    obj.edit205:setVertTextAlign("leading");
    obj.edit205:setName("edit205");
    obj.edit205:setFontColor("#C0504D");
    obj.edit205:setFontSize(15);
    obj.edit205:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit205, "fontStyle",  "bold");
    obj.edit205:setFontFamily("kalam");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.rectangle17);
    obj.edit206:setTransparent(true);
    obj.edit206:setLeft(275);
    obj.edit206:setTop(96);
    obj.edit206:setWidth(25);
    obj.edit206:setHeight(30);
    obj.edit206:setField("NPC_P2");
    obj.edit206:setVertTextAlign("leading");
    obj.edit206:setName("edit206");
    obj.edit206:setFontColor("#C0504D");
    obj.edit206:setFontSize(15);
    obj.edit206:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit206, "fontStyle",  "bold");
    obj.edit206:setFontFamily("kalam");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.rectangle17);
    obj.edit207:setTransparent(true);
    obj.edit207:setLeft(275);
    obj.edit207:setTop(117);
    obj.edit207:setWidth(25);
    obj.edit207:setHeight(30);
    obj.edit207:setField("NPC_P3");
    obj.edit207:setVertTextAlign("leading");
    obj.edit207:setName("edit207");
    obj.edit207:setFontColor("#C0504D");
    obj.edit207:setFontSize(15);
    obj.edit207:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit207, "fontStyle",  "bold");
    obj.edit207:setFontFamily("kalam");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.rectangle17);
    obj.edit208:setTransparent(true);
    obj.edit208:setLeft(275);
    obj.edit208:setTop(138);
    obj.edit208:setWidth(25);
    obj.edit208:setHeight(30);
    obj.edit208:setField("NPC_P4");
    obj.edit208:setVertTextAlign("leading");
    obj.edit208:setName("edit208");
    obj.edit208:setFontColor("#C0504D");
    obj.edit208:setFontSize(15);
    obj.edit208:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit208, "fontStyle",  "bold");
    obj.edit208:setFontFamily("kalam");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.rectangle17);
    obj.edit209:setTransparent(true);
    obj.edit209:setLeft(275);
    obj.edit209:setTop(159);
    obj.edit209:setWidth(25);
    obj.edit209:setHeight(30);
    obj.edit209:setField("NPC_P5");
    obj.edit209:setVertTextAlign("leading");
    obj.edit209:setName("edit209");
    obj.edit209:setFontColor("#C0504D");
    obj.edit209:setFontSize(15);
    obj.edit209:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit209, "fontStyle",  "bold");
    obj.edit209:setFontFamily("kalam");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.rectangle17);
    obj.edit210:setTransparent(true);
    obj.edit210:setLeft(275);
    obj.edit210:setTop(182);
    obj.edit210:setWidth(25);
    obj.edit210:setHeight(30);
    obj.edit210:setField("NPC_P6");
    obj.edit210:setVertTextAlign("leading");
    obj.edit210:setName("edit210");
    obj.edit210:setFontColor("#C0504D");
    obj.edit210:setFontSize(15);
    obj.edit210:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit210, "fontStyle",  "bold");
    obj.edit210:setFontFamily("kalam");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.rectangle17);
    obj.edit211:setTransparent(true);
    obj.edit211:setLeft(275);
    obj.edit211:setTop(205);
    obj.edit211:setWidth(25);
    obj.edit211:setHeight(30);
    obj.edit211:setField("NPC_P7");
    obj.edit211:setVertTextAlign("leading");
    obj.edit211:setName("edit211");
    obj.edit211:setFontColor("#C0504D");
    obj.edit211:setFontSize(15);
    obj.edit211:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit211, "fontStyle",  "bold");
    obj.edit211:setFontFamily("kalam");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.rectangle17);
    obj.edit212:setTransparent(true);
    obj.edit212:setLeft(275);
    obj.edit212:setTop(225);
    obj.edit212:setWidth(25);
    obj.edit212:setHeight(30);
    obj.edit212:setField("NPC_P8");
    obj.edit212:setVertTextAlign("leading");
    obj.edit212:setName("edit212");
    obj.edit212:setFontColor("#C0504D");
    obj.edit212:setFontSize(15);
    obj.edit212:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit212, "fontStyle",  "bold");
    obj.edit212:setFontFamily("kalam");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.rectangle17);
    obj.edit213:setTransparent(true);
    obj.edit213:setLeft(275);
    obj.edit213:setTop(250);
    obj.edit213:setWidth(25);
    obj.edit213:setHeight(30);
    obj.edit213:setField("NPC_P9");
    obj.edit213:setVertTextAlign("leading");
    obj.edit213:setName("edit213");
    obj.edit213:setFontColor("#C0504D");
    obj.edit213:setFontSize(15);
    obj.edit213:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit213, "fontStyle",  "bold");
    obj.edit213:setFontFamily("kalam");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.rectangle17);
    obj.edit214:setTransparent(true);
    obj.edit214:setLeft(275);
    obj.edit214:setTop(275);
    obj.edit214:setWidth(25);
    obj.edit214:setHeight(30);
    obj.edit214:setField("NPC_P10");
    obj.edit214:setVertTextAlign("leading");
    obj.edit214:setName("edit214");
    obj.edit214:setFontColor("#C0504D");
    obj.edit214:setFontSize(15);
    obj.edit214:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit214, "fontStyle",  "bold");
    obj.edit214:setFontFamily("kalam");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.rectangle17);
    obj.edit215:setTransparent(true);
    obj.edit215:setLeft(315);
    obj.edit215:setTop(100);
    obj.edit215:setWidth(25);
    obj.edit215:setHeight(30);
    obj.edit215:setField("NPC_Saude1");
    obj.edit215:setVertTextAlign("leading");
    obj.edit215:setName("edit215");
    obj.edit215:setFontColor("#C0504D");
    obj.edit215:setFontSize(15);
    obj.edit215:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit215, "fontStyle",  "bold");
    obj.edit215:setFontFamily("kalam");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.rectangle17);
    obj.edit216:setTransparent(true);
    obj.edit216:setLeft(340);
    obj.edit216:setTop(100);
    obj.edit216:setWidth(25);
    obj.edit216:setHeight(30);
    obj.edit216:setField("NPC_Saude2");
    obj.edit216:setVertTextAlign("leading");
    obj.edit216:setName("edit216");
    obj.edit216:setFontColor("#C0504D");
    obj.edit216:setFontSize(15);
    obj.edit216:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit216, "fontStyle",  "bold");
    obj.edit216:setFontFamily("kalam");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.rectangle17);
    obj.edit217:setTransparent(true);
    obj.edit217:setLeft(365);
    obj.edit217:setTop(100);
    obj.edit217:setWidth(25);
    obj.edit217:setHeight(30);
    obj.edit217:setField("NPC_Saude3");
    obj.edit217:setVertTextAlign("leading");
    obj.edit217:setName("edit217");
    obj.edit217:setFontColor("#C0504D");
    obj.edit217:setFontSize(15);
    obj.edit217:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit217, "fontStyle",  "bold");
    obj.edit217:setFontFamily("kalam");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.rectangle17);
    obj.edit218:setTransparent(true);
    obj.edit218:setLeft(508);
    obj.edit218:setTop(74);
    obj.edit218:setWidth(25);
    obj.edit218:setHeight(30);
    obj.edit218:setField("NPC_Moralidade");
    obj.edit218:setVertTextAlign("leading");
    obj.edit218:setName("edit218");
    obj.edit218:setFontColor("#C0504D");
    obj.edit218:setFontSize(15);
    obj.edit218:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit218, "fontStyle",  "bold");
    obj.edit218:setFontFamily("kalam");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle17);
    obj.comboBox2:setLeft(420);
    obj.comboBox2:setTop(100);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("NPC_MoralidadeS");
    obj.comboBox2:setItems({'Selvagem', 'Egoísta', 'Moralista', 'Honroso', 'Santo'});
    obj.comboBox2:setValues({'Se', 'Eg', 'Mo', 'Ho', 'Sa'});
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontColor("#C0504D");
    obj.comboBox2:setFontSize(15);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setVertTextAlign("center");
    lfm_setPropAsString(obj.comboBox2, "fontStyle",  "bold");
    obj.comboBox2:setFontFamily("kalam");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.rectangle17);
    obj.edit219:setTransparent(true);
    obj.edit219:setLeft(128);
    obj.edit219:setTop(218);
    obj.edit219:setWidth(25);
    obj.edit219:setHeight(30);
    obj.edit219:setField("NPC_Iniciativa");
    obj.edit219:setVertTextAlign("leading");
    obj.edit219:setName("edit219");
    obj.edit219:setFontColor("#C0504D");
    obj.edit219:setFontSize(15);
    obj.edit219:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit219, "fontStyle",  "bold");
    obj.edit219:setFontFamily("kalam");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.rectangle17);
    obj.edit220:setTransparent(true);
    obj.edit220:setLeft(128);
    obj.edit220:setTop(251);
    obj.edit220:setWidth(25);
    obj.edit220:setHeight(30);
    obj.edit220:setField("NPC_Imunidade");
    obj.edit220:setVertTextAlign("leading");
    obj.edit220:setName("edit220");
    obj.edit220:setFontColor("#C0504D");
    obj.edit220:setFontSize(15);
    obj.edit220:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit220, "fontStyle",  "bold");
    obj.edit220:setFontFamily("kalam");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.rectangle17);
    obj.edit221:setTransparent(true);
    obj.edit221:setLeft(100);
    obj.edit221:setTop(290);
    obj.edit221:setWidth(25);
    obj.edit221:setHeight(30);
    obj.edit221:setField("NPC_ATK");
    obj.edit221:setVertTextAlign("leading");
    obj.edit221:setName("edit221");
    obj.edit221:setFontColor("#C0504D");
    obj.edit221:setFontSize(15);
    obj.edit221:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit221, "fontStyle",  "bold");
    obj.edit221:setFontFamily("kalam");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.rectangle17);
    obj.edit222:setTransparent(true);
    obj.edit222:setLeft(55);
    obj.edit222:setTop(315);
    obj.edit222:setWidth(25);
    obj.edit222:setHeight(30);
    obj.edit222:setField("NPC_ATK1");
    obj.edit222:setVertTextAlign("leading");
    obj.edit222:setName("edit222");
    obj.edit222:setFontColor("#C0504D");
    obj.edit222:setFontSize(15);
    obj.edit222:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit222, "fontStyle",  "bold");
    obj.edit222:setFontFamily("kalam");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.rectangle17);
    obj.edit223:setTransparent(true);
    obj.edit223:setLeft(125);
    obj.edit223:setTop(315);
    obj.edit223:setWidth(25);
    obj.edit223:setHeight(30);
    obj.edit223:setField("NPC_ATK2");
    obj.edit223:setVertTextAlign("leading");
    obj.edit223:setName("edit223");
    obj.edit223:setFontColor("#C0504D");
    obj.edit223:setFontSize(15);
    obj.edit223:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit223, "fontStyle",  "bold");
    obj.edit223:setFontFamily("kalam");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.rectangle17);
    obj.edit224:setTransparent(true);
    obj.edit224:setLeft(190);
    obj.edit224:setTop(315);
    obj.edit224:setWidth(25);
    obj.edit224:setHeight(30);
    obj.edit224:setField("NPC_ATK3");
    obj.edit224:setVertTextAlign("leading");
    obj.edit224:setName("edit224");
    obj.edit224:setFontColor("#C0504D");
    obj.edit224:setFontSize(15);
    obj.edit224:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit224, "fontStyle",  "bold");
    obj.edit224:setFontFamily("kalam");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.rectangle17);
    obj.edit225:setTransparent(true);
    obj.edit225:setLeft(185);
    obj.edit225:setTop(420);
    obj.edit225:setWidth(25);
    obj.edit225:setHeight(30);
    obj.edit225:setField("NPC_DEF");
    obj.edit225:setVertTextAlign("leading");
    obj.edit225:setName("edit225");
    obj.edit225:setFontColor("#C0504D");
    obj.edit225:setFontSize(15);
    obj.edit225:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit225, "fontStyle",  "bold");
    obj.edit225:setFontFamily("kalam");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.rectangle17);
    obj.edit226:setTransparent(true);
    obj.edit226:setLeft(55);
    obj.edit226:setTop(445);
    obj.edit226:setWidth(25);
    obj.edit226:setHeight(30);
    obj.edit226:setField("NPC_DEF1");
    obj.edit226:setVertTextAlign("leading");
    obj.edit226:setName("edit226");
    obj.edit226:setFontColor("#C0504D");
    obj.edit226:setFontSize(15);
    obj.edit226:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit226, "fontStyle",  "bold");
    obj.edit226:setFontFamily("kalam");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.rectangle17);
    obj.edit227:setTransparent(true);
    obj.edit227:setLeft(125);
    obj.edit227:setTop(445);
    obj.edit227:setWidth(25);
    obj.edit227:setHeight(30);
    obj.edit227:setField("NPC_DEF2");
    obj.edit227:setVertTextAlign("leading");
    obj.edit227:setName("edit227");
    obj.edit227:setFontColor("#C0504D");
    obj.edit227:setFontSize(15);
    obj.edit227:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit227, "fontStyle",  "bold");
    obj.edit227:setFontFamily("kalam");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.rectangle17);
    obj.edit228:setTransparent(true);
    obj.edit228:setLeft(190);
    obj.edit228:setTop(445);
    obj.edit228:setWidth(25);
    obj.edit228:setHeight(30);
    obj.edit228:setField("NPC_DEF3");
    obj.edit228:setVertTextAlign("leading");
    obj.edit228:setName("edit228");
    obj.edit228:setFontColor("#C0504D");
    obj.edit228:setFontSize(15);
    obj.edit228:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit228, "fontStyle",  "bold");
    obj.edit228:setFontFamily("kalam");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle17);
    obj.layout147:setLeft(40);
    obj.layout147:setTop(350);
    obj.layout147:setWidth(200);
    obj.layout147:setHeight(75);
    obj.layout147:setName("layout147");

    obj.NPC_DescATK = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescATK:setParent(obj.layout147);
    obj.NPC_DescATK:setName("NPC_DescATK");
    obj.NPC_DescATK:setFontFamily("kalam");
    obj.NPC_DescATK:setWidth(200);
    obj.NPC_DescATK:setHeight(75);
    obj.NPC_DescATK:setFontSize(13);
    obj.NPC_DescATK:setFontColor("#548DD4");
    obj.NPC_DescATK:setField("NPC_DescATK");
    obj.NPC_DescATK:setTransparent(true);

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle17);
    obj.layout148:setLeft(40);
    obj.layout148:setTop(480);
    obj.layout148:setWidth(220);
    obj.layout148:setHeight(60);
    obj.layout148:setName("layout148");

    obj.NPC_DescDEF = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_DescDEF:setParent(obj.layout148);
    obj.NPC_DescDEF:setName("NPC_DescDEF");
    obj.NPC_DescDEF:setFontFamily("kalam");
    obj.NPC_DescDEF:setWidth(220);
    obj.NPC_DescDEF:setHeight(60);
    obj.NPC_DescDEF:setFontSize(13);
    obj.NPC_DescDEF:setFontColor("#548DD4");
    obj.NPC_DescDEF:setField("NPC_DescDEF");
    obj.NPC_DescDEF:setTransparent(true);

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle17);
    obj.layout149:setLeft(315);
    obj.layout149:setTop(159);
    obj.layout149:setWidth(230);
    obj.layout149:setHeight(150);
    obj.layout149:setName("layout149");

    obj.NPC_Equip = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Equip:setParent(obj.layout149);
    obj.NPC_Equip:setName("NPC_Equip");
    obj.NPC_Equip:setFontFamily("kalam");
    obj.NPC_Equip:setWidth(230);
    obj.NPC_Equip:setHeight(150);
    obj.NPC_Equip:setFontSize(13);
    obj.NPC_Equip:setFontColor("#548DD4");
    obj.NPC_Equip:setField("NPC_Equip");
    obj.NPC_Equip:setTransparent(true);

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle17);
    obj.layout150:setLeft(275);
    obj.layout150:setTop(355);
    obj.layout150:setWidth(250);
    obj.layout150:setHeight(1800);
    obj.layout150:setName("layout150");

    obj.NPC_Circunstancia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.NPC_Circunstancia:setParent(obj.layout150);
    obj.NPC_Circunstancia:setName("NPC_Circunstancia");
    obj.NPC_Circunstancia:setFontFamily("kalam");
    obj.NPC_Circunstancia:setWidth(250);
    obj.NPC_Circunstancia:setHeight(180);
    obj.NPC_Circunstancia:setFontSize(13);
    obj.NPC_Circunstancia:setFontColor("#548DD4");
    obj.NPC_Circunstancia:setField("NPC_Circunstancia");
    obj.NPC_Circunstancia:setTransparent(true);


					function rolarDado(sheet)
					  local minhaMesa = Firecast.getRoomOf(sheet)
					  if minhaMesa == nil then
						-- A sheet não está associada a uma sala no Firecast, então não podemos rolar dados
						return
					  end
					
					  local chat = minhaMesa.chat
					
					  -- Definir tabela de mapeamento de resultados
					  local mapeamento = {
						[1] = "Boneco de Ação, Balança de Precisão",
						[2] = "Livro de Endereços, Roupa de Couro, Carteira de cigarros 2d10",
						[3] = "Ataduras Adesivas, Tecido, Caixa de munição Fuzil",
						[4] = "Compressor De Ar, Barbeador Elétrico, Câmera Tecpix",
						[7] = "Purificador de ar. Óleo Lubrificante Anal",
						[8] = "Secretária Eletrônica, Camisinhas, Cabeça de Manequim",
						[9] = "Antissépticos, Frascos, Pólvora, Lata de Tinta",
						[10] = "CD de Áudio, Radio de Pilha, 1d10 Comida enlatada. Como rações.",  
						[12] = "Mamadeira, Leite em Pó, Caneta, Tanque de hidrogênio explosivo, d10 de dano em um raio de 5m",
						[13] = "Monitor e Receptor de Bebê, Filtro para Máscara de Gás",
						[14] = "Assadeira, Bolsa com Artigos Esportivos",
						[15] = "Bandagem Grande, Material Esterilizante",
						[16] = "Bola de Beisebol, Colete a Prova de Balas", 
						[17] = "Luva de Beisebol, Máscara de Beisebol, Pacote de Cocaína",
						[18] = "Bola de Basquete, Tênis Adidas, Poster Cristiano Ronaldo",  
						[19] = "Balança de Banheiro, Silver Tape, Tanque de hélio, o suficiente para encher 30 balões. Quando inalado, bônus de +2 em testes de disfarçar a voz de criança por 1 minuto.",
						[20] = "Bateria, Playboy, Vibrador, Munição d10",
						[21] = "Carregador de Bateria, Fone de Ouvido",
						[22] = "Arma de Brinquedo, Bola de Futebol, Rifle Destruído",
						[23] = "Munição de Pistola, Televisão Portátil",
						[24] = "Lençol, Pinto de Borracha, Contador de Radiação",
						[25] = "Sino, Caixinha Bailarina, 1d10 barras de proteína.",
						[26] = "Bicicleta de Criança e Esportiva, Ácido Corrosivo", 
						[27] = "Carrinho de Supermercado, Controle de Vídeo Game",
						[28] = "Sino de Bicicleta, Roupa de Ciclista, Machado de Incêndio",
						[29] = "Capacete de Bicicleta, Óculos de sol Importado",
						[30] = "Binóculos, Bilhete com Senha de Cofre",
						[31] = "Manguito de Pressão Arterial, Estetoscópio",
						[32] = "Jogo de Tabuleiro, Cartas Eróticas, Mochila Velha",
						[33] = "Livro, Tablet da Apple, Coleira de Cachorro",
						[34] = "Bola de Boliche, Televisão, Chopeira",
						[35] = "Pino de Boliche, Esmaltes de Unhas",
						[36] = "Míni Serra, Martelo, Graxa, Garrafas de Vinho",
						[37] = "Caixa à Prova de Fogo e Água, com Chave",
						[38] = "Luvas de Boxe, Saco de Luta, Oculos Escuro Aviador",
						[39] = "Kit de Maquiagem, Máscara de Gás, Motoserra", 
						[40] = "Exterminador de Insetos, Isqueiro",
						[41] = "Alicate de Corte de Cabo, Saco de Cimento 50 Kg",
						[42] = "Abraçadeiras Saco com 100, Máscara de Gás", 
						[43] = "Calculadora, Painel Solar, 1d10 Baterias",
						[44] = "Computador, Kit de Unha, Saca Rolhas",
						[45] = "Câmera infravermelho, Micro-ondas, Kit Primeiro Socorros",
						[46] = "Barraca de Acampamento, 8 pessoas",
						[47] = "Cigarros 2d10, Mapa e Bilhete, Lanterna sem Pilhas",
						[48] = "Abridor de Latas, Caixinha de Fosforo.",
						[49] = "Vela, Sapatos Femininos, Roupas Femininas",
						[50] = "Canos hidráulicos, Jogo de Panelas, Lata de Gasolina",
						[51] = "Reservatório de Água Potável, Soco Inglês",
						[52] = "Revolver Velho, Cantil, Luvas Esportivas",
						[53] = "Controle de Garagem, Pilhas, Caixa de Metal", 
						[54] = "Kit de Primeiro Socorros, Papel Higiênico,",
						[55] = "Enlatados, Wisky, Bola de Futebol,",
						[56] = "Espada do Conan, Cinto, Cabeça Empalada",
						[57] = "Secador, Compressor, Violão, Cigarros 2d10",
						[58] = "Capa de Chuva, Kit de Solda",
						[59] = "Distintivo Policial, Pistola, Espelho",
						[60] = "Livro de Receitas, Baú Metal Com Dinheiro",
						[61] = "Barril de Chope Metal, Cilindro para Fermentação",
						[62] = "Material para Peixes e Anfíbios, Vara de Pesca",
						[63] = "Roupa de Guarda de Transito, Par de Algemas",
						[64] = "Absorvente, Pilulas Anticoncepcionais, Remédio Abortivo",
						[65] = "Cilindro de Gás Letal, Cilindro de Oxigênio, Motor", 
						[66] = "Central Radio Comunicador, Granadas, Lâmpadas",
						[67] = "Microscópio, Iodo, Fogão Portátil, Bomba não detonada. Qualquer impacto forte fará com que ele exploda. D10 de dano em um raio de 5m. Pesado, pode ser largado ou catapultado, mas não arremessado com os braços.",
						[68] = "Corda de Alpinismo, Cabide, Linha de Pesca, Iscas",
						[69] = "Impressora, Álbum Completo Michael Jackson",
						[70] = "Laser Verde, Cadeado Resistente com Chaves",
						[71] = "Disquete Velho, Roupa do Super Homem, Homem Aranha",
						[72] = "Moto Guardada, Chaves Reservas, Caixa Fechada - Surpresa",
						[73] = "Ração de Cachorro, Gato Animal Com Filhotes, Vídeo Game",
						[74] = "Canoa Esportiva, Nadadeiras, Mala de Senha Fechado",
						[75] = "Extintor de Incêndio, Galão de Gasolina",
						[76] = "Velas de Rituais, Cadeira de Massagem, Esteira",
						[77] = "Crucifixo, Bandeira Americana Velha, Roupa de Padre",
						[78] = "DVD de Sexo Gay, Paraquedas, Botas Militar",
						[79] = "Carro de Controle Remoto, Remédios",
						[80] = "Cabo de Chupeta, Cortador de Grama",
						[81] = "Colar Cervical, Bateria de Carro, Ventilador Industrial",
						[82] = "Armadura Medieval, Moto Serra, Caixa de Reparo",
						[83] = "Armadilha Bomba Caseira, Caixa Aberta de Metal Resistente",
						[84] = "Carrinho Improvisado de Combustível",
						[85] = "Aparelho GPS, Chaves de uma Embarcação",
						[86] = "Cinto de Acessórios, Guarda Chuva, Kit Odontológico",
						[87] = "Cesto de Carregar Animal, Isqueiro Velho",
						[88] = "Armadilha de Urso, Caixa de Pregos",
						[89] = "Mochila de Hidratação, Revolver Enferrujado",
						[90] = "Caixa de Coca Cola, Um saco de fertilizante de 50 kg.",
						[91] = "Relógio de Pulso, Pá Militar, Comprimidos. Cure 1d3 de saúde. Chance de salvar contra veneno ou usar para perder 2 pontos de um valor aleatório em Atributo.",
						[92] = "Pé de Cabra, Pesos Para Academia",
						[93] = "Serra Manual de Construção",
						[94] = "Arma de Paintball, Corda, Algema",
						[95] = "Guitarra, Alarme Despertador",
						[96] = "Filtro para Aquário, Desentupidor de Borracha",
						[97] = "Sino de Vento Sonoro com Pequenos Metais Brilhantes",
						[98] = "Sensor de Presença Sonoro",
						[99] = "Chocalho, Megafone, Cordas de Violão",
						[100] = "Sensor de Estacionamento Wifi",
						[101] = "Uma bateria de carro descarregada. Contém ácido sulfúrico: veneno (1d10).",
						[102] = "Uniforme Do Exercito Alemão",
						[103] = "Alicate Cortador de Cerca, Bússola",
						[104] = "Coldre, Lâmpadas, Liquidificador",
						[105] = "Bastão de Luz Química Laranja",
						[106] = "Máscara de gás - 1 Filtro, Isqueiro",
						[107] = "Cigarro (1- 20), Bola de Tênis",
						[108] = "Mapa, Atlas Marcado Com Estradas",
						[109] = "Rádio Comunicador Simples",
						[110] = "Apito para Cachorro, Bíblia Sagrada",
						[111] = "Microscópio, Frascos Cilíndricos de Vidro, Frascos Quimicos",
						[112] = "Chaves de um Helicóptero, Quepe Policial",
						[113] = "Cela de Cavalo para Montaria",
						[114] = "Armadilha Improvisada Escopeta",
						[115] = "Peruca, Seios de Silicone, Lanterna Velha",
						[116] = "Corda (9 Metros), Boneco UFC",
						[117] = "Saco com Drogas, Centrifuga, Produtos Químicos", 
						[118] = "Gerador de Energia, Ração para Aves 50 kg",
						[119] = "Correntes de Metal 5 Metros",
						[120] = "Moto de Trilha, Triciclo, Não Possui Chaves",
						[121] = "Maquininha de Tatuagem, Kit Instrumentais Cirúrgicos",
						[122] = "Detector de Monóxido de Carbono",
						[123] = "Carrinho de Bebê, Chá Calmante",
						[124] = "Caixa de Metal com Dinheiro - Possui Chave",
						[125] = "Fita Isolante, Boné de Personagem",
						[126] = "Braçadeira, Medidor de Barulho Sonoro",
						[127] = "Telefone Celular, Serra Circular",
						[128] = "Tigela de Cerâmica, Arame Farpado",
						[129] = "Fato Químico Encapsulado",
						[130] = "Cinzel, Lamparina, Cadeira Dobrável",
						[131] = "Frascos de Vacina Animal",
						[132] = "Martelo de Garra, Luvas, Apito de Segurança",
						[133] = "Lâmpada, Tridente, Roupa de Jardinagem",
						[134] = "Relógio Digital + Rádio, Livro de Jardinagem",
						[135] = "Ferro de Passar Roupas Elétrico",
						[136] = "Cafeteira Elétrica, Pacote de Rosquinha",
						[137] = "Pinto de Borracha, Camisinhas, Peruca",
						[138] = "Revista em Quadrinhos, Berrante, Botas de Boiadeiro de Couro",
						[139] = "Mouse de Computador, com fio, HD Externo",
						[140] = "Mouse de Computador, sem fio, Autoclave, Laringoscópio (Para Ventilação)",
						[141] = "Alto-Falantes de Computador, Cinto de Granada",
						[142] = "Controle de Videogame, Fone de Ouvido",
						[143] = "Refrigerador, Pendulo Para Carnes Bovinas",
						[144] = "Lápis de Cor 15 Cores, Mochila, Pistola de Cola Quente",
						[145] = "Chave inglesa 74, Coo-ler com Rodinhas",
						[146] = "Ferramenta de Crimpagem, Solda, Materiais de Construção Civil",
						[147] = "Pé-De-Cabra, Materiais de Construção Civil, Britadeira",
						[148] = "Muleta de Alumínio, Galão de Gasolina",
						[149] = "Relógio Cuco, Quarto Completo, Posteres de Ídolos",
						[150] = "Forma de Bolo, Copos em Metal, Laptop velho e pesado. Teste de Sorte para que ainda funcione. Qual poderia ser a senha?",
						[151] = "Lâmpada de Mesa, Estoque de Bebidas Alcoólicas",
						[152] = "Grampeador de Mesa, Lanche Rápido - Batata - Bolacha",
						[153] = "Reprodutor de Música Digital (8 GB Com Cabo)",
						[154] = "Termômetro Digital, Cozinha Completa",
						[155] = "Tigela de Cachorro, Livro Religioso",
						[156] = "Náilon, Ferramentas de Construção, Arame Farpado",
						[157] = "Coleira de Cão com Espinhos, Panela de Pressão",
						[158] = "Granada de Fumaça, Pneus Veicular",
						[158] = "Torradeira Elétrica, Caixa de Temperos para as Refeições", 
						[159] = "Manivela, Caixa De Sementes",
						[160] = "Silver Tape, Toca Disco, Bumerangue",
						[161] = "Pá de Lixo, Bombinhas de São João",
						[162] = "DVD virgem, Bastão de Beisebol",
						[163] = "Filme O Poderoso Chefão, Xuxa",
						[164] = "Chaleira Elétrica, Lanche Rápido - Doritos",
						[165] = "Lixadeira Elétrica, Fita Isolante, Chave de Roda",
						[166] = "Cabo de Extensão Elétrico, 10 Metros",
						[168] = "Silver Tape, Espada de Bambu, Chapéu",
						[169] = "Cabo Eletrônico 5 metros, Água Mineral, Entalado Sardinha",
						[170] = "Quadro de Pintura para Desenho",
						[171] = "Ventilador, Televisão Fina, Óculos de Grau",
						[172] = "Furadeira, Coquetel Molotov",
						[173] = "Álcool, Alarme Antigo, Pedaços de Pano",
						[174] = "Fogos de Artifício Bombinhas, Rojão",
						[175] = "Antena de Comunicação, Walkie Tock do BEN-10",
						[176] = "Partes de Circuito, Fios Elétricos Simples",
						[178] = "Componentes Para Armas de Fogo, Molas, Lubrificantes",
						[179] = "CDs de Música e DvD Infantis, Panela Elétrica",
						[180] = "Vídeo Cassete, Camiseta Assinado Pela Madona",
						[181] = "Notebook, Spray de Tinta, Caixa de Fosforo (D10)",
						[182] = "Caixa de Munição, Detector de Fumaça",
						[183] = "Ursinho de Pelúcia, Bichinho que aperta e faz Barulho",
						[184] = "Artefato Explosivo, Dinamite",
						[185] = "Caixa de Produtos Químicos Perigosos, Microfone",
						[186] = "Agrotóxico, Borrifador Mecânico",
						[187] = "Kit Médico Cirúrgico (Instrumentais)",
						[188] = "Peças Mecânicas Automotivas, Colete", 
						[189] = "Kit de Itens Esportivos, Taco de Sinuca, Bolas de Bilhar",
						[190] = "Botijão de Gás, Chapinha de Cabelo",
						[191] = "Placa de Energia Solar, Mini Vaso Químico Portátil",
						[192] = "Vara de Pesca, Flechas, Bebedouro Desativado",
						[193] = "Fação, Espada de Samurai",
						[194] = "Alvo Para Tiro, Bandana de Rock",
						[195] = "Aquecedor Elétrico, Esqueleto de Manequim",
						[196] = "Material Higiênico, Alternador de Eletricidade",
						[196] = "Aparelhagem de Raio-x, Instrumentos Odontológicos",
						[197] = "Granada, Revista Playboy",
						[198] = "Otorrinolaringologia, Bico de Pato (Genecologia)",
						[199] = "Anotações Importantes, Cadeira de Rodas",
						[200] = "Pistola Sinalizadora Laranja, Colete Salva-Vivas",
						[201] = "Flecha Com Ponta Explosiva, Botas Militares",
						[202] = "Claymore, Colete Militar, Poster do Rambo",
						[203] = "Dinamites - Instáveis Vazando Óleo",
						[204] = "Cela de Montaria, Ração Animal",
						[205] = "2 pneus de trator velho, óculos de aros de metal quebrados",
						[206] = "Serra de madeira sem corte",
						[207] = "Pés de pranchas 2x4punhado de pregos enferrujados",
						[208] = "Pote de cola de madeira, enxada de jardim",
						[209] = "Olho de vidro, Cadeira de massagem com Circuitos",
						[210] = "Cutelo de açougueiro enferrujado, Cama de Massagem com Circuitos",
						[211] = "Carrinho de compras, Walkie Talkie, Foto de Crianças",
						[212] = "Kit de costura pessoal, Sino de mão, Câmera Roll D8 [1-6: Quebrado; 7-8: Contém Filme]",
						[213] = "Agulha de Tricô, Rolo D20 Enfeites de Natal, Proteção Torso + Capacete",
						[214] = "Caneca de Café, Urso Teddy, Caneta Tinteira, Fogão Portátil, Torso de Manequim",
						[215] = "Foto Emoldurada de Político do Velho Mundo, Mapa Topográfico Subaquático",
						[216] = "Cardápio do Restaurante, Carro de Brinquedo Eletrico",
						[217] = "Rolos de cabelo, Espátula de jardinagem, Frasco Anéstésico 1d10",
						[218] = "Macarrão Seco, Maconha Prensada, Livro Intacto, Cofre",
						[219] = "Lanterna de Helicóptero, Crânio Humano Carbonizado, Carcaça de Helicóptero",
						[220] = "Botas de Alpinismo, Placa de Carro, Caça-Níquel de Alavanca, Agulha Hipodérmica",
						[221] = "Garrafa de Café Vazia - Moedas Antigas, Garrafa de Uísque",
						[222] = "Caixas com D30 Vidro Ornamentais, Boneca Falante Pilhas no Final",
						[223] = "Bolso Cheio de Moedas, Revista de Mulheres Peladas",
						[224] = "Volante, Triciclo de Criança, Bule Para Chá, Roupa do Papai Noel",
						[225] = "Espelho de Mão, iPod, Panela de Arroz Elétrica",
						[226] = "Pequena Célula de Energia, Rádio Comunicador",
						[227] = "Guarda-Chuva, Sutiã de Mulher, Sinta Liga",
						[228] = "Perfume, Cloro, Desinfetante, Máscara para Mergulho com Canudo",
						[229] = "Rodinha de Academia Abdominal, Barra de Metal para Parede (Exercícios)",
						[230] = "Peixe - Taxidermia, Manequim de Poliuretano Para Empalhamento.",
						[231] = "Disco de Vinil (D10) mochila (role 3 vezes (AQUI NA LISTA) para ver o conteúdo)",
						[232] = "Jarra Cheia de Areia, Rolo de caixa de chumbo 1d10 x Rolo 1d10 x 16",
						[233] = "Rolo D10 Blocos de Brinquedo de Madeira, Caixa de Fósforos",
						[234] = "Saco de Mármores Role 2d12 Mármores, Livro de Contos Infantis",
						[235] = "Capa de Bolo de Casamento, Vela de Parafina, Secador de Cabelo",
						[236] = "Meia Usada, Pedra de Amolar, Revista de Publicação para Adultos (Gay - Zoofilia)",
						[237] = "Enlatados, Celular Rosa, Manequim de Ferro, Aquecedor Elétrico de Água",
						[238] = "Engrenagens Mecânicas, Drone sem Controle e Bateria",
						[239] = "Caixa de Música, Role D4 (1-2 Defeitos / 3-4 Funcionando)",
						[240] = "Caixão, Tamanho Infantil, Formol, Corpos Dissecados",
						[241] = "Rádio Portátil, Pato de Borracha, Toalha de chá, Esqueleto de Brinquedo",
						[242] = "Traje Quimico. Protege contra radiação e veneno transportado pelo ar. Sem valor de armadura, mas ocupa espaço de armadura. Perde a utilidade quando danificado.243 - Barco de Remo, Roupa de Ski, Equipamento de Escalada",
						[244] = "Cofre Antigo Velho, Anão de Jardim, Carrinho do Papai Noel",
						[245] = "Maquina de Refrigerante e Salgadinhos Antigo, Almofada Macia Com Plumas",
						[246] = "Cadeira de Balanço, Concha de Praia, Ração de Comida Canina",
						[247] = "Cinto de Couro, Caneta, Lâmpada Com Sensor de Presença",
						[248] = "Caixa de Lâmpadas, Roll D30 Intactas",
						[249] = "Saco de Cimento (Usado), Tinta Vermelha para Parede",
						[250] = "Prótese Dentaria, Caneta Motor de Dentista, Remédios Anti-inflamatórios",
						[251] = "Espelho, Pente, Kit Higiênico, Esmalte de Unha, Peruca Loira",
						[252] = "Cabo de Bateria, Aparelho Medidor de Radiação",
						[253] = "Jarra Contendo Dentes D12, Feto em Conserva, Instrumentos de Parto",
						[254] = "Faca, Diagrama de Chip de Água Carbonizada",
						[255] = "Medidor de Velocidade, Medidor de Temperatura Corporal", 
					  }
					
					  -- Inicializar gerador de números aleatórios
					  math.randomseed(os.time())
					  math.random() -- descarta o primeiro número gerado
					
					  -- Rolar dado e obter resultado
					  local resultado = math.random(1, 255)
					
					  -- Enviar mensagem com o resultado nomeado
					  if resultado ~= nil then
						local mensagem = "[§B][§K11] Você Encontrou: [§K5][§B]" .. mapeamento[resultado]
						chat:enviarMensagem(mensagem)
					  end
					end
					


    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle2);
    obj.label79:setText("Mochila");
    obj.label79:setWidth(50);
    obj.label79:setHeight(30);
    obj.label79:setTop(180);
    obj.label79:setLeft(1225);
    obj.label79:setFontSize(15);
    obj.label79:setName("label79");
    obj.label79:setFontColor("black");
    obj.label79:setTextTrimming("none");
    obj.label79:setWordWrap(false);
    obj.label79:setAutoSize(true);
    obj.label79:setFontFamily("kalam");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setVertTextAlign("center");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.rectangle2);
    obj.button81:setWidth(100);
    obj.button81:setHeight(100);
    obj.button81:setLeft(1200);
    obj.button81:setTop(200);
    obj.button81:setName("button81");

    obj.image74 = GUI.fromHandle(_obj_newObject("image"));
    obj.image74:setParent(obj.rectangle2);
    obj.image74:setWidth(100);
    obj.image74:setHeight(100);
    obj.image74:setLeft(1200);
    obj.image74:setTop(200);
    obj.image74:setStyle("proportional");
    obj.image74:setCenter(true);
    obj.image74:setSRC("images/Mochila.png");
    obj.image74:setName("image74");

    obj.Botao = GUI.fromHandle(_obj_newObject("layout"));
    obj.Botao:setParent(obj.rectangle2);
    obj.Botao:setName("Botao");
    obj.Botao:setLeft(1193);
    obj.Botao:setTop(703);
    obj.Botao:setWidth(200);
    obj.Botao:setHeight(200);

    obj.image75 = GUI.fromHandle(_obj_newObject("image"));
    obj.image75:setParent(obj.Botao);
    obj.image75:setSRC("images/olho.png");
    obj.image75:setLeft(10);
    obj.image75:setTop(0);
    obj.image75:setWidth(115);
    obj.image75:setHeight(115);
    obj.image75:setCursor("handPoint");
    obj.image75:setHitTest(true);
    obj.image75:setName("image75");

    obj.ItensComuns = GUI.fromHandle(_obj_newObject("image"));
    obj.ItensComuns:setParent(obj.Botao);
    obj.ItensComuns:setSRC("images/Botao.png");
    obj.ItensComuns:setCursor("handPoint");
    obj.ItensComuns:setHitTest(true);
    obj.ItensComuns:setName("ItensComuns");
    obj.ItensComuns:setLeft(0);
    obj.ItensComuns:setTop(100);
    obj.ItensComuns:setWidth(130);
    obj.ItensComuns:setHeight(30);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.Botao);
    obj.label80:setText("Você tem___de Busca");
    obj.label80:setAutoSize(true);
    obj.label80:setWidth(200);
    obj.label80:setFontColor("black");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setFontFamily("kalam");
    obj.label80:setName("label80");
    obj.label80:setTextTrimming("none");
    obj.label80:setWordWrap(false);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.Botao);
    obj.label81:setField("PontosDeBusca");
    obj.label81:setLeft(60);
    obj.label81:setFontColor("red");
    obj.label81:setHitTest(true);
    obj.label81:setCursor("handPoint");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setName("label81");
    obj.label81:setTextTrimming("none");
    obj.label81:setWordWrap(false);
    obj.label81:setAutoSize(true);
    obj.label81:setFontFamily("kalam");

    obj.image76 = GUI.fromHandle(_obj_newObject("image"));
    obj.image76:setParent(obj.rectangle2);
    obj.image76:setSRC("images/Seudinheiro.png");
    obj.image76:setLeft(924);
    obj.image76:setTop(0);
    obj.image76:setWidth(174);
    obj.image76:setHeight(174);
    obj.image76:setCursor("handPoint");
    obj.image76:setHitTest(true);
    obj.image76:setName("image76");

    obj.labSoma3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma3:setParent(obj.rectangle2);
    obj.labSoma3:setFontSize(35);
    obj.labSoma3:setFontColor("lime");
    lfm_setPropAsString(obj.labSoma3, "fontStyle",  "bold");
    obj.labSoma3:setLeft(945);
    obj.labSoma3:setTop(76);
    obj.labSoma3:setWidth(205);
    obj.labSoma3:setHeight(45);
    obj.labSoma3:setName("labSoma3");
    obj.labSoma3:setTextTrimming("none");
    obj.labSoma3:setWordWrap(false);
    obj.labSoma3:setAutoSize(true);
    obj.labSoma3:setFontFamily("kalam");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.labSoma3);
    obj.dataLink16:setField("Soma");
    obj.dataLink16:setName("dataLink16");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle2);
    obj.layout151:setAlign("client");
    obj.layout151:setName("layout151");

    obj.image77 = GUI.fromHandle(_obj_newObject("image"));
    obj.image77:setParent(obj.layout151);
    obj.image77:setSRC("images/NivelDoPlayer.png");
    obj.image77:setLeft(1097);
    obj.image77:setTop(55);
    obj.image77:setWidth(70);
    obj.image77:setHeight(70);
    obj.image77:setCursor("handPoint");
    obj.image77:setHitTest(true);
    obj.image77:setName("image77");

    obj.niveldoPlayer = GUI.fromHandle(_obj_newObject("button"));
    obj.niveldoPlayer:setParent(obj.layout151);
    obj.niveldoPlayer:setName("niveldoPlayer");
    obj.niveldoPlayer:setText("+/-");
    obj.niveldoPlayer:setFontFamily("kalam");
    obj.niveldoPlayer:setLeft(1163);
    obj.niveldoPlayer:setTop(84);
    obj.niveldoPlayer:setWidth(30);
    obj.niveldoPlayer:setHeight(30);
    obj.niveldoPlayer:setFontColor("black");
    lfm_setPropAsString(obj.niveldoPlayer, "fontStyle",  "bold");
    obj.niveldoPlayer:setFontSize(15);

    obj.nivelresetPlayer = GUI.fromHandle(_obj_newObject("button"));
    obj.nivelresetPlayer:setParent(obj.layout151);
    obj.nivelresetPlayer:setName("nivelresetPlayer");
    obj.nivelresetPlayer:setText("R");
    obj.nivelresetPlayer:setFontFamily("kalam");
    obj.nivelresetPlayer:setLeft(1195);
    obj.nivelresetPlayer:setTop(84);
    obj.nivelresetPlayer:setWidth(30);
    obj.nivelresetPlayer:setHeight(30);
    obj.nivelresetPlayer:setFontColor("black");
    lfm_setPropAsString(obj.nivelresetPlayer, "fontStyle",  "bold");
    obj.nivelresetPlayer:setFontSize(15);

    obj.Nivel = GUI.fromHandle(_obj_newObject("label"));
    obj.Nivel:setParent(obj.layout151);
    obj.Nivel:setName("Nivel");
    obj.Nivel:setField("Nivel");
    obj.Nivel:setLeft(1120);
    obj.Nivel:setTop(85);
    obj.Nivel:setFontSize(26);
    obj.Nivel:setFontFamily("arial");
    lfm_setPropAsString(obj.Nivel, "fontStyle",  "bold");
    obj.Nivel:setFontColor("yellow");
    obj.Nivel:setTextTrimming("none");
    obj.Nivel:setWordWrap(false);
    obj.Nivel:setAutoSize(true);

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.Nivel);
    obj.dataLink17:setField("Nivel");
    obj.dataLink17:setName("dataLink17");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Anotação");
    obj.tab2:setName("tab2");

    obj.frmAnotacao = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAnotacao:setParent(obj.tab2);
    obj.frmAnotacao:setName("frmAnotacao");
    obj.frmAnotacao:setAlign("client");
    obj.frmAnotacao:setMargins({top=1});
    obj.frmAnotacao:setTheme("light");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmAnotacao);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox8);
    obj.rectangle18:setWidth(1340);
    obj.rectangle18:setHeight(1500);
    obj.rectangle18:setColor("white");
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle18);
    obj.rectangle19:setLeft(250);
    obj.rectangle19:setTop(10);
    obj.rectangle19:setWidth(800);
    obj.rectangle19:setHeight(650);
    obj.rectangle19:setColor("white");
    obj.rectangle19:setName("rectangle19");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle19);
    obj.label82:setText("DIÁRIO");
    obj.label82:setHeight(30);
    obj.label82:setWidth(770);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setFontFamily("DK Umbilical Noose");
    obj.label82:setFontColor("black");
    obj.label82:setFontSize(30);
    obj.label82:setName("label82");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle19);
    obj.layout152:setLeft(5);
    obj.layout152:setTop(30);
    obj.layout152:setWidth(800);
    obj.layout152:setHeight(580);
    obj.layout152:setName("layout152");

    obj.image78 = GUI.fromHandle(_obj_newObject("image"));
    obj.image78:setParent(obj.layout152);
    obj.image78:setLeft(0);
    obj.image78:setTop(0);
    obj.image78:setWidth(770);
    obj.image78:setHeight(550);
    obj.image78:setSRC("images/diario2.png");
    obj.image78:setStyle("proportional");
    obj.image78:setOptimize(true);
    obj.image78:setAlign("left");
    obj.image78:setName("image78");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout152);
    obj.textEditor22:setFontFamily("kalam");
    obj.textEditor22:setWidth(320);
    obj.textEditor22:setHeight(500);
    obj.textEditor22:setLeft(50);
    obj.textEditor22:setTop(20);
    obj.textEditor22:setFontSize(15);
    obj.textEditor22:setFontColor("black");
    obj.textEditor22:setField("Anotacao1bloco02");
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setName("textEditor22");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.layout152);
    obj.textEditor23:setFontFamily("kalam");
    obj.textEditor23:setWidth(320);
    obj.textEditor23:setHeight(500);
    obj.textEditor23:setLeft(390);
    obj.textEditor23:setTop(20);
    obj.textEditor23:setFontSize(15);
    obj.textEditor23:setFontColor("black");
    obj.textEditor23:setField("Anotacao1bloco01");
    obj.textEditor23:setTransparent(true);
    obj.textEditor23:setName("textEditor23");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle18);
    obj.rectangle20:setLeft(1);
    obj.rectangle20:setTop(680);
    obj.rectangle20:setWidth(1340);
    obj.rectangle20:setHeight(800);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setColor("white");
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setName("rectangle20");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle20);
    obj.label83:setText("ANOTAÇÃO");
    obj.label83:setHeight(30);
    obj.label83:setWidth(1340);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontFamily("DK Umbilical Noose");
    obj.label83:setFontColor("black");
    obj.label83:setFontSize(30);
    obj.label83:setName("label83");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.rectangle20);
    obj.button82:setLeft(2);
    obj.button82:setTop(2);
    obj.button82:setHeight(25);
    obj.button82:setText("Nova");
    obj.button82:setWidth(80);
    obj.button82:setFontFamily("kalam");
    obj.button82:setHint("Adicionar nova linha de anotação.");
    obj.button82:setName("button82");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setLeft(0);
    obj.rectangle21:setTop(99);
    obj.rectangle21:setWidth(401);
    obj.rectangle21:setHeight(501);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setStrokeColor("black");
    obj.rectangle21:setColor("white");
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(5);
    obj.rectangle21:setName("rectangle21");

    obj.rclNote = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclNote:setParent(obj.rectangle20);
    obj.rclNote:setName("rclNote");
    obj.rclNote:setField("NoteL");
    obj.rclNote:setTemplateForm("frmListaNote");
    obj.rclNote:setLeft(1);
    obj.rclNote:setTop(100);
    obj.rclNote:setWidth(398);
    obj.rclNote:setHeight(500);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle20);
    obj.rectangle22:setLeft(449);
    obj.rectangle22:setTop(99);
    obj.rectangle22:setWidth(401);
    obj.rectangle22:setHeight(501);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setStrokeColor("black");
    obj.rectangle22:setColor("white");
    obj.rectangle22:setStrokeSize(2);
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(5);
    obj.rectangle22:setName("rectangle22");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.rectangle20);
    obj.textEditor24:setFontFamily("kalam");
    obj.textEditor24:setWidth(400);
    obj.textEditor24:setHeight(500);
    obj.textEditor24:setLeft(450);
    obj.textEditor24:setTop(100);
    obj.textEditor24:setFontSize(15);
    obj.textEditor24:setFontColor("black");
    obj.textEditor24:setField("Anotacao22");
    obj.textEditor24:setTransparent(true);
    obj.textEditor24:setName("textEditor24");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle20);
    obj.rectangle23:setLeft(900);
    obj.rectangle23:setTop(99);
    obj.rectangle23:setWidth(401);
    obj.rectangle23:setHeight(501);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setStrokeColor("black");
    obj.rectangle23:setColor("white");
    obj.rectangle23:setStrokeSize(2);
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(5);
    obj.rectangle23:setName("rectangle23");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.rectangle20);
    obj.textEditor25:setFontFamily("kalam");
    obj.textEditor25:setWidth(400);
    obj.textEditor25:setHeight(500);
    obj.textEditor25:setLeft(900);
    obj.textEditor25:setTop(100);
    obj.textEditor25:setFontSize(15);
    obj.textEditor25:setFontColor("black");
    obj.textEditor25:setField("Anotacao33");
    obj.textEditor25:setTransparent(true);
    obj.textEditor25:setName("textEditor25");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Historia");
    obj.tab3:setName("tab3");

    obj.frmDZ_Ficha3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDZ_Ficha3_svg:setParent(obj.tab3);
    obj.frmDZ_Ficha3_svg:setName("frmDZ_Ficha3_svg");
    obj.frmDZ_Ficha3_svg:setAlign("client");
    obj.frmDZ_Ficha3_svg:setTheme("light");
    obj.frmDZ_Ficha3_svg:setMargins({top=1});

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmDZ_Ficha3_svg);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.scrollBox9);
    obj.rectangle24:setWidth(1340);
    obj.rectangle24:setHeight(2600);
    obj.rectangle24:setColor("white");
    obj.rectangle24:setName("rectangle24");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle24);
    obj.label84:setFontSize(60);
    obj.label84:setFontColor("#000000");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("center");
    obj.label84:setLeft(500);
    obj.label84:setTop(1);
    obj.label84:setWidth(600);
    obj.label84:setHeight(100);
    obj.label84:setText("HISTORIA");
    obj.label84:setFontFamily("DK Umbilical Noose");
    obj.label84:setName("label84");

    obj.image79 = GUI.fromHandle(_obj_newObject("image"));
    obj.image79:setParent(obj.rectangle24);
    obj.image79:setLeft(1);
    obj.image79:setTop(100);
    obj.image79:setWidth(300);
    obj.image79:setHeight(500);
    obj.image79:setStyle("proportional");
    obj.image79:setHint("Imagem da Personagem");
    obj.image79:setCenter(true);
    obj.image79:setEditable(true);
    obj.image79:setShowProgress(true);
    obj.image79:setField("PlayerII");
    obj.image79:setSRC("silhueta.png");
    obj.image79:setName("image79");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle24);
    obj.layout153:setLeft(313);
    obj.layout153:setTop(100);
    obj.layout153:setWidth(1000);
    obj.layout153:setHeight(2500);
    obj.layout153:setName("layout153");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout153);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#00000000");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
    obj.richEdit1:setField("HistoriaPG");
    lfm_setPropAsString(obj.richEdit1, "hideSelection",  "false");
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Loja");
    obj.tab4:setName("tab4");

    obj.frmLoja_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLoja_svg:setParent(obj.tab4);
    obj.frmLoja_svg:setName("frmLoja_svg");
    obj.frmLoja_svg:setAlign("client");
    obj.frmLoja_svg:setMargins({top=1});
    obj.frmLoja_svg:setTheme("light");

    obj.ApresentaLoja = GUI.fromHandle(_obj_newObject("layout"));
    obj.ApresentaLoja:setParent(obj.frmLoja_svg);
    obj.ApresentaLoja:setName("ApresentaLoja");
    obj.ApresentaLoja:setAlign("client");
    obj.ApresentaLoja:setVisible(true);

    obj.image80 = GUI.fromHandle(_obj_newObject("image"));
    obj.image80:setParent(obj.ApresentaLoja);
    obj.image80:setSRC("images/BoasVindas.png");
    obj.image80:setLeft(0);
    obj.image80:setTop(0);
    obj.image80:setWidth(652);
    obj.image80:setHeight(230);
    obj.image80:setName("image80");

    obj.image81 = GUI.fromHandle(_obj_newObject("image"));
    obj.image81:setParent(obj.ApresentaLoja);
    obj.image81:setLeft(90.25);
    obj.image81:setTop(96.38);
    obj.image81:setWidth(155.25);
    obj.image81:setHeight(45.75);
    obj.image81:setCursor("handPoint");
    obj.image81:setHitTest(true);
    obj.image81:setName("image81");

    obj.image82 = GUI.fromHandle(_obj_newObject("image"));
    obj.image82:setParent(obj.ApresentaLoja);
    obj.image82:setLeft(267.25);
    obj.image82:setTop(96.38);
    obj.image82:setWidth(141);
    obj.image82:setHeight(45.75);
    obj.image82:setCursor("handPoint");
    obj.image82:setHitTest(true);
    obj.image82:setName("image82");

    obj.image83 = GUI.fromHandle(_obj_newObject("image"));
    obj.image83:setParent(obj.ApresentaLoja);
    obj.image83:setLeft(431.25);
    obj.image83:setTop(96.38);
    obj.image83:setWidth(123.25);
    obj.image83:setHeight(45.75);
    obj.image83:setCursor("handPoint");
    obj.image83:setHitTest(true);
    obj.image83:setName("image83");

    obj.LojaDeArmas = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaDeArmas:setParent(obj.frmLoja_svg);
    obj.LojaDeArmas:setName("LojaDeArmas");
    obj.LojaDeArmas:setAlign("client");
    obj.LojaDeArmas:setVisible(false);

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.LojaDeArmas);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("white");
    obj.rectangle25:setName("rectangle25");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.rectangle25);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.scrollBox10);
    obj.button83:setText("reset");
    obj.button83:setLeft(303);
    obj.button83:setName("button83");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.scrollBox10);
    obj.button84:setText("ADD");
    obj.button84:setLeft(303);
    obj.button84:setTop(20);
    obj.button84:setName("button84");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.scrollBox10);
    obj.layout154:setAlign("client");
    obj.layout154:setName("layout154");

    obj.image84 = GUI.fromHandle(_obj_newObject("image"));
    obj.image84:setParent(obj.layout154);
    obj.image84:setSRC("images/dinheiroArma.png");
    obj.image84:setLeft(0);
    obj.image84:setTop(5);
    obj.image84:setWidth(180.37);
    obj.image84:setHeight(80.25);
    obj.image84:setName("image84");

    obj.labSoma2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma2:setParent(obj.layout154);
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

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.labSoma2);
    obj.dataLink18:setField("Soma");
    obj.dataLink18:setName("dataLink18");

    obj.image85 = GUI.fromHandle(_obj_newObject("image"));
    obj.image85:setParent(obj.scrollBox10);
    obj.image85:setLeft(0);
    obj.image85:setTop(0);
    obj.image85:setWidth(130.37);
    obj.image85:setHeight(62.25);
    obj.image85:setHint("Seu dinheiro");
    obj.image85:setCursor("handPoint");
    obj.image85:setHitTest(true);
    obj.image85:setName("image85");

    obj.image86 = GUI.fromHandle(_obj_newObject("image"));
    obj.image86:setParent(obj.scrollBox10);
    obj.image86:setSRC("images/botaoVoltar.png");
    obj.image86:setLeft(200);
    obj.image86:setTop(29);
    obj.image86:setWidth(50);
    obj.image86:setHeight(50);
    obj.image86:setCursor("handPoint");
    obj.image86:setHint("Clique aqui para voltar");
    obj.image86:setHitTest(true);
    obj.image86:setName("image86");

    obj.Arma1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma1:setParent(obj.scrollBox10);
    obj.Arma1:setName("Arma1");
    obj.Arma1:setWidth(480);
    obj.Arma1:setHeight(174);
    obj.Arma1:setLeft(0);
    obj.Arma1:setTop(88);

    obj.image87 = GUI.fromHandle(_obj_newObject("image"));
    obj.image87:setParent(obj.Arma1);
    obj.image87:setSRC("images/Loja.png");
    obj.image87:setLeft(0);
    obj.image87:setTop(0);
    obj.image87:setWidth(399);
    obj.image87:setHeight(174);
    obj.image87:setName("image87");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.Arma1);
    obj.label85:setLeft(22.25);
    obj.label85:setTop(20.50);
    obj.label85:setWidth(107.25);
    obj.label85:setHeight(37.88);
    obj.label85:setFontSize(22);
    obj.label85:setHint("Preço da Arma");
    obj.label85:setField("Preco");
    obj.label85:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontColor("yellow");
    obj.label85:setFontFamily("kalam");
    obj.label85:setCursor("handPoint");
    obj.label85:setHitTest(true);
    obj.label85:setName("label85");

    obj.image88 = GUI.fromHandle(_obj_newObject("image"));
    obj.image88:setParent(obj.Arma1);
    obj.image88:setLeft(41.38);
    obj.image88:setTop(61.75);
    obj.image88:setWidth(67.88);
    obj.image88:setHeight(30);
    obj.image88:setCursor("handPoint");
    obj.image88:setHitTest(true);
    obj.image88:setHint("Clique aqui para comprar");
    obj.image88:setName("image88");

    obj.image89 = GUI.fromHandle(_obj_newObject("image"));
    obj.image89:setParent(obj.Arma1);
    obj.image89:setLeft(2.56);
    obj.image89:setTop(93.00);
    obj.image89:setWidth(136.69);
    obj.image89:setHeight(77.69);
    obj.image89:setStyle("proportional");
    obj.image89:setCenter(true);
    obj.image89:setEditable(true);
    obj.image89:setField("ImagemArma");
    obj.image89:setName("image89");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.Arma1);
    obj.label86:setLeft(197);
    obj.label86:setTop(10);
    obj.label86:setWidth(249.25);
    obj.label86:setHeight(39);
    obj.label86:setFontSize(22);
    obj.label86:setField("ItemNome");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setFontColor("black");
    obj.label86:setFontFamily("kalam");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.Arma1);
    obj.label87:setLeft(207.88);
    obj.label87:setTop(51);
    obj.label87:setWidth(49.88);
    obj.label87:setHeight(31.38);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("Iniciativa");
    obj.label87:setFontSize(19);
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setFontColor("black");
    obj.label87:setFontFamily("kalam");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.Arma1);
    obj.label88:setLeft(182.88);
    obj.label88:setTop(90);
    obj.label88:setWidth(50.88);
    obj.label88:setHeight(31.38);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setField("DanoItem");
    obj.label88:setFontSize(19);
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setFontColor("black");
    obj.label88:setFontFamily("kalam");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.Arma1);
    obj.label89:setLeft(195.88);
    obj.label89:setTop(128);
    obj.label89:setWidth(50.88);
    obj.label89:setHeight(32);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setField("Alcance");
    obj.label89:setFontSize(15);
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setFontColor("black");
    obj.label89:setFontFamily("kalam");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.Arma1);
    obj.label90:setLeft(317.88);
    obj.label90:setTop(49);
    obj.label90:setWidth(68.88);
    obj.label90:setHeight(32);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setField("Cadencia");
    obj.label90:setFontSize(19);
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setFontColor("black");
    obj.label90:setFontFamily("kalam");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.Arma1);
    obj.label91:setLeft(317.88);
    obj.label91:setTop(89);
    obj.label91:setWidth(68.88);
    obj.label91:setHeight(32);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setField("Municao");
    obj.label91:setFontSize(19);
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontColor("black");
    obj.label91:setFontFamily("kalam");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.Arma1);
    obj.label92:setLeft(317.88);
    obj.label92:setTop(125);
    obj.label92:setWidth(48.12);
    obj.label92:setHeight(32);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setField("ClasseDeDureza");
    obj.label92:setFontSize(19);
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setFontColor("black");
    obj.label92:setFontFamily("kalam");
    obj.label92:setName("label92");

    obj.Arma2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma2:setParent(obj.scrollBox10);
    obj.Arma2:setName("Arma2");
    obj.Arma2:setWidth(480);
    obj.Arma2:setHeight(174);
    obj.Arma2:setLeft(0);
    obj.Arma2:setTop(270);

    obj.image90 = GUI.fromHandle(_obj_newObject("image"));
    obj.image90:setParent(obj.Arma2);
    obj.image90:setSRC("images/Loja.png");
    obj.image90:setLeft(0);
    obj.image90:setTop(0);
    obj.image90:setWidth(399);
    obj.image90:setHeight(174);
    obj.image90:setName("image90");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.Arma2);
    obj.label93:setLeft(22.25);
    obj.label93:setTop(20.50);
    obj.label93:setWidth(107.25);
    obj.label93:setHeight(37.88);
    obj.label93:setFontSize(22);
    obj.label93:setHint("Preço da Arma");
    obj.label93:setField("Preco2");
    obj.label93:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setFontColor("yellow");
    obj.label93:setFontFamily("kalam");
    obj.label93:setCursor("handPoint");
    obj.label93:setHitTest(true);
    obj.label93:setName("label93");

    obj.image91 = GUI.fromHandle(_obj_newObject("image"));
    obj.image91:setParent(obj.Arma2);
    obj.image91:setLeft(41.38);
    obj.image91:setTop(61.75);
    obj.image91:setWidth(67.88);
    obj.image91:setHeight(30);
    obj.image91:setCursor("handPoint");
    obj.image91:setHitTest(true);
    obj.image91:setHint("Clique aqui para comprar");
    obj.image91:setName("image91");

    obj.image92 = GUI.fromHandle(_obj_newObject("image"));
    obj.image92:setParent(obj.Arma2);
    obj.image92:setLeft(2.56);
    obj.image92:setTop(93.00);
    obj.image92:setWidth(136.69);
    obj.image92:setHeight(77.69);
    obj.image92:setStyle("proportional");
    obj.image92:setCenter(true);
    obj.image92:setEditable(true);
    obj.image92:setField("ImagemArma2");
    obj.image92:setName("image92");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.Arma2);
    obj.label94:setLeft(197);
    obj.label94:setTop(10);
    obj.label94:setWidth(249.25);
    obj.label94:setHeight(39);
    obj.label94:setFontSize(22);
    obj.label94:setField("ItemNome2");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setFontColor("black");
    obj.label94:setFontFamily("kalam");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.Arma2);
    obj.label95:setLeft(207.88);
    obj.label95:setTop(51);
    obj.label95:setWidth(49.88);
    obj.label95:setHeight(31.38);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("Iniciativa2");
    obj.label95:setFontSize(19);
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setFontColor("black");
    obj.label95:setFontFamily("kalam");
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.Arma2);
    obj.label96:setLeft(182.88);
    obj.label96:setTop(90);
    obj.label96:setWidth(50.88);
    obj.label96:setHeight(31.38);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setField("DanoItem2");
    obj.label96:setFontSize(19);
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setFontColor("black");
    obj.label96:setFontFamily("kalam");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.Arma2);
    obj.label97:setLeft(195.88);
    obj.label97:setTop(128);
    obj.label97:setWidth(50.88);
    obj.label97:setHeight(32);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setField("Alcance2");
    obj.label97:setFontSize(15);
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setFontColor("black");
    obj.label97:setFontFamily("kalam");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.Arma2);
    obj.label98:setLeft(317.88);
    obj.label98:setTop(49);
    obj.label98:setWidth(68.88);
    obj.label98:setHeight(32);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setField("Cadencia2");
    obj.label98:setFontSize(19);
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");
    obj.label98:setFontColor("black");
    obj.label98:setFontFamily("kalam");
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.Arma2);
    obj.label99:setLeft(317.88);
    obj.label99:setTop(89);
    obj.label99:setWidth(68.88);
    obj.label99:setHeight(32);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setField("Municao2");
    obj.label99:setFontSize(19);
    lfm_setPropAsString(obj.label99, "fontStyle",  "bold");
    obj.label99:setFontColor("black");
    obj.label99:setFontFamily("kalam");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.Arma2);
    obj.label100:setLeft(317.88);
    obj.label100:setTop(125);
    obj.label100:setWidth(48.12);
    obj.label100:setHeight(32);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setField("ClasseDeDureza2");
    obj.label100:setFontSize(19);
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");
    obj.label100:setFontColor("black");
    obj.label100:setFontFamily("kalam");
    obj.label100:setName("label100");

    obj.Arma3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma3:setParent(obj.scrollBox10);
    obj.Arma3:setName("Arma3");
    obj.Arma3:setWidth(480);
    obj.Arma3:setHeight(174);
    obj.Arma3:setLeft(0);
    obj.Arma3:setTop(452);

    obj.image93 = GUI.fromHandle(_obj_newObject("image"));
    obj.image93:setParent(obj.Arma3);
    obj.image93:setSRC("images/Loja.png");
    obj.image93:setLeft(0);
    obj.image93:setTop(0);
    obj.image93:setWidth(399);
    obj.image93:setHeight(174);
    obj.image93:setName("image93");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.Arma3);
    obj.label101:setLeft(22.25);
    obj.label101:setTop(20.50);
    obj.label101:setWidth(107.25);
    obj.label101:setHeight(37.88);
    obj.label101:setFontSize(22);
    obj.label101:setHint("Preço da Arma");
    obj.label101:setField("Preco3");
    obj.label101:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setFontColor("yellow");
    obj.label101:setFontFamily("kalam");
    obj.label101:setCursor("handPoint");
    obj.label101:setHitTest(true);
    obj.label101:setName("label101");

    obj.image94 = GUI.fromHandle(_obj_newObject("image"));
    obj.image94:setParent(obj.Arma3);
    obj.image94:setLeft(41.38);
    obj.image94:setTop(61.75);
    obj.image94:setWidth(67.88);
    obj.image94:setHeight(30);
    obj.image94:setCursor("handPoint");
    obj.image94:setHitTest(true);
    obj.image94:setHint("Clique aqui para comprar");
    obj.image94:setName("image94");

    obj.image95 = GUI.fromHandle(_obj_newObject("image"));
    obj.image95:setParent(obj.Arma3);
    obj.image95:setLeft(2.56);
    obj.image95:setTop(93.00);
    obj.image95:setWidth(136.69);
    obj.image95:setHeight(77.69);
    obj.image95:setStyle("proportional");
    obj.image95:setCenter(true);
    obj.image95:setEditable(true);
    obj.image95:setField("ImagemArma3");
    obj.image95:setName("image95");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.Arma3);
    obj.label102:setLeft(197);
    obj.label102:setTop(10);
    obj.label102:setWidth(249.25);
    obj.label102:setHeight(39);
    obj.label102:setFontSize(22);
    obj.label102:setField("ItemNome3");
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setFontColor("black");
    obj.label102:setFontFamily("kalam");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.Arma3);
    obj.label103:setLeft(207.88);
    obj.label103:setTop(51);
    obj.label103:setWidth(49.88);
    obj.label103:setHeight(31.38);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setField("Iniciativa3");
    obj.label103:setFontSize(19);
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setFontColor("black");
    obj.label103:setFontFamily("kalam");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.Arma3);
    obj.label104:setLeft(182.88);
    obj.label104:setTop(90);
    obj.label104:setWidth(50.88);
    obj.label104:setHeight(31.38);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setField("DanoItem3");
    obj.label104:setFontSize(19);
    lfm_setPropAsString(obj.label104, "fontStyle",  "bold");
    obj.label104:setFontColor("black");
    obj.label104:setFontFamily("kalam");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.Arma3);
    obj.label105:setLeft(195.88);
    obj.label105:setTop(128);
    obj.label105:setWidth(50.88);
    obj.label105:setHeight(32);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setField("Alcance3");
    obj.label105:setFontSize(15);
    lfm_setPropAsString(obj.label105, "fontStyle",  "bold");
    obj.label105:setFontColor("black");
    obj.label105:setFontFamily("kalam");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.Arma3);
    obj.label106:setLeft(317.88);
    obj.label106:setTop(49);
    obj.label106:setWidth(68.88);
    obj.label106:setHeight(32);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setField("Cadencia3");
    obj.label106:setFontSize(19);
    lfm_setPropAsString(obj.label106, "fontStyle",  "bold");
    obj.label106:setFontColor("black");
    obj.label106:setFontFamily("kalam");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.Arma3);
    obj.label107:setLeft(317.88);
    obj.label107:setTop(89);
    obj.label107:setWidth(68.88);
    obj.label107:setHeight(32);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setField("Municao3");
    obj.label107:setFontSize(19);
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setFontColor("black");
    obj.label107:setFontFamily("kalam");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.Arma3);
    obj.label108:setLeft(317.88);
    obj.label108:setTop(125);
    obj.label108:setWidth(48.12);
    obj.label108:setHeight(32);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setField("ClasseDeDureza3");
    obj.label108:setFontSize(19);
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");
    obj.label108:setFontColor("black");
    obj.label108:setFontFamily("kalam");
    obj.label108:setName("label108");

    obj.Arma4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma4:setParent(obj.scrollBox10);
    obj.Arma4:setName("Arma4");
    obj.Arma4:setWidth(480);
    obj.Arma4:setHeight(174);
    obj.Arma4:setLeft(0);
    obj.Arma4:setTop(634);

    obj.image96 = GUI.fromHandle(_obj_newObject("image"));
    obj.image96:setParent(obj.Arma4);
    obj.image96:setSRC("images/Loja.png");
    obj.image96:setLeft(0);
    obj.image96:setTop(0);
    obj.image96:setWidth(399);
    obj.image96:setHeight(174);
    obj.image96:setName("image96");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.Arma4);
    obj.label109:setLeft(22.25);
    obj.label109:setTop(20.50);
    obj.label109:setWidth(107.25);
    obj.label109:setHeight(37.88);
    obj.label109:setFontSize(22);
    obj.label109:setHint("Preço da Arma");
    obj.label109:setField("Preco4");
    obj.label109:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setFontColor("yellow");
    obj.label109:setFontFamily("kalam");
    obj.label109:setCursor("handPoint");
    obj.label109:setHitTest(true);
    obj.label109:setName("label109");

    obj.image97 = GUI.fromHandle(_obj_newObject("image"));
    obj.image97:setParent(obj.Arma4);
    obj.image97:setLeft(41.38);
    obj.image97:setTop(61.75);
    obj.image97:setWidth(67.88);
    obj.image97:setHeight(30);
    obj.image97:setCursor("handPoint");
    obj.image97:setHitTest(true);
    obj.image97:setHint("Clique aqui para comprar");
    obj.image97:setName("image97");

    obj.image98 = GUI.fromHandle(_obj_newObject("image"));
    obj.image98:setParent(obj.Arma4);
    obj.image98:setLeft(2.56);
    obj.image98:setTop(93.00);
    obj.image98:setWidth(136.69);
    obj.image98:setHeight(77.69);
    obj.image98:setStyle("proportional");
    obj.image98:setCenter(true);
    obj.image98:setEditable(true);
    obj.image98:setField("ImagemArma4");
    obj.image98:setName("image98");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.Arma4);
    obj.label110:setLeft(197);
    obj.label110:setTop(10);
    obj.label110:setWidth(249.25);
    obj.label110:setHeight(39);
    obj.label110:setFontSize(22);
    obj.label110:setField("ItemNome4");
    lfm_setPropAsString(obj.label110, "fontStyle",  "bold");
    obj.label110:setFontColor("black");
    obj.label110:setFontFamily("kalam");
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.Arma4);
    obj.label111:setLeft(207.88);
    obj.label111:setTop(51);
    obj.label111:setWidth(49.88);
    obj.label111:setHeight(31.38);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setField("Iniciativa4");
    obj.label111:setFontSize(19);
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setFontColor("black");
    obj.label111:setFontFamily("kalam");
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.Arma4);
    obj.label112:setLeft(182.88);
    obj.label112:setTop(90);
    obj.label112:setWidth(50.88);
    obj.label112:setHeight(31.38);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setField("DanoItem4");
    obj.label112:setFontSize(19);
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");
    obj.label112:setFontColor("black");
    obj.label112:setFontFamily("kalam");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.Arma4);
    obj.label113:setLeft(195.88);
    obj.label113:setTop(128);
    obj.label113:setWidth(50.88);
    obj.label113:setHeight(32);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setField("Alcance4");
    obj.label113:setFontSize(15);
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setFontColor("black");
    obj.label113:setFontFamily("kalam");
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.Arma4);
    obj.label114:setLeft(317.88);
    obj.label114:setTop(49);
    obj.label114:setWidth(68.88);
    obj.label114:setHeight(32);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setField("Cadencia4");
    obj.label114:setFontSize(19);
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");
    obj.label114:setFontColor("black");
    obj.label114:setFontFamily("kalam");
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.Arma4);
    obj.label115:setLeft(317.88);
    obj.label115:setTop(89);
    obj.label115:setWidth(68.88);
    obj.label115:setHeight(32);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setField("Municao4");
    obj.label115:setFontSize(19);
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setFontColor("black");
    obj.label115:setFontFamily("kalam");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.Arma4);
    obj.label116:setLeft(317.88);
    obj.label116:setTop(125);
    obj.label116:setWidth(48.12);
    obj.label116:setHeight(32);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setField("ClasseDeDureza4");
    obj.label116:setFontSize(19);
    lfm_setPropAsString(obj.label116, "fontStyle",  "bold");
    obj.label116:setFontColor("black");
    obj.label116:setFontFamily("kalam");
    obj.label116:setName("label116");

    obj.Arma5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma5:setParent(obj.scrollBox10);
    obj.Arma5:setName("Arma5");
    obj.Arma5:setWidth(480);
    obj.Arma5:setHeight(174);
    obj.Arma5:setLeft(0);
    obj.Arma5:setTop(816);

    obj.image99 = GUI.fromHandle(_obj_newObject("image"));
    obj.image99:setParent(obj.Arma5);
    obj.image99:setSRC("images/Loja.png");
    obj.image99:setLeft(0);
    obj.image99:setTop(0);
    obj.image99:setWidth(399);
    obj.image99:setHeight(174);
    obj.image99:setName("image99");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.Arma5);
    obj.label117:setLeft(22.25);
    obj.label117:setTop(20.50);
    obj.label117:setWidth(107.25);
    obj.label117:setHeight(37.88);
    obj.label117:setFontSize(22);
    obj.label117:setHint("Preço da Arma");
    obj.label117:setField("Preco5");
    obj.label117:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setFontColor("yellow");
    obj.label117:setFontFamily("kalam");
    obj.label117:setCursor("handPoint");
    obj.label117:setHitTest(true);
    obj.label117:setName("label117");

    obj.image100 = GUI.fromHandle(_obj_newObject("image"));
    obj.image100:setParent(obj.Arma5);
    obj.image100:setLeft(41.38);
    obj.image100:setTop(61.75);
    obj.image100:setWidth(67.88);
    obj.image100:setHeight(30);
    obj.image100:setCursor("handPoint");
    obj.image100:setHitTest(true);
    obj.image100:setHint("Clique aqui para comprar");
    obj.image100:setName("image100");

    obj.image101 = GUI.fromHandle(_obj_newObject("image"));
    obj.image101:setParent(obj.Arma5);
    obj.image101:setLeft(2.56);
    obj.image101:setTop(93.00);
    obj.image101:setWidth(136.69);
    obj.image101:setHeight(77.69);
    obj.image101:setStyle("proportional");
    obj.image101:setCenter(true);
    obj.image101:setEditable(true);
    obj.image101:setField("ImagemArma5");
    obj.image101:setName("image101");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.Arma5);
    obj.label118:setLeft(197);
    obj.label118:setTop(10);
    obj.label118:setWidth(249.25);
    obj.label118:setHeight(39);
    obj.label118:setFontSize(22);
    obj.label118:setField("ItemNome5");
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");
    obj.label118:setFontColor("black");
    obj.label118:setFontFamily("kalam");
    obj.label118:setName("label118");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.Arma5);
    obj.label119:setLeft(207.88);
    obj.label119:setTop(51);
    obj.label119:setWidth(49.88);
    obj.label119:setHeight(31.38);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setField("Iniciativa5");
    obj.label119:setFontSize(19);
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setFontColor("black");
    obj.label119:setFontFamily("kalam");
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.Arma5);
    obj.label120:setLeft(182.88);
    obj.label120:setTop(90);
    obj.label120:setWidth(50.88);
    obj.label120:setHeight(31.38);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setField("DanoItem5");
    obj.label120:setFontSize(19);
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");
    obj.label120:setFontColor("black");
    obj.label120:setFontFamily("kalam");
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.Arma5);
    obj.label121:setLeft(195.88);
    obj.label121:setTop(128);
    obj.label121:setWidth(50.88);
    obj.label121:setHeight(32);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setField("Alcance5");
    obj.label121:setFontSize(15);
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setFontColor("black");
    obj.label121:setFontFamily("kalam");
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.Arma5);
    obj.label122:setLeft(317.88);
    obj.label122:setTop(49);
    obj.label122:setWidth(68.88);
    obj.label122:setHeight(32);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setField("Cadencia5");
    obj.label122:setFontSize(10);
    lfm_setPropAsString(obj.label122, "fontStyle",  "bold");
    obj.label122:setFontColor("black");
    obj.label122:setFontFamily("kalam");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.Arma5);
    obj.label123:setLeft(317.88);
    obj.label123:setTop(89);
    obj.label123:setWidth(68.88);
    obj.label123:setHeight(32);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setField("Municao5");
    obj.label123:setFontSize(19);
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");
    obj.label123:setFontColor("black");
    obj.label123:setFontFamily("kalam");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.Arma5);
    obj.label124:setLeft(317.88);
    obj.label124:setTop(125);
    obj.label124:setWidth(48.12);
    obj.label124:setHeight(32);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("ClasseDeDureza5");
    obj.label124:setFontSize(19);
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setFontColor("black");
    obj.label124:setFontFamily("kalam");
    obj.label124:setName("label124");

    obj.Arma6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma6:setParent(obj.scrollBox10);
    obj.Arma6:setName("Arma6");
    obj.Arma6:setWidth(480);
    obj.Arma6:setHeight(174);
    obj.Arma6:setLeft(0);
    obj.Arma6:setTop(998);

    obj.image102 = GUI.fromHandle(_obj_newObject("image"));
    obj.image102:setParent(obj.Arma6);
    obj.image102:setSRC("images/Loja.png");
    obj.image102:setLeft(0);
    obj.image102:setTop(0);
    obj.image102:setWidth(399);
    obj.image102:setHeight(174);
    obj.image102:setName("image102");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.Arma6);
    obj.label125:setLeft(22.25);
    obj.label125:setTop(20.50);
    obj.label125:setWidth(107.25);
    obj.label125:setHeight(37.88);
    obj.label125:setFontSize(22);
    obj.label125:setHint("Preço da Arma");
    obj.label125:setField("Preco6");
    obj.label125:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");
    obj.label125:setFontColor("yellow");
    obj.label125:setFontFamily("kalam");
    obj.label125:setCursor("handPoint");
    obj.label125:setHitTest(true);
    obj.label125:setName("label125");

    obj.image103 = GUI.fromHandle(_obj_newObject("image"));
    obj.image103:setParent(obj.Arma6);
    obj.image103:setLeft(41.38);
    obj.image103:setTop(61.75);
    obj.image103:setWidth(67.88);
    obj.image103:setHeight(30);
    obj.image103:setCursor("handPoint");
    obj.image103:setHitTest(true);
    obj.image103:setHint("Clique aqui para comprar");
    obj.image103:setName("image103");

    obj.image104 = GUI.fromHandle(_obj_newObject("image"));
    obj.image104:setParent(obj.Arma6);
    obj.image104:setLeft(2.56);
    obj.image104:setTop(93.00);
    obj.image104:setWidth(136.69);
    obj.image104:setHeight(77.69);
    obj.image104:setStyle("proportional");
    obj.image104:setCenter(true);
    obj.image104:setEditable(true);
    obj.image104:setField("ImagemArma6");
    obj.image104:setName("image104");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.Arma6);
    obj.label126:setLeft(197);
    obj.label126:setTop(10);
    obj.label126:setWidth(249.25);
    obj.label126:setHeight(39);
    obj.label126:setFontSize(22);
    obj.label126:setField("ItemNome6");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setFontColor("black");
    obj.label126:setFontFamily("kalam");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.Arma6);
    obj.label127:setLeft(207.88);
    obj.label127:setTop(51);
    obj.label127:setWidth(49.88);
    obj.label127:setHeight(31.38);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setField("Iniciativa6");
    obj.label127:setFontSize(19);
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");
    obj.label127:setFontColor("black");
    obj.label127:setFontFamily("kalam");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.Arma6);
    obj.label128:setLeft(182.88);
    obj.label128:setTop(90);
    obj.label128:setWidth(50.88);
    obj.label128:setHeight(31.38);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setField("DanoItem6");
    obj.label128:setFontSize(19);
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setFontColor("black");
    obj.label128:setFontFamily("kalam");
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.Arma6);
    obj.label129:setLeft(195.88);
    obj.label129:setTop(128);
    obj.label129:setWidth(50.88);
    obj.label129:setHeight(32);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setField("Alcance6");
    obj.label129:setFontSize(15);
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");
    obj.label129:setFontColor("black");
    obj.label129:setFontFamily("kalam");
    obj.label129:setName("label129");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.Arma6);
    obj.label130:setLeft(317.88);
    obj.label130:setTop(49);
    obj.label130:setWidth(68.88);
    obj.label130:setHeight(32);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setField("Cadencia6");
    obj.label130:setFontSize(10);
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setFontColor("black");
    obj.label130:setFontFamily("kalam");
    obj.label130:setName("label130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.Arma6);
    obj.label131:setLeft(317.88);
    obj.label131:setTop(89);
    obj.label131:setWidth(68.88);
    obj.label131:setHeight(32);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setField("Municao6");
    obj.label131:setFontSize(19);
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");
    obj.label131:setFontColor("black");
    obj.label131:setFontFamily("kalam");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.Arma6);
    obj.label132:setLeft(317.88);
    obj.label132:setTop(125);
    obj.label132:setWidth(48.12);
    obj.label132:setHeight(32);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setField("ClasseDeDureza6");
    obj.label132:setFontSize(19);
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setFontColor("black");
    obj.label132:setFontFamily("kalam");
    obj.label132:setName("label132");

    obj.Arma7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma7:setParent(obj.scrollBox10);
    obj.Arma7:setName("Arma7");
    obj.Arma7:setWidth(480);
    obj.Arma7:setHeight(174);
    obj.Arma7:setLeft(0);
    obj.Arma7:setTop(1180);

    obj.image105 = GUI.fromHandle(_obj_newObject("image"));
    obj.image105:setParent(obj.Arma7);
    obj.image105:setSRC("images/Loja.png");
    obj.image105:setLeft(0);
    obj.image105:setTop(0);
    obj.image105:setWidth(399);
    obj.image105:setHeight(174);
    obj.image105:setName("image105");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.Arma7);
    obj.label133:setLeft(22.25);
    obj.label133:setTop(20.50);
    obj.label133:setWidth(107.25);
    obj.label133:setHeight(37.88);
    obj.label133:setFontSize(22);
    obj.label133:setHint("Preço da Arma");
    obj.label133:setField("Preco7");
    obj.label133:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");
    obj.label133:setFontColor("yellow");
    obj.label133:setFontFamily("kalam");
    obj.label133:setCursor("handPoint");
    obj.label133:setHitTest(true);
    obj.label133:setName("label133");

    obj.image106 = GUI.fromHandle(_obj_newObject("image"));
    obj.image106:setParent(obj.Arma7);
    obj.image106:setLeft(41.38);
    obj.image106:setTop(61.75);
    obj.image106:setWidth(67.88);
    obj.image106:setHeight(30);
    obj.image106:setCursor("handPoint");
    obj.image106:setHitTest(true);
    obj.image106:setHint("Clique aqui para comprar");
    obj.image106:setName("image106");

    obj.image107 = GUI.fromHandle(_obj_newObject("image"));
    obj.image107:setParent(obj.Arma7);
    obj.image107:setLeft(2.56);
    obj.image107:setTop(93.00);
    obj.image107:setWidth(136.69);
    obj.image107:setHeight(77.69);
    obj.image107:setStyle("proportional");
    obj.image107:setCenter(true);
    obj.image107:setEditable(true);
    obj.image107:setField("ImagemArma7");
    obj.image107:setName("image107");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.Arma7);
    obj.label134:setLeft(197);
    obj.label134:setTop(10);
    obj.label134:setWidth(249.25);
    obj.label134:setHeight(39);
    obj.label134:setFontSize(18);
    obj.label134:setField("ItemNome7");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setFontColor("black");
    obj.label134:setFontFamily("kalam");
    obj.label134:setName("label134");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.Arma7);
    obj.label135:setLeft(207.88);
    obj.label135:setTop(51);
    obj.label135:setWidth(49.88);
    obj.label135:setHeight(31.38);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setField("Iniciativa7");
    obj.label135:setFontSize(19);
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setFontColor("black");
    obj.label135:setFontFamily("kalam");
    obj.label135:setName("label135");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.Arma7);
    obj.label136:setLeft(182.88);
    obj.label136:setTop(90);
    obj.label136:setWidth(50.88);
    obj.label136:setHeight(31.38);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setField("DanoItem7");
    obj.label136:setFontSize(19);
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");
    obj.label136:setFontColor("black");
    obj.label136:setFontFamily("kalam");
    obj.label136:setName("label136");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.Arma7);
    obj.label137:setLeft(195.88);
    obj.label137:setTop(128);
    obj.label137:setWidth(50.88);
    obj.label137:setHeight(32);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setField("Alcance7");
    obj.label137:setFontSize(15);
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");
    obj.label137:setFontColor("black");
    obj.label137:setFontFamily("kalam");
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.Arma7);
    obj.label138:setLeft(317.88);
    obj.label138:setTop(49);
    obj.label138:setWidth(68.88);
    obj.label138:setHeight(32);
    obj.label138:setHorzTextAlign("center");
    obj.label138:setField("Cadencia7");
    obj.label138:setFontSize(10);
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setFontColor("black");
    obj.label138:setFontFamily("kalam");
    obj.label138:setName("label138");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.Arma7);
    obj.label139:setLeft(317.88);
    obj.label139:setTop(89);
    obj.label139:setWidth(68.88);
    obj.label139:setHeight(32);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setField("Municao7");
    obj.label139:setFontSize(19);
    lfm_setPropAsString(obj.label139, "fontStyle",  "bold");
    obj.label139:setFontColor("black");
    obj.label139:setFontFamily("kalam");
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.Arma7);
    obj.label140:setLeft(317.88);
    obj.label140:setTop(125);
    obj.label140:setWidth(48.12);
    obj.label140:setHeight(32);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setField("ClasseDeDureza7");
    obj.label140:setFontSize(19);
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");
    obj.label140:setFontColor("black");
    obj.label140:setFontFamily("kalam");
    obj.label140:setName("label140");

    obj.Arma8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma8:setParent(obj.scrollBox10);
    obj.Arma8:setName("Arma8");
    obj.Arma8:setWidth(480);
    obj.Arma8:setHeight(174);
    obj.Arma8:setLeft(0);
    obj.Arma8:setTop(1362);

    obj.image108 = GUI.fromHandle(_obj_newObject("image"));
    obj.image108:setParent(obj.Arma8);
    obj.image108:setSRC("images/Loja.png");
    obj.image108:setLeft(0);
    obj.image108:setTop(0);
    obj.image108:setWidth(399);
    obj.image108:setHeight(174);
    obj.image108:setName("image108");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.Arma8);
    obj.label141:setLeft(22.25);
    obj.label141:setTop(20.50);
    obj.label141:setWidth(107.25);
    obj.label141:setHeight(37.88);
    obj.label141:setFontSize(22);
    obj.label141:setHint("Preço da Arma");
    obj.label141:setField("Preco8");
    obj.label141:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");
    obj.label141:setFontColor("yellow");
    obj.label141:setFontFamily("kalam");
    obj.label141:setCursor("handPoint");
    obj.label141:setHitTest(true);
    obj.label141:setName("label141");

    obj.image109 = GUI.fromHandle(_obj_newObject("image"));
    obj.image109:setParent(obj.Arma8);
    obj.image109:setLeft(41.38);
    obj.image109:setTop(61.75);
    obj.image109:setWidth(67.88);
    obj.image109:setHeight(30);
    obj.image109:setCursor("handPoint");
    obj.image109:setHitTest(true);
    obj.image109:setHint("Clique aqui para comprar");
    obj.image109:setName("image109");

    obj.image110 = GUI.fromHandle(_obj_newObject("image"));
    obj.image110:setParent(obj.Arma8);
    obj.image110:setLeft(2.56);
    obj.image110:setTop(93.00);
    obj.image110:setWidth(136.69);
    obj.image110:setHeight(77.69);
    obj.image110:setStyle("proportional");
    obj.image110:setCenter(true);
    obj.image110:setEditable(true);
    obj.image110:setField("ImagemArma8");
    obj.image110:setName("image110");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.Arma8);
    obj.label142:setLeft(197);
    obj.label142:setTop(10);
    obj.label142:setWidth(249.25);
    obj.label142:setHeight(39);
    obj.label142:setFontSize(18);
    obj.label142:setField("ItemNome8");
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");
    obj.label142:setFontColor("black");
    obj.label142:setFontFamily("kalam");
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.Arma8);
    obj.label143:setLeft(207.88);
    obj.label143:setTop(51);
    obj.label143:setWidth(49.88);
    obj.label143:setHeight(31.38);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setField("Iniciativa8");
    obj.label143:setFontSize(19);
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");
    obj.label143:setFontColor("black");
    obj.label143:setFontFamily("kalam");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.Arma8);
    obj.label144:setLeft(182.88);
    obj.label144:setTop(90);
    obj.label144:setWidth(50.88);
    obj.label144:setHeight(31.38);
    obj.label144:setHorzTextAlign("center");
    obj.label144:setField("DanoItem8");
    obj.label144:setFontSize(19);
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");
    obj.label144:setFontColor("black");
    obj.label144:setFontFamily("kalam");
    obj.label144:setName("label144");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.Arma8);
    obj.label145:setLeft(195.88);
    obj.label145:setTop(128);
    obj.label145:setWidth(50.88);
    obj.label145:setHeight(32);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setField("Alcance8");
    obj.label145:setFontSize(15);
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");
    obj.label145:setFontColor("black");
    obj.label145:setFontFamily("kalam");
    obj.label145:setName("label145");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.Arma8);
    obj.label146:setLeft(317.88);
    obj.label146:setTop(49);
    obj.label146:setWidth(68.88);
    obj.label146:setHeight(32);
    obj.label146:setHorzTextAlign("center");
    obj.label146:setField("Cadencia8");
    obj.label146:setFontSize(19);
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");
    obj.label146:setFontColor("black");
    obj.label146:setFontFamily("kalam");
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.Arma8);
    obj.label147:setLeft(317.88);
    obj.label147:setTop(89);
    obj.label147:setWidth(68.88);
    obj.label147:setHeight(32);
    obj.label147:setHorzTextAlign("center");
    obj.label147:setField("Municao8");
    obj.label147:setFontSize(19);
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");
    obj.label147:setFontColor("black");
    obj.label147:setFontFamily("kalam");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.Arma8);
    obj.label148:setLeft(317.88);
    obj.label148:setTop(125);
    obj.label148:setWidth(48.12);
    obj.label148:setHeight(32);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setField("ClasseDeDureza8");
    obj.label148:setFontSize(19);
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");
    obj.label148:setFontColor("black");
    obj.label148:setFontFamily("kalam");
    obj.label148:setName("label148");

    obj.Arma9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma9:setParent(obj.scrollBox10);
    obj.Arma9:setName("Arma9");
    obj.Arma9:setWidth(480);
    obj.Arma9:setHeight(174);
    obj.Arma9:setLeft(0);
    obj.Arma9:setTop(1544);

    obj.image111 = GUI.fromHandle(_obj_newObject("image"));
    obj.image111:setParent(obj.Arma9);
    obj.image111:setSRC("images/Loja.png");
    obj.image111:setLeft(0);
    obj.image111:setTop(0);
    obj.image111:setWidth(399);
    obj.image111:setHeight(174);
    obj.image111:setName("image111");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.Arma9);
    obj.label149:setLeft(22.25);
    obj.label149:setTop(20.50);
    obj.label149:setWidth(107.25);
    obj.label149:setHeight(37.88);
    obj.label149:setFontSize(22);
    obj.label149:setHint("Preço da Arma");
    obj.label149:setField("Preco9");
    obj.label149:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");
    obj.label149:setFontColor("yellow");
    obj.label149:setFontFamily("kalam");
    obj.label149:setCursor("handPoint");
    obj.label149:setHitTest(true);
    obj.label149:setName("label149");

    obj.image112 = GUI.fromHandle(_obj_newObject("image"));
    obj.image112:setParent(obj.Arma9);
    obj.image112:setLeft(41.38);
    obj.image112:setTop(61.75);
    obj.image112:setWidth(67.88);
    obj.image112:setHeight(30);
    obj.image112:setCursor("handPoint");
    obj.image112:setHitTest(true);
    obj.image112:setHint("Clique aqui para comprar");
    obj.image112:setName("image112");

    obj.image113 = GUI.fromHandle(_obj_newObject("image"));
    obj.image113:setParent(obj.Arma9);
    obj.image113:setLeft(2.56);
    obj.image113:setTop(93.00);
    obj.image113:setWidth(136.69);
    obj.image113:setHeight(77.69);
    obj.image113:setStyle("proportional");
    obj.image113:setCenter(true);
    obj.image113:setEditable(true);
    obj.image113:setField("ImagemArma9");
    obj.image113:setName("image113");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.Arma9);
    obj.label150:setLeft(197);
    obj.label150:setTop(10);
    obj.label150:setWidth(249.25);
    obj.label150:setHeight(39);
    obj.label150:setFontSize(22);
    obj.label150:setField("ItemNome9");
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setFontColor("black");
    obj.label150:setFontFamily("kalam");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.Arma9);
    obj.label151:setLeft(207.88);
    obj.label151:setTop(51);
    obj.label151:setWidth(49.88);
    obj.label151:setHeight(31.38);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setField("Iniciativa9");
    obj.label151:setFontSize(19);
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");
    obj.label151:setFontColor("black");
    obj.label151:setFontFamily("kalam");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.Arma9);
    obj.label152:setLeft(182.88);
    obj.label152:setTop(90);
    obj.label152:setWidth(50.88);
    obj.label152:setHeight(31.38);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setField("DanoItem9");
    obj.label152:setFontSize(19);
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");
    obj.label152:setFontColor("black");
    obj.label152:setFontFamily("kalam");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.Arma9);
    obj.label153:setLeft(195.88);
    obj.label153:setTop(128);
    obj.label153:setWidth(50.88);
    obj.label153:setHeight(32);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setField("Alcance9");
    obj.label153:setFontSize(15);
    lfm_setPropAsString(obj.label153, "fontStyle",  "bold");
    obj.label153:setFontColor("black");
    obj.label153:setFontFamily("kalam");
    obj.label153:setName("label153");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.Arma9);
    obj.label154:setLeft(317.88);
    obj.label154:setTop(49);
    obj.label154:setWidth(68.88);
    obj.label154:setHeight(32);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setField("Cadencia9");
    obj.label154:setFontSize(19);
    lfm_setPropAsString(obj.label154, "fontStyle",  "bold");
    obj.label154:setFontColor("black");
    obj.label154:setFontFamily("kalam");
    obj.label154:setName("label154");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.Arma9);
    obj.label155:setLeft(317.88);
    obj.label155:setTop(89);
    obj.label155:setWidth(68.88);
    obj.label155:setHeight(32);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setField("Municao9");
    obj.label155:setFontSize(19);
    lfm_setPropAsString(obj.label155, "fontStyle",  "bold");
    obj.label155:setFontColor("black");
    obj.label155:setFontFamily("kalam");
    obj.label155:setName("label155");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.Arma9);
    obj.label156:setLeft(317.88);
    obj.label156:setTop(125);
    obj.label156:setWidth(48.12);
    obj.label156:setHeight(32);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setField("ClasseDeDureza9");
    obj.label156:setFontSize(19);
    lfm_setPropAsString(obj.label156, "fontStyle",  "bold");
    obj.label156:setFontColor("black");
    obj.label156:setFontFamily("kalam");
    obj.label156:setName("label156");

    obj.Arma10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma10:setParent(obj.scrollBox10);
    obj.Arma10:setName("Arma10");
    obj.Arma10:setWidth(480);
    obj.Arma10:setHeight(174);
    obj.Arma10:setLeft(0);
    obj.Arma10:setTop(1726);

    obj.image114 = GUI.fromHandle(_obj_newObject("image"));
    obj.image114:setParent(obj.Arma10);
    obj.image114:setSRC("images/Loja.png");
    obj.image114:setLeft(0);
    obj.image114:setTop(0);
    obj.image114:setWidth(399);
    obj.image114:setHeight(174);
    obj.image114:setName("image114");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.Arma10);
    obj.label157:setLeft(22.25);
    obj.label157:setTop(20.50);
    obj.label157:setWidth(107.25);
    obj.label157:setHeight(37.88);
    obj.label157:setFontSize(22);
    obj.label157:setHint("Preço da Arma");
    obj.label157:setField("Preco10");
    obj.label157:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label157, "fontStyle",  "bold");
    obj.label157:setFontColor("yellow");
    obj.label157:setFontFamily("kalam");
    obj.label157:setCursor("handPoint");
    obj.label157:setHitTest(true);
    obj.label157:setName("label157");

    obj.image115 = GUI.fromHandle(_obj_newObject("image"));
    obj.image115:setParent(obj.Arma10);
    obj.image115:setLeft(41.38);
    obj.image115:setTop(61.75);
    obj.image115:setWidth(67.88);
    obj.image115:setHeight(30);
    obj.image115:setCursor("handPoint");
    obj.image115:setHitTest(true);
    obj.image115:setHint("Clique aqui para comprar");
    obj.image115:setName("image115");

    obj.image116 = GUI.fromHandle(_obj_newObject("image"));
    obj.image116:setParent(obj.Arma10);
    obj.image116:setLeft(2.56);
    obj.image116:setTop(93.00);
    obj.image116:setWidth(136.69);
    obj.image116:setHeight(77.69);
    obj.image116:setStyle("proportional");
    obj.image116:setCenter(true);
    obj.image116:setEditable(true);
    obj.image116:setField("ImagemArma10");
    obj.image116:setName("image116");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.Arma10);
    obj.label158:setLeft(197);
    obj.label158:setTop(10);
    obj.label158:setWidth(249.25);
    obj.label158:setHeight(39);
    obj.label158:setFontSize(22);
    obj.label158:setField("ItemNome10");
    lfm_setPropAsString(obj.label158, "fontStyle",  "bold");
    obj.label158:setFontColor("black");
    obj.label158:setFontFamily("kalam");
    obj.label158:setName("label158");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.Arma10);
    obj.label159:setLeft(207.88);
    obj.label159:setTop(51);
    obj.label159:setWidth(49.88);
    obj.label159:setHeight(31.38);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setField("Iniciativa10");
    obj.label159:setFontSize(19);
    lfm_setPropAsString(obj.label159, "fontStyle",  "bold");
    obj.label159:setFontColor("black");
    obj.label159:setFontFamily("kalam");
    obj.label159:setName("label159");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.Arma10);
    obj.label160:setLeft(182.88);
    obj.label160:setTop(90);
    obj.label160:setWidth(50.88);
    obj.label160:setHeight(31.38);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setField("DanoItem10");
    obj.label160:setFontSize(19);
    lfm_setPropAsString(obj.label160, "fontStyle",  "bold");
    obj.label160:setFontColor("black");
    obj.label160:setFontFamily("kalam");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.Arma10);
    obj.label161:setLeft(195.88);
    obj.label161:setTop(128);
    obj.label161:setWidth(50.88);
    obj.label161:setHeight(32);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setField("Alcance10");
    obj.label161:setFontSize(15);
    lfm_setPropAsString(obj.label161, "fontStyle",  "bold");
    obj.label161:setFontColor("black");
    obj.label161:setFontFamily("kalam");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.Arma10);
    obj.label162:setLeft(317.88);
    obj.label162:setTop(49);
    obj.label162:setWidth(68.88);
    obj.label162:setHeight(32);
    obj.label162:setHorzTextAlign("center");
    obj.label162:setField("Cadencia10");
    obj.label162:setFontSize(19);
    lfm_setPropAsString(obj.label162, "fontStyle",  "bold");
    obj.label162:setFontColor("black");
    obj.label162:setFontFamily("kalam");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.Arma10);
    obj.label163:setLeft(317.88);
    obj.label163:setTop(89);
    obj.label163:setWidth(68.88);
    obj.label163:setHeight(32);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setField("Municao10");
    obj.label163:setFontSize(19);
    lfm_setPropAsString(obj.label163, "fontStyle",  "bold");
    obj.label163:setFontColor("black");
    obj.label163:setFontFamily("kalam");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.Arma10);
    obj.label164:setLeft(317.88);
    obj.label164:setTop(128);
    obj.label164:setWidth(68.88);
    obj.label164:setHeight(32);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setField("Peso10");
    obj.label164:setFontSize(15);
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");
    obj.label164:setFontColor("black");
    obj.label164:setFontFamily("kalam");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.Arma10);
    obj.label165:setLeft(317.88);
    obj.label165:setTop(125);
    obj.label165:setWidth(48.12);
    obj.label165:setHeight(32);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setField("ClasseDeDureza10");
    obj.label165:setFontSize(19);
    lfm_setPropAsString(obj.label165, "fontStyle",  "bold");
    obj.label165:setFontColor("black");
    obj.label165:setFontFamily("kalam");
    obj.label165:setName("label165");

    obj.Arma11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma11:setParent(obj.scrollBox10);
    obj.Arma11:setName("Arma11");
    obj.Arma11:setWidth(480);
    obj.Arma11:setHeight(174);
    obj.Arma11:setLeft(0);
    obj.Arma11:setTop(1908);

    obj.image117 = GUI.fromHandle(_obj_newObject("image"));
    obj.image117:setParent(obj.Arma11);
    obj.image117:setSRC("images/Loja.png");
    obj.image117:setLeft(0);
    obj.image117:setTop(0);
    obj.image117:setWidth(399);
    obj.image117:setHeight(174);
    obj.image117:setName("image117");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.Arma11);
    obj.label166:setLeft(22.25);
    obj.label166:setTop(20.50);
    obj.label166:setWidth(107.25);
    obj.label166:setHeight(37.88);
    obj.label166:setFontSize(22);
    obj.label166:setHint("Preço da Arma");
    obj.label166:setField("Preco11");
    obj.label166:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label166, "fontStyle",  "bold");
    obj.label166:setFontColor("yellow");
    obj.label166:setFontFamily("kalam");
    obj.label166:setCursor("handPoint");
    obj.label166:setHitTest(true);
    obj.label166:setName("label166");

    obj.image118 = GUI.fromHandle(_obj_newObject("image"));
    obj.image118:setParent(obj.Arma11);
    obj.image118:setLeft(41.38);
    obj.image118:setTop(61.75);
    obj.image118:setWidth(67.88);
    obj.image118:setHeight(30);
    obj.image118:setCursor("handPoint");
    obj.image118:setHitTest(true);
    obj.image118:setHint("Clique aqui para comprar");
    obj.image118:setName("image118");

    obj.image119 = GUI.fromHandle(_obj_newObject("image"));
    obj.image119:setParent(obj.Arma11);
    obj.image119:setLeft(2.56);
    obj.image119:setTop(93.00);
    obj.image119:setWidth(136.69);
    obj.image119:setHeight(77.69);
    obj.image119:setStyle("proportional");
    obj.image119:setCenter(true);
    obj.image119:setEditable(true);
    obj.image119:setField("ImagemArma11");
    obj.image119:setName("image119");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.Arma11);
    obj.label167:setLeft(197);
    obj.label167:setTop(10);
    obj.label167:setWidth(249.25);
    obj.label167:setHeight(39);
    obj.label167:setFontSize(22);
    obj.label167:setField("ItemNome11");
    lfm_setPropAsString(obj.label167, "fontStyle",  "bold");
    obj.label167:setFontColor("black");
    obj.label167:setFontFamily("kalam");
    obj.label167:setName("label167");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.Arma11);
    obj.label168:setLeft(207.88);
    obj.label168:setTop(51);
    obj.label168:setWidth(49.88);
    obj.label168:setHeight(31.38);
    obj.label168:setHorzTextAlign("center");
    obj.label168:setField("Iniciativa11");
    obj.label168:setFontSize(19);
    lfm_setPropAsString(obj.label168, "fontStyle",  "bold");
    obj.label168:setFontColor("black");
    obj.label168:setFontFamily("kalam");
    obj.label168:setName("label168");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.Arma11);
    obj.label169:setLeft(182.88);
    obj.label169:setTop(90);
    obj.label169:setWidth(50.88);
    obj.label169:setHeight(31.38);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setField("DanoItem11");
    obj.label169:setFontSize(19);
    lfm_setPropAsString(obj.label169, "fontStyle",  "bold");
    obj.label169:setFontColor("black");
    obj.label169:setFontFamily("kalam");
    obj.label169:setName("label169");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.Arma11);
    obj.label170:setLeft(195.88);
    obj.label170:setTop(128);
    obj.label170:setWidth(50.88);
    obj.label170:setHeight(32);
    obj.label170:setHorzTextAlign("center");
    obj.label170:setField("Alcance11");
    obj.label170:setFontSize(15);
    lfm_setPropAsString(obj.label170, "fontStyle",  "bold");
    obj.label170:setFontColor("black");
    obj.label170:setFontFamily("kalam");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.Arma11);
    obj.label171:setLeft(317.88);
    obj.label171:setTop(49);
    obj.label171:setWidth(68.88);
    obj.label171:setHeight(32);
    obj.label171:setHorzTextAlign("center");
    obj.label171:setField("Cadencia11");
    obj.label171:setFontSize(19);
    lfm_setPropAsString(obj.label171, "fontStyle",  "bold");
    obj.label171:setFontColor("black");
    obj.label171:setFontFamily("kalam");
    obj.label171:setName("label171");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.Arma11);
    obj.label172:setLeft(317.88);
    obj.label172:setTop(89);
    obj.label172:setWidth(68.88);
    obj.label172:setHeight(32);
    obj.label172:setHorzTextAlign("center");
    obj.label172:setField("Municao11");
    obj.label172:setFontSize(19);
    lfm_setPropAsString(obj.label172, "fontStyle",  "bold");
    obj.label172:setFontColor("black");
    obj.label172:setFontFamily("kalam");
    obj.label172:setName("label172");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.Arma11);
    obj.label173:setLeft(317.88);
    obj.label173:setTop(125);
    obj.label173:setWidth(48.12);
    obj.label173:setHeight(32);
    obj.label173:setHorzTextAlign("center");
    obj.label173:setField("ClasseDeDureza11");
    obj.label173:setFontSize(19);
    lfm_setPropAsString(obj.label173, "fontStyle",  "bold");
    obj.label173:setFontColor("black");
    obj.label173:setFontFamily("kalam");
    obj.label173:setName("label173");

    obj.Arma12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma12:setParent(obj.scrollBox10);
    obj.Arma12:setName("Arma12");
    obj.Arma12:setWidth(480);
    obj.Arma12:setHeight(174);
    obj.Arma12:setLeft(0);
    obj.Arma12:setTop(2090);

    obj.image120 = GUI.fromHandle(_obj_newObject("image"));
    obj.image120:setParent(obj.Arma12);
    obj.image120:setSRC("images/Loja.png");
    obj.image120:setLeft(0);
    obj.image120:setTop(0);
    obj.image120:setWidth(399);
    obj.image120:setHeight(174);
    obj.image120:setName("image120");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.Arma12);
    obj.label174:setLeft(22.25);
    obj.label174:setTop(20.50);
    obj.label174:setWidth(107.25);
    obj.label174:setHeight(37.88);
    obj.label174:setFontSize(22);
    obj.label174:setHint("Preço da Arma");
    obj.label174:setField("Preco12");
    obj.label174:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label174, "fontStyle",  "bold");
    obj.label174:setFontColor("yellow");
    obj.label174:setFontFamily("kalam");
    obj.label174:setCursor("handPoint");
    obj.label174:setHitTest(true);
    obj.label174:setName("label174");

    obj.image121 = GUI.fromHandle(_obj_newObject("image"));
    obj.image121:setParent(obj.Arma12);
    obj.image121:setLeft(41.38);
    obj.image121:setTop(61.75);
    obj.image121:setWidth(67.88);
    obj.image121:setHeight(30);
    obj.image121:setCursor("handPoint");
    obj.image121:setHitTest(true);
    obj.image121:setHint("Clique aqui para comprar");
    obj.image121:setName("image121");

    obj.image122 = GUI.fromHandle(_obj_newObject("image"));
    obj.image122:setParent(obj.Arma12);
    obj.image122:setLeft(2.56);
    obj.image122:setTop(93.00);
    obj.image122:setWidth(136.69);
    obj.image122:setHeight(77.69);
    obj.image122:setStyle("proportional");
    obj.image122:setCenter(true);
    obj.image122:setEditable(true);
    obj.image122:setField("ImagemArma12");
    obj.image122:setName("image122");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.Arma12);
    obj.label175:setLeft(197);
    obj.label175:setTop(10);
    obj.label175:setWidth(249.25);
    obj.label175:setHeight(39);
    obj.label175:setFontSize(16);
    obj.label175:setField("ItemNome12");
    lfm_setPropAsString(obj.label175, "fontStyle",  "bold");
    obj.label175:setFontColor("black");
    obj.label175:setFontFamily("kalam");
    obj.label175:setName("label175");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.Arma12);
    obj.label176:setLeft(207.88);
    obj.label176:setTop(51);
    obj.label176:setWidth(49.88);
    obj.label176:setHeight(31.38);
    obj.label176:setHorzTextAlign("center");
    obj.label176:setField("Iniciativa12");
    obj.label176:setFontSize(19);
    lfm_setPropAsString(obj.label176, "fontStyle",  "bold");
    obj.label176:setFontColor("black");
    obj.label176:setFontFamily("kalam");
    obj.label176:setName("label176");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.Arma12);
    obj.label177:setLeft(182.88);
    obj.label177:setTop(90);
    obj.label177:setWidth(50.88);
    obj.label177:setHeight(31.38);
    obj.label177:setHorzTextAlign("center");
    obj.label177:setField("DanoItem12");
    obj.label177:setFontSize(19);
    lfm_setPropAsString(obj.label177, "fontStyle",  "bold");
    obj.label177:setFontColor("black");
    obj.label177:setFontFamily("kalam");
    obj.label177:setName("label177");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.Arma12);
    obj.label178:setLeft(195.88);
    obj.label178:setTop(128);
    obj.label178:setWidth(50.88);
    obj.label178:setHeight(32);
    obj.label178:setHorzTextAlign("center");
    obj.label178:setField("Alcance12");
    obj.label178:setFontSize(15);
    lfm_setPropAsString(obj.label178, "fontStyle",  "bold");
    obj.label178:setFontColor("black");
    obj.label178:setFontFamily("kalam");
    obj.label178:setName("label178");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.Arma12);
    obj.label179:setLeft(317.88);
    obj.label179:setTop(49);
    obj.label179:setWidth(68.88);
    obj.label179:setHeight(32);
    obj.label179:setHorzTextAlign("center");
    obj.label179:setField("Cadencia12");
    obj.label179:setFontSize(19);
    lfm_setPropAsString(obj.label179, "fontStyle",  "bold");
    obj.label179:setFontColor("black");
    obj.label179:setFontFamily("kalam");
    obj.label179:setName("label179");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.Arma12);
    obj.label180:setLeft(317.88);
    obj.label180:setTop(89);
    obj.label180:setWidth(68.88);
    obj.label180:setHeight(32);
    obj.label180:setHorzTextAlign("center");
    obj.label180:setField("Municao12");
    obj.label180:setFontSize(19);
    lfm_setPropAsString(obj.label180, "fontStyle",  "bold");
    obj.label180:setFontColor("black");
    obj.label180:setFontFamily("kalam");
    obj.label180:setName("label180");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.Arma12);
    obj.label181:setLeft(317.88);
    obj.label181:setTop(125);
    obj.label181:setWidth(48.12);
    obj.label181:setHeight(32);
    obj.label181:setHorzTextAlign("center");
    obj.label181:setField("ClasseDeDureza12");
    obj.label181:setFontSize(19);
    lfm_setPropAsString(obj.label181, "fontStyle",  "bold");
    obj.label181:setFontColor("black");
    obj.label181:setFontFamily("kalam");
    obj.label181:setName("label181");

    obj.Arma13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma13:setParent(obj.scrollBox10);
    obj.Arma13:setName("Arma13");
    obj.Arma13:setWidth(480);
    obj.Arma13:setHeight(174);
    obj.Arma13:setLeft(413);
    obj.Arma13:setTop(88);

    obj.image123 = GUI.fromHandle(_obj_newObject("image"));
    obj.image123:setParent(obj.Arma13);
    obj.image123:setSRC("images/Loja.png");
    obj.image123:setLeft(0);
    obj.image123:setTop(0);
    obj.image123:setWidth(399);
    obj.image123:setHeight(174);
    obj.image123:setName("image123");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.Arma13);
    obj.label182:setLeft(22.25);
    obj.label182:setTop(20.50);
    obj.label182:setWidth(107.25);
    obj.label182:setHeight(37.88);
    obj.label182:setFontSize(22);
    obj.label182:setHint("Preço da Arma");
    obj.label182:setField("Preco13");
    obj.label182:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label182, "fontStyle",  "bold");
    obj.label182:setFontColor("yellow");
    obj.label182:setFontFamily("kalam");
    obj.label182:setCursor("handPoint");
    obj.label182:setHitTest(true);
    obj.label182:setName("label182");

    obj.image124 = GUI.fromHandle(_obj_newObject("image"));
    obj.image124:setParent(obj.Arma13);
    obj.image124:setLeft(41.38);
    obj.image124:setTop(61.75);
    obj.image124:setWidth(67.88);
    obj.image124:setHeight(30);
    obj.image124:setCursor("handPoint");
    obj.image124:setHitTest(true);
    obj.image124:setHint("Clique aqui para comprar");
    obj.image124:setName("image124");

    obj.image125 = GUI.fromHandle(_obj_newObject("image"));
    obj.image125:setParent(obj.Arma13);
    obj.image125:setLeft(2.56);
    obj.image125:setTop(93.00);
    obj.image125:setWidth(136.69);
    obj.image125:setHeight(77.69);
    obj.image125:setStyle("proportional");
    obj.image125:setCenter(true);
    obj.image125:setEditable(true);
    obj.image125:setField("ImagemArma13");
    obj.image125:setName("image125");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.Arma13);
    obj.label183:setLeft(197);
    obj.label183:setTop(10);
    obj.label183:setWidth(249.25);
    obj.label183:setHeight(39);
    obj.label183:setFontSize(22);
    obj.label183:setField("ItemNome13");
    lfm_setPropAsString(obj.label183, "fontStyle",  "bold");
    obj.label183:setFontColor("black");
    obj.label183:setFontFamily("kalam");
    obj.label183:setName("label183");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.Arma13);
    obj.label184:setLeft(207.88);
    obj.label184:setTop(51);
    obj.label184:setWidth(49.88);
    obj.label184:setHeight(31.38);
    obj.label184:setHorzTextAlign("center");
    obj.label184:setField("Iniciativa13");
    obj.label184:setFontSize(19);
    lfm_setPropAsString(obj.label184, "fontStyle",  "bold");
    obj.label184:setFontColor("black");
    obj.label184:setFontFamily("kalam");
    obj.label184:setName("label184");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.Arma13);
    obj.label185:setLeft(182.88);
    obj.label185:setTop(90);
    obj.label185:setWidth(50.88);
    obj.label185:setHeight(31.38);
    obj.label185:setHorzTextAlign("center");
    obj.label185:setField("DanoItem13");
    obj.label185:setFontSize(19);
    lfm_setPropAsString(obj.label185, "fontStyle",  "bold");
    obj.label185:setFontColor("black");
    obj.label185:setFontFamily("kalam");
    obj.label185:setName("label185");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.Arma13);
    obj.label186:setLeft(195.88);
    obj.label186:setTop(128);
    obj.label186:setWidth(50.88);
    obj.label186:setHeight(32);
    obj.label186:setHorzTextAlign("center");
    obj.label186:setField("Alcance13");
    obj.label186:setFontSize(15);
    lfm_setPropAsString(obj.label186, "fontStyle",  "bold");
    obj.label186:setFontColor("black");
    obj.label186:setFontFamily("kalam");
    obj.label186:setName("label186");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.Arma13);
    obj.label187:setLeft(317.88);
    obj.label187:setTop(49);
    obj.label187:setWidth(68.88);
    obj.label187:setHeight(32);
    obj.label187:setHorzTextAlign("center");
    obj.label187:setField("Cadencia13");
    obj.label187:setFontSize(19);
    lfm_setPropAsString(obj.label187, "fontStyle",  "bold");
    obj.label187:setFontColor("black");
    obj.label187:setFontFamily("kalam");
    obj.label187:setName("label187");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.Arma13);
    obj.label188:setLeft(317.88);
    obj.label188:setTop(89);
    obj.label188:setWidth(68.88);
    obj.label188:setHeight(32);
    obj.label188:setHorzTextAlign("center");
    obj.label188:setField("Municao13");
    obj.label188:setFontSize(19);
    lfm_setPropAsString(obj.label188, "fontStyle",  "bold");
    obj.label188:setFontColor("black");
    obj.label188:setFontFamily("kalam");
    obj.label188:setName("label188");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.Arma13);
    obj.label189:setLeft(317.88);
    obj.label189:setTop(125);
    obj.label189:setWidth(48.12);
    obj.label189:setHeight(32);
    obj.label189:setHorzTextAlign("center");
    obj.label189:setField("ClasseDeDureza13");
    obj.label189:setFontSize(19);
    lfm_setPropAsString(obj.label189, "fontStyle",  "bold");
    obj.label189:setFontColor("black");
    obj.label189:setFontFamily("kalam");
    obj.label189:setName("label189");

    obj.Arma14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma14:setParent(obj.scrollBox10);
    obj.Arma14:setName("Arma14");
    obj.Arma14:setWidth(480);
    obj.Arma14:setHeight(174);
    obj.Arma14:setLeft(413);
    obj.Arma14:setTop(270);

    obj.image126 = GUI.fromHandle(_obj_newObject("image"));
    obj.image126:setParent(obj.Arma14);
    obj.image126:setSRC("images/Loja.png");
    obj.image126:setLeft(0);
    obj.image126:setTop(0);
    obj.image126:setWidth(399);
    obj.image126:setHeight(174);
    obj.image126:setName("image126");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.Arma14);
    obj.label190:setLeft(22.25);
    obj.label190:setTop(20.50);
    obj.label190:setWidth(107.25);
    obj.label190:setHeight(37.88);
    obj.label190:setFontSize(22);
    obj.label190:setHint("Preço da Arma");
    obj.label190:setField("Preco14");
    obj.label190:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label190, "fontStyle",  "bold");
    obj.label190:setFontColor("yellow");
    obj.label190:setFontFamily("kalam");
    obj.label190:setCursor("handPoint");
    obj.label190:setHitTest(true);
    obj.label190:setName("label190");

    obj.image127 = GUI.fromHandle(_obj_newObject("image"));
    obj.image127:setParent(obj.Arma14);
    obj.image127:setLeft(41.38);
    obj.image127:setTop(61.75);
    obj.image127:setWidth(67.88);
    obj.image127:setHeight(30);
    obj.image127:setCursor("handPoint");
    obj.image127:setHitTest(true);
    obj.image127:setHint("Clique aqui para comprar");
    obj.image127:setName("image127");

    obj.image128 = GUI.fromHandle(_obj_newObject("image"));
    obj.image128:setParent(obj.Arma14);
    obj.image128:setLeft(2.56);
    obj.image128:setTop(93.00);
    obj.image128:setWidth(136.69);
    obj.image128:setHeight(77.69);
    obj.image128:setStyle("proportional");
    obj.image128:setCenter(true);
    obj.image128:setEditable(true);
    obj.image128:setField("ImagemArma14");
    obj.image128:setName("image128");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.Arma14);
    obj.label191:setLeft(197);
    obj.label191:setTop(10);
    obj.label191:setWidth(249.25);
    obj.label191:setHeight(39);
    obj.label191:setFontSize(16);
    obj.label191:setField("ItemNome14");
    lfm_setPropAsString(obj.label191, "fontStyle",  "bold");
    obj.label191:setFontColor("black");
    obj.label191:setFontFamily("kalam");
    obj.label191:setName("label191");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.Arma14);
    obj.label192:setLeft(207.88);
    obj.label192:setTop(51);
    obj.label192:setWidth(49.88);
    obj.label192:setHeight(31.38);
    obj.label192:setHorzTextAlign("center");
    obj.label192:setField("Iniciativa14");
    obj.label192:setFontSize(19);
    lfm_setPropAsString(obj.label192, "fontStyle",  "bold");
    obj.label192:setFontColor("black");
    obj.label192:setFontFamily("kalam");
    obj.label192:setName("label192");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.Arma14);
    obj.label193:setLeft(182.88);
    obj.label193:setTop(90);
    obj.label193:setWidth(50.88);
    obj.label193:setHeight(31.38);
    obj.label193:setHorzTextAlign("center");
    obj.label193:setField("DanoItem14");
    obj.label193:setFontSize(19);
    lfm_setPropAsString(obj.label193, "fontStyle",  "bold");
    obj.label193:setFontColor("black");
    obj.label193:setFontFamily("kalam");
    obj.label193:setName("label193");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.Arma14);
    obj.label194:setLeft(195.88);
    obj.label194:setTop(128);
    obj.label194:setWidth(50.88);
    obj.label194:setHeight(32);
    obj.label194:setHorzTextAlign("center");
    obj.label194:setField("Alcance14");
    obj.label194:setFontSize(15);
    lfm_setPropAsString(obj.label194, "fontStyle",  "bold");
    obj.label194:setFontColor("black");
    obj.label194:setFontFamily("kalam");
    obj.label194:setName("label194");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.Arma14);
    obj.label195:setLeft(317.88);
    obj.label195:setTop(49);
    obj.label195:setWidth(68.88);
    obj.label195:setHeight(32);
    obj.label195:setHorzTextAlign("center");
    obj.label195:setField("Cadencia14");
    obj.label195:setFontSize(19);
    lfm_setPropAsString(obj.label195, "fontStyle",  "bold");
    obj.label195:setFontColor("black");
    obj.label195:setFontFamily("kalam");
    obj.label195:setName("label195");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.Arma14);
    obj.label196:setLeft(317.88);
    obj.label196:setTop(89);
    obj.label196:setWidth(68.88);
    obj.label196:setHeight(32);
    obj.label196:setHorzTextAlign("center");
    obj.label196:setField("Municao14");
    obj.label196:setFontSize(19);
    lfm_setPropAsString(obj.label196, "fontStyle",  "bold");
    obj.label196:setFontColor("black");
    obj.label196:setFontFamily("kalam");
    obj.label196:setName("label196");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.Arma14);
    obj.label197:setLeft(317.88);
    obj.label197:setTop(125);
    obj.label197:setWidth(48.12);
    obj.label197:setHeight(32);
    obj.label197:setHorzTextAlign("center");
    obj.label197:setField("ClasseDeDureza14");
    obj.label197:setFontSize(19);
    lfm_setPropAsString(obj.label197, "fontStyle",  "bold");
    obj.label197:setFontColor("black");
    obj.label197:setFontFamily("kalam");
    obj.label197:setName("label197");

    obj.Arma15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma15:setParent(obj.scrollBox10);
    obj.Arma15:setName("Arma15");
    obj.Arma15:setWidth(480);
    obj.Arma15:setHeight(174);
    obj.Arma15:setLeft(413);
    obj.Arma15:setTop(452);

    obj.image129 = GUI.fromHandle(_obj_newObject("image"));
    obj.image129:setParent(obj.Arma15);
    obj.image129:setSRC("images/Loja.png");
    obj.image129:setLeft(0);
    obj.image129:setTop(0);
    obj.image129:setWidth(399);
    obj.image129:setHeight(174);
    obj.image129:setName("image129");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.Arma15);
    obj.label198:setLeft(22.25);
    obj.label198:setTop(20.50);
    obj.label198:setWidth(107.25);
    obj.label198:setHeight(37.88);
    obj.label198:setFontSize(22);
    obj.label198:setHint("Preço da Arma");
    obj.label198:setField("Preco15");
    obj.label198:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label198, "fontStyle",  "bold");
    obj.label198:setFontColor("yellow");
    obj.label198:setFontFamily("kalam");
    obj.label198:setCursor("handPoint");
    obj.label198:setHitTest(true);
    obj.label198:setName("label198");

    obj.image130 = GUI.fromHandle(_obj_newObject("image"));
    obj.image130:setParent(obj.Arma15);
    obj.image130:setLeft(41.38);
    obj.image130:setTop(61.75);
    obj.image130:setWidth(67.88);
    obj.image130:setHeight(30);
    obj.image130:setCursor("handPoint");
    obj.image130:setHitTest(true);
    obj.image130:setHint("Clique aqui para comprar");
    obj.image130:setName("image130");

    obj.image131 = GUI.fromHandle(_obj_newObject("image"));
    obj.image131:setParent(obj.Arma15);
    obj.image131:setLeft(2.56);
    obj.image131:setTop(93.00);
    obj.image131:setWidth(136.69);
    obj.image131:setHeight(77.69);
    obj.image131:setStyle("proportional");
    obj.image131:setCenter(true);
    obj.image131:setEditable(true);
    obj.image131:setField("ImagemArma15");
    obj.image131:setName("image131");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.Arma15);
    obj.label199:setLeft(197);
    obj.label199:setTop(10);
    obj.label199:setWidth(249.25);
    obj.label199:setHeight(39);
    obj.label199:setFontSize(18);
    obj.label199:setField("ItemNome15");
    lfm_setPropAsString(obj.label199, "fontStyle",  "bold");
    obj.label199:setFontColor("black");
    obj.label199:setFontFamily("kalam");
    obj.label199:setName("label199");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.Arma15);
    obj.label200:setLeft(207.88);
    obj.label200:setTop(51);
    obj.label200:setWidth(49.88);
    obj.label200:setHeight(31.38);
    obj.label200:setHorzTextAlign("center");
    obj.label200:setField("Iniciativa15");
    obj.label200:setFontSize(19);
    lfm_setPropAsString(obj.label200, "fontStyle",  "bold");
    obj.label200:setFontColor("black");
    obj.label200:setFontFamily("kalam");
    obj.label200:setName("label200");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.Arma15);
    obj.label201:setLeft(182.88);
    obj.label201:setTop(90);
    obj.label201:setWidth(50.88);
    obj.label201:setHeight(31.38);
    obj.label201:setHorzTextAlign("center");
    obj.label201:setField("DanoItem15");
    obj.label201:setFontSize(19);
    lfm_setPropAsString(obj.label201, "fontStyle",  "bold");
    obj.label201:setFontColor("black");
    obj.label201:setFontFamily("kalam");
    obj.label201:setName("label201");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.Arma15);
    obj.label202:setLeft(195.88);
    obj.label202:setTop(128);
    obj.label202:setWidth(50.88);
    obj.label202:setHeight(32);
    obj.label202:setHorzTextAlign("center");
    obj.label202:setField("Alcance15");
    obj.label202:setFontSize(15);
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold");
    obj.label202:setFontColor("black");
    obj.label202:setFontFamily("kalam");
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.Arma15);
    obj.label203:setLeft(317.88);
    obj.label203:setTop(49);
    obj.label203:setWidth(68.88);
    obj.label203:setHeight(32);
    obj.label203:setHorzTextAlign("center");
    obj.label203:setField("Cadencia15");
    obj.label203:setFontSize(19);
    lfm_setPropAsString(obj.label203, "fontStyle",  "bold");
    obj.label203:setFontColor("black");
    obj.label203:setFontFamily("kalam");
    obj.label203:setName("label203");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.Arma15);
    obj.label204:setLeft(317.88);
    obj.label204:setTop(89);
    obj.label204:setWidth(68.88);
    obj.label204:setHeight(32);
    obj.label204:setHorzTextAlign("center");
    obj.label204:setField("Municao15");
    obj.label204:setFontSize(19);
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold");
    obj.label204:setFontColor("black");
    obj.label204:setFontFamily("kalam");
    obj.label204:setName("label204");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.Arma15);
    obj.label205:setLeft(317.88);
    obj.label205:setTop(125);
    obj.label205:setWidth(48.12);
    obj.label205:setHeight(32);
    obj.label205:setHorzTextAlign("center");
    obj.label205:setField("ClasseDeDureza15");
    obj.label205:setFontSize(19);
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold");
    obj.label205:setFontColor("black");
    obj.label205:setFontFamily("kalam");
    obj.label205:setName("label205");

    obj.Arma16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma16:setParent(obj.scrollBox10);
    obj.Arma16:setName("Arma16");
    obj.Arma16:setWidth(480);
    obj.Arma16:setHeight(174);
    obj.Arma16:setLeft(413);
    obj.Arma16:setTop(634);

    obj.image132 = GUI.fromHandle(_obj_newObject("image"));
    obj.image132:setParent(obj.Arma16);
    obj.image132:setSRC("images/Loja.png");
    obj.image132:setLeft(0);
    obj.image132:setTop(0);
    obj.image132:setWidth(399);
    obj.image132:setHeight(174);
    obj.image132:setName("image132");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.Arma16);
    obj.label206:setLeft(22.25);
    obj.label206:setTop(20.50);
    obj.label206:setWidth(107.25);
    obj.label206:setHeight(37.88);
    obj.label206:setFontSize(22);
    obj.label206:setHint("Preço da Arma");
    obj.label206:setField("Preco16");
    obj.label206:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold");
    obj.label206:setFontColor("yellow");
    obj.label206:setFontFamily("kalam");
    obj.label206:setCursor("handPoint");
    obj.label206:setHitTest(true);
    obj.label206:setName("label206");

    obj.image133 = GUI.fromHandle(_obj_newObject("image"));
    obj.image133:setParent(obj.Arma16);
    obj.image133:setLeft(41.38);
    obj.image133:setTop(61.75);
    obj.image133:setWidth(67.88);
    obj.image133:setHeight(30);
    obj.image133:setCursor("handPoint");
    obj.image133:setHitTest(true);
    obj.image133:setHint("Clique aqui para comprar");
    obj.image133:setName("image133");

    obj.image134 = GUI.fromHandle(_obj_newObject("image"));
    obj.image134:setParent(obj.Arma16);
    obj.image134:setLeft(2.56);
    obj.image134:setTop(93.00);
    obj.image134:setWidth(136.69);
    obj.image134:setHeight(77.69);
    obj.image134:setStyle("proportional");
    obj.image134:setCenter(true);
    obj.image134:setEditable(true);
    obj.image134:setField("ImagemArma16");
    obj.image134:setName("image134");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.Arma16);
    obj.label207:setLeft(197);
    obj.label207:setTop(10);
    obj.label207:setWidth(249.25);
    obj.label207:setHeight(39);
    obj.label207:setFontSize(19);
    obj.label207:setField("ItemNome16");
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold");
    obj.label207:setFontColor("black");
    obj.label207:setFontFamily("kalam");
    obj.label207:setName("label207");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.Arma16);
    obj.label208:setLeft(207.88);
    obj.label208:setTop(51);
    obj.label208:setWidth(49.88);
    obj.label208:setHeight(31.38);
    obj.label208:setHorzTextAlign("center");
    obj.label208:setField("Iniciativa16");
    obj.label208:setFontSize(19);
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold");
    obj.label208:setFontColor("black");
    obj.label208:setFontFamily("kalam");
    obj.label208:setName("label208");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.Arma16);
    obj.label209:setLeft(182.88);
    obj.label209:setTop(90);
    obj.label209:setWidth(50.88);
    obj.label209:setHeight(31.38);
    obj.label209:setHorzTextAlign("center");
    obj.label209:setField("DanoItem16");
    obj.label209:setFontSize(19);
    lfm_setPropAsString(obj.label209, "fontStyle",  "bold");
    obj.label209:setFontColor("black");
    obj.label209:setFontFamily("kalam");
    obj.label209:setName("label209");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.Arma16);
    obj.label210:setLeft(195.88);
    obj.label210:setTop(128);
    obj.label210:setWidth(50.88);
    obj.label210:setHeight(32);
    obj.label210:setHorzTextAlign("center");
    obj.label210:setField("Alcance16");
    obj.label210:setFontSize(15);
    lfm_setPropAsString(obj.label210, "fontStyle",  "bold");
    obj.label210:setFontColor("black");
    obj.label210:setFontFamily("kalam");
    obj.label210:setName("label210");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.Arma16);
    obj.label211:setLeft(317.88);
    obj.label211:setTop(49);
    obj.label211:setWidth(68.88);
    obj.label211:setHeight(32);
    obj.label211:setHorzTextAlign("center");
    obj.label211:setField("Cadencia16");
    obj.label211:setFontSize(19);
    lfm_setPropAsString(obj.label211, "fontStyle",  "bold");
    obj.label211:setFontColor("black");
    obj.label211:setFontFamily("kalam");
    obj.label211:setName("label211");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.Arma16);
    obj.label212:setLeft(317.88);
    obj.label212:setTop(89);
    obj.label212:setWidth(68.88);
    obj.label212:setHeight(32);
    obj.label212:setHorzTextAlign("center");
    obj.label212:setField("Municao16");
    obj.label212:setFontSize(19);
    lfm_setPropAsString(obj.label212, "fontStyle",  "bold");
    obj.label212:setFontColor("black");
    obj.label212:setFontFamily("kalam");
    obj.label212:setName("label212");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.Arma16);
    obj.label213:setLeft(317.88);
    obj.label213:setTop(125);
    obj.label213:setWidth(48.12);
    obj.label213:setHeight(32);
    obj.label213:setHorzTextAlign("center");
    obj.label213:setField("ClasseDeDureza16");
    obj.label213:setFontSize(19);
    lfm_setPropAsString(obj.label213, "fontStyle",  "bold");
    obj.label213:setFontColor("black");
    obj.label213:setFontFamily("kalam");
    obj.label213:setName("label213");

    obj.Arma17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma17:setParent(obj.scrollBox10);
    obj.Arma17:setName("Arma17");
    obj.Arma17:setWidth(480);
    obj.Arma17:setHeight(174);
    obj.Arma17:setLeft(413);
    obj.Arma17:setTop(816);

    obj.image135 = GUI.fromHandle(_obj_newObject("image"));
    obj.image135:setParent(obj.Arma17);
    obj.image135:setSRC("images/Loja.png");
    obj.image135:setLeft(0);
    obj.image135:setTop(0);
    obj.image135:setWidth(399);
    obj.image135:setHeight(174);
    obj.image135:setName("image135");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.Arma17);
    obj.label214:setLeft(22.25);
    obj.label214:setTop(20.50);
    obj.label214:setWidth(107.25);
    obj.label214:setHeight(37.88);
    obj.label214:setFontSize(22);
    obj.label214:setHint("Preço da Arma");
    obj.label214:setField("Preco17");
    obj.label214:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold");
    obj.label214:setFontColor("yellow");
    obj.label214:setFontFamily("kalam");
    obj.label214:setCursor("handPoint");
    obj.label214:setHitTest(true);
    obj.label214:setName("label214");

    obj.image136 = GUI.fromHandle(_obj_newObject("image"));
    obj.image136:setParent(obj.Arma17);
    obj.image136:setLeft(41.38);
    obj.image136:setTop(61.75);
    obj.image136:setWidth(67.88);
    obj.image136:setHeight(30);
    obj.image136:setCursor("handPoint");
    obj.image136:setHitTest(true);
    obj.image136:setHint("Clique aqui para comprar");
    obj.image136:setName("image136");

    obj.image137 = GUI.fromHandle(_obj_newObject("image"));
    obj.image137:setParent(obj.Arma17);
    obj.image137:setLeft(2.56);
    obj.image137:setTop(93.00);
    obj.image137:setWidth(136.69);
    obj.image137:setHeight(77.69);
    obj.image137:setStyle("proportional");
    obj.image137:setCenter(true);
    obj.image137:setEditable(true);
    obj.image137:setField("ImagemArma17");
    obj.image137:setName("image137");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.Arma17);
    obj.label215:setLeft(197);
    obj.label215:setTop(10);
    obj.label215:setWidth(249.25);
    obj.label215:setHeight(39);
    obj.label215:setFontSize(22);
    obj.label215:setField("ItemNome17");
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold");
    obj.label215:setFontColor("black");
    obj.label215:setFontFamily("kalam");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.Arma17);
    obj.label216:setLeft(207.88);
    obj.label216:setTop(51);
    obj.label216:setWidth(49.88);
    obj.label216:setHeight(31.38);
    obj.label216:setHorzTextAlign("center");
    obj.label216:setField("Iniciativa17");
    obj.label216:setFontSize(19);
    lfm_setPropAsString(obj.label216, "fontStyle",  "bold");
    obj.label216:setFontColor("black");
    obj.label216:setFontFamily("kalam");
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.Arma17);
    obj.label217:setLeft(182.88);
    obj.label217:setTop(90);
    obj.label217:setWidth(50.88);
    obj.label217:setHeight(31.38);
    obj.label217:setHorzTextAlign("center");
    obj.label217:setField("DanoItem17");
    obj.label217:setFontSize(19);
    lfm_setPropAsString(obj.label217, "fontStyle",  "bold");
    obj.label217:setFontColor("black");
    obj.label217:setFontFamily("kalam");
    obj.label217:setName("label217");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.Arma17);
    obj.label218:setLeft(195.88);
    obj.label218:setTop(128);
    obj.label218:setWidth(50.88);
    obj.label218:setHeight(32);
    obj.label218:setHorzTextAlign("center");
    obj.label218:setField("Alcance17");
    obj.label218:setFontSize(15);
    lfm_setPropAsString(obj.label218, "fontStyle",  "bold");
    obj.label218:setFontColor("black");
    obj.label218:setFontFamily("kalam");
    obj.label218:setName("label218");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.Arma17);
    obj.label219:setLeft(317.88);
    obj.label219:setTop(49);
    obj.label219:setWidth(68.88);
    obj.label219:setHeight(32);
    obj.label219:setHorzTextAlign("center");
    obj.label219:setField("Cadencia17");
    obj.label219:setFontSize(19);
    lfm_setPropAsString(obj.label219, "fontStyle",  "bold");
    obj.label219:setFontColor("black");
    obj.label219:setFontFamily("kalam");
    obj.label219:setName("label219");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.Arma17);
    obj.label220:setLeft(317.88);
    obj.label220:setTop(89);
    obj.label220:setWidth(68.88);
    obj.label220:setHeight(32);
    obj.label220:setHorzTextAlign("center");
    obj.label220:setField("Municao17");
    obj.label220:setFontSize(19);
    lfm_setPropAsString(obj.label220, "fontStyle",  "bold");
    obj.label220:setFontColor("black");
    obj.label220:setFontFamily("kalam");
    obj.label220:setName("label220");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.Arma17);
    obj.label221:setLeft(317.88);
    obj.label221:setTop(125);
    obj.label221:setWidth(48.12);
    obj.label221:setHeight(32);
    obj.label221:setHorzTextAlign("center");
    obj.label221:setField("ClasseDeDureza17");
    obj.label221:setFontSize(19);
    lfm_setPropAsString(obj.label221, "fontStyle",  "bold");
    obj.label221:setFontColor("black");
    obj.label221:setFontFamily("kalam");
    obj.label221:setName("label221");

    obj.Arma18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma18:setParent(obj.scrollBox10);
    obj.Arma18:setName("Arma18");
    obj.Arma18:setWidth(480);
    obj.Arma18:setHeight(174);
    obj.Arma18:setLeft(413);
    obj.Arma18:setTop(998);

    obj.image138 = GUI.fromHandle(_obj_newObject("image"));
    obj.image138:setParent(obj.Arma18);
    obj.image138:setSRC("images/Loja.png");
    obj.image138:setLeft(0);
    obj.image138:setTop(0);
    obj.image138:setWidth(399);
    obj.image138:setHeight(174);
    obj.image138:setName("image138");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.Arma18);
    obj.label222:setLeft(22.25);
    obj.label222:setTop(20.50);
    obj.label222:setWidth(107.25);
    obj.label222:setHeight(37.88);
    obj.label222:setFontSize(22);
    obj.label222:setHint("Preço da Arma");
    obj.label222:setField("Preco18");
    obj.label222:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label222, "fontStyle",  "bold");
    obj.label222:setFontColor("yellow");
    obj.label222:setFontFamily("kalam");
    obj.label222:setCursor("handPoint");
    obj.label222:setHitTest(true);
    obj.label222:setName("label222");

    obj.image139 = GUI.fromHandle(_obj_newObject("image"));
    obj.image139:setParent(obj.Arma18);
    obj.image139:setLeft(41.38);
    obj.image139:setTop(61.75);
    obj.image139:setWidth(67.88);
    obj.image139:setHeight(30);
    obj.image139:setCursor("handPoint");
    obj.image139:setHitTest(true);
    obj.image139:setHint("Clique aqui para comprar");
    obj.image139:setName("image139");

    obj.image140 = GUI.fromHandle(_obj_newObject("image"));
    obj.image140:setParent(obj.Arma18);
    obj.image140:setLeft(2.56);
    obj.image140:setTop(93.00);
    obj.image140:setWidth(136.69);
    obj.image140:setHeight(77.69);
    obj.image140:setStyle("proportional");
    obj.image140:setCenter(true);
    obj.image140:setEditable(true);
    obj.image140:setField("ImagemArma18");
    obj.image140:setName("image140");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.Arma18);
    obj.label223:setLeft(197);
    obj.label223:setTop(10);
    obj.label223:setWidth(249.25);
    obj.label223:setHeight(39);
    obj.label223:setFontSize(22);
    obj.label223:setField("ItemNome18");
    lfm_setPropAsString(obj.label223, "fontStyle",  "bold");
    obj.label223:setFontColor("black");
    obj.label223:setFontFamily("kalam");
    obj.label223:setName("label223");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.Arma18);
    obj.label224:setLeft(207.88);
    obj.label224:setTop(51);
    obj.label224:setWidth(49.88);
    obj.label224:setHeight(31.38);
    obj.label224:setHorzTextAlign("center");
    obj.label224:setField("Iniciativa18");
    obj.label224:setFontSize(19);
    lfm_setPropAsString(obj.label224, "fontStyle",  "bold");
    obj.label224:setFontColor("black");
    obj.label224:setFontFamily("kalam");
    obj.label224:setName("label224");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.Arma18);
    obj.label225:setLeft(182.88);
    obj.label225:setTop(90);
    obj.label225:setWidth(50.88);
    obj.label225:setHeight(31.38);
    obj.label225:setHorzTextAlign("center");
    obj.label225:setField("DanoItem18");
    obj.label225:setFontSize(19);
    lfm_setPropAsString(obj.label225, "fontStyle",  "bold");
    obj.label225:setFontColor("black");
    obj.label225:setFontFamily("kalam");
    obj.label225:setName("label225");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.Arma18);
    obj.label226:setLeft(195.88);
    obj.label226:setTop(128);
    obj.label226:setWidth(50.88);
    obj.label226:setHeight(32);
    obj.label226:setHorzTextAlign("center");
    obj.label226:setField("Alcance18");
    obj.label226:setFontSize(15);
    lfm_setPropAsString(obj.label226, "fontStyle",  "bold");
    obj.label226:setFontColor("black");
    obj.label226:setFontFamily("kalam");
    obj.label226:setName("label226");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.Arma18);
    obj.label227:setLeft(317.88);
    obj.label227:setTop(49);
    obj.label227:setWidth(68.88);
    obj.label227:setHeight(32);
    obj.label227:setHorzTextAlign("center");
    obj.label227:setField("Cadencia18");
    obj.label227:setFontSize(19);
    lfm_setPropAsString(obj.label227, "fontStyle",  "bold");
    obj.label227:setFontColor("black");
    obj.label227:setFontFamily("kalam");
    obj.label227:setName("label227");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.Arma18);
    obj.label228:setLeft(317.88);
    obj.label228:setTop(89);
    obj.label228:setWidth(68.88);
    obj.label228:setHeight(32);
    obj.label228:setHorzTextAlign("center");
    obj.label228:setField("Municao18");
    obj.label228:setFontSize(19);
    lfm_setPropAsString(obj.label228, "fontStyle",  "bold");
    obj.label228:setFontColor("black");
    obj.label228:setFontFamily("kalam");
    obj.label228:setName("label228");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.Arma18);
    obj.label229:setLeft(317.88);
    obj.label229:setTop(125);
    obj.label229:setWidth(48.12);
    obj.label229:setHeight(32);
    obj.label229:setHorzTextAlign("center");
    obj.label229:setField("ClasseDeDureza18");
    obj.label229:setFontSize(19);
    lfm_setPropAsString(obj.label229, "fontStyle",  "bold");
    obj.label229:setFontColor("black");
    obj.label229:setFontFamily("kalam");
    obj.label229:setName("label229");

    obj.Arma19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma19:setParent(obj.scrollBox10);
    obj.Arma19:setName("Arma19");
    obj.Arma19:setWidth(480);
    obj.Arma19:setHeight(174);
    obj.Arma19:setLeft(413);
    obj.Arma19:setTop(1180);

    obj.image141 = GUI.fromHandle(_obj_newObject("image"));
    obj.image141:setParent(obj.Arma19);
    obj.image141:setSRC("images/Loja.png");
    obj.image141:setLeft(0);
    obj.image141:setTop(0);
    obj.image141:setWidth(399);
    obj.image141:setHeight(174);
    obj.image141:setName("image141");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.Arma19);
    obj.label230:setLeft(22.25);
    obj.label230:setTop(20.50);
    obj.label230:setWidth(107.25);
    obj.label230:setHeight(37.88);
    obj.label230:setFontSize(22);
    obj.label230:setHint("Preço da Arma");
    obj.label230:setField("Preco19");
    obj.label230:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label230, "fontStyle",  "bold");
    obj.label230:setFontColor("yellow");
    obj.label230:setFontFamily("kalam");
    obj.label230:setCursor("handPoint");
    obj.label230:setHitTest(true);
    obj.label230:setName("label230");

    obj.image142 = GUI.fromHandle(_obj_newObject("image"));
    obj.image142:setParent(obj.Arma19);
    obj.image142:setLeft(41.38);
    obj.image142:setTop(61.75);
    obj.image142:setWidth(67.88);
    obj.image142:setHeight(30);
    obj.image142:setCursor("handPoint");
    obj.image142:setHitTest(true);
    obj.image142:setHint("Clique aqui para comprar");
    obj.image142:setName("image142");

    obj.image143 = GUI.fromHandle(_obj_newObject("image"));
    obj.image143:setParent(obj.Arma19);
    obj.image143:setLeft(2.56);
    obj.image143:setTop(93.00);
    obj.image143:setWidth(136.69);
    obj.image143:setHeight(77.69);
    obj.image143:setStyle("proportional");
    obj.image143:setCenter(true);
    obj.image143:setEditable(true);
    obj.image143:setField("ImagemArma19");
    obj.image143:setName("image143");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.Arma19);
    obj.label231:setLeft(197);
    obj.label231:setTop(10);
    obj.label231:setWidth(249.25);
    obj.label231:setHeight(39);
    obj.label231:setFontSize(22);
    obj.label231:setField("ItemNome19");
    lfm_setPropAsString(obj.label231, "fontStyle",  "bold");
    obj.label231:setFontColor("black");
    obj.label231:setFontFamily("kalam");
    obj.label231:setName("label231");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.Arma19);
    obj.label232:setLeft(207.88);
    obj.label232:setTop(51);
    obj.label232:setWidth(49.88);
    obj.label232:setHeight(31.38);
    obj.label232:setHorzTextAlign("center");
    obj.label232:setField("Iniciativa19");
    obj.label232:setFontSize(19);
    lfm_setPropAsString(obj.label232, "fontStyle",  "bold");
    obj.label232:setFontColor("black");
    obj.label232:setFontFamily("kalam");
    obj.label232:setName("label232");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.Arma19);
    obj.label233:setLeft(182.88);
    obj.label233:setTop(90);
    obj.label233:setWidth(50.88);
    obj.label233:setHeight(31.38);
    obj.label233:setHorzTextAlign("center");
    obj.label233:setField("DanoItem19");
    obj.label233:setFontSize(19);
    lfm_setPropAsString(obj.label233, "fontStyle",  "bold");
    obj.label233:setFontColor("black");
    obj.label233:setFontFamily("kalam");
    obj.label233:setName("label233");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.Arma19);
    obj.label234:setLeft(195.88);
    obj.label234:setTop(128);
    obj.label234:setWidth(50.88);
    obj.label234:setHeight(32);
    obj.label234:setHorzTextAlign("center");
    obj.label234:setField("Alcance19");
    obj.label234:setFontSize(15);
    lfm_setPropAsString(obj.label234, "fontStyle",  "bold");
    obj.label234:setFontColor("black");
    obj.label234:setFontFamily("kalam");
    obj.label234:setName("label234");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.Arma19);
    obj.label235:setLeft(317.88);
    obj.label235:setTop(49);
    obj.label235:setWidth(68.88);
    obj.label235:setHeight(32);
    obj.label235:setHorzTextAlign("center");
    obj.label235:setField("Cadencia19");
    obj.label235:setFontSize(19);
    lfm_setPropAsString(obj.label235, "fontStyle",  "bold");
    obj.label235:setFontColor("black");
    obj.label235:setFontFamily("kalam");
    obj.label235:setName("label235");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.Arma19);
    obj.label236:setLeft(317.88);
    obj.label236:setTop(89);
    obj.label236:setWidth(68.88);
    obj.label236:setHeight(32);
    obj.label236:setHorzTextAlign("center");
    obj.label236:setField("Municao19");
    obj.label236:setFontSize(19);
    lfm_setPropAsString(obj.label236, "fontStyle",  "bold");
    obj.label236:setFontColor("black");
    obj.label236:setFontFamily("kalam");
    obj.label236:setName("label236");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.Arma19);
    obj.label237:setLeft(317.88);
    obj.label237:setTop(125);
    obj.label237:setWidth(48.12);
    obj.label237:setHeight(32);
    obj.label237:setHorzTextAlign("center");
    obj.label237:setField("ClasseDeDureza19");
    obj.label237:setFontSize(19);
    lfm_setPropAsString(obj.label237, "fontStyle",  "bold");
    obj.label237:setFontColor("black");
    obj.label237:setFontFamily("kalam");
    obj.label237:setName("label237");

    obj.Arma20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma20:setParent(obj.scrollBox10);
    obj.Arma20:setName("Arma20");
    obj.Arma20:setWidth(480);
    obj.Arma20:setHeight(174);
    obj.Arma20:setLeft(413);
    obj.Arma20:setTop(1362);

    obj.image144 = GUI.fromHandle(_obj_newObject("image"));
    obj.image144:setParent(obj.Arma20);
    obj.image144:setSRC("images/Loja.png");
    obj.image144:setLeft(0);
    obj.image144:setTop(0);
    obj.image144:setWidth(399);
    obj.image144:setHeight(174);
    obj.image144:setName("image144");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.Arma20);
    obj.label238:setLeft(22.25);
    obj.label238:setTop(20.50);
    obj.label238:setWidth(107.25);
    obj.label238:setHeight(37.88);
    obj.label238:setFontSize(22);
    obj.label238:setHint("Preço da Arma");
    obj.label238:setField("Preco20");
    obj.label238:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label238, "fontStyle",  "bold");
    obj.label238:setFontColor("yellow");
    obj.label238:setFontFamily("kalam");
    obj.label238:setCursor("handPoint");
    obj.label238:setHitTest(true);
    obj.label238:setName("label238");

    obj.image145 = GUI.fromHandle(_obj_newObject("image"));
    obj.image145:setParent(obj.Arma20);
    obj.image145:setLeft(41.38);
    obj.image145:setTop(61.75);
    obj.image145:setWidth(67.88);
    obj.image145:setHeight(30);
    obj.image145:setCursor("handPoint");
    obj.image145:setHitTest(true);
    obj.image145:setHint("Clique aqui para comprar");
    obj.image145:setName("image145");

    obj.image146 = GUI.fromHandle(_obj_newObject("image"));
    obj.image146:setParent(obj.Arma20);
    obj.image146:setLeft(2.56);
    obj.image146:setTop(93.00);
    obj.image146:setWidth(136.69);
    obj.image146:setHeight(77.69);
    obj.image146:setStyle("proportional");
    obj.image146:setCenter(true);
    obj.image146:setEditable(true);
    obj.image146:setField("ImagemArma20");
    obj.image146:setName("image146");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.Arma20);
    obj.label239:setLeft(197);
    obj.label239:setTop(10);
    obj.label239:setWidth(249.25);
    obj.label239:setHeight(39);
    obj.label239:setFontSize(22);
    obj.label239:setField("ItemNome20");
    lfm_setPropAsString(obj.label239, "fontStyle",  "bold");
    obj.label239:setFontColor("black");
    obj.label239:setFontFamily("kalam");
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.Arma20);
    obj.label240:setLeft(207.88);
    obj.label240:setTop(51);
    obj.label240:setWidth(49.88);
    obj.label240:setHeight(31.38);
    obj.label240:setHorzTextAlign("center");
    obj.label240:setField("Iniciativa20");
    obj.label240:setFontSize(19);
    lfm_setPropAsString(obj.label240, "fontStyle",  "bold");
    obj.label240:setFontColor("black");
    obj.label240:setFontFamily("kalam");
    obj.label240:setName("label240");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.Arma20);
    obj.label241:setLeft(182.88);
    obj.label241:setTop(90);
    obj.label241:setWidth(50.88);
    obj.label241:setHeight(31.38);
    obj.label241:setHorzTextAlign("center");
    obj.label241:setField("DanoItem20");
    obj.label241:setFontSize(19);
    lfm_setPropAsString(obj.label241, "fontStyle",  "bold");
    obj.label241:setFontColor("black");
    obj.label241:setFontFamily("kalam");
    obj.label241:setName("label241");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.Arma20);
    obj.label242:setLeft(195.88);
    obj.label242:setTop(128);
    obj.label242:setWidth(50.88);
    obj.label242:setHeight(32);
    obj.label242:setHorzTextAlign("center");
    obj.label242:setField("Alcance20");
    obj.label242:setFontSize(15);
    lfm_setPropAsString(obj.label242, "fontStyle",  "bold");
    obj.label242:setFontColor("black");
    obj.label242:setFontFamily("kalam");
    obj.label242:setName("label242");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.Arma20);
    obj.label243:setLeft(317.88);
    obj.label243:setTop(49);
    obj.label243:setWidth(68.88);
    obj.label243:setHeight(32);
    obj.label243:setHorzTextAlign("center");
    obj.label243:setField("Cadencia20");
    obj.label243:setFontSize(19);
    lfm_setPropAsString(obj.label243, "fontStyle",  "bold");
    obj.label243:setFontColor("black");
    obj.label243:setFontFamily("kalam");
    obj.label243:setName("label243");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.Arma20);
    obj.label244:setLeft(317.88);
    obj.label244:setTop(89);
    obj.label244:setWidth(68.88);
    obj.label244:setHeight(32);
    obj.label244:setHorzTextAlign("center");
    obj.label244:setField("Municao20");
    obj.label244:setFontSize(19);
    lfm_setPropAsString(obj.label244, "fontStyle",  "bold");
    obj.label244:setFontColor("black");
    obj.label244:setFontFamily("kalam");
    obj.label244:setName("label244");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.Arma20);
    obj.label245:setLeft(317.88);
    obj.label245:setTop(125);
    obj.label245:setWidth(48.12);
    obj.label245:setHeight(32);
    obj.label245:setHorzTextAlign("center");
    obj.label245:setField("ClasseDeDureza20");
    obj.label245:setFontSize(19);
    lfm_setPropAsString(obj.label245, "fontStyle",  "bold");
    obj.label245:setFontColor("black");
    obj.label245:setFontFamily("kalam");
    obj.label245:setName("label245");

    obj.Arma21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma21:setParent(obj.scrollBox10);
    obj.Arma21:setName("Arma21");
    obj.Arma21:setWidth(480);
    obj.Arma21:setHeight(174);
    obj.Arma21:setLeft(413);
    obj.Arma21:setTop(1544);

    obj.image147 = GUI.fromHandle(_obj_newObject("image"));
    obj.image147:setParent(obj.Arma21);
    obj.image147:setSRC("images/Loja.png");
    obj.image147:setLeft(0);
    obj.image147:setTop(0);
    obj.image147:setWidth(399);
    obj.image147:setHeight(174);
    obj.image147:setName("image147");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.Arma21);
    obj.label246:setLeft(22.25);
    obj.label246:setTop(20.50);
    obj.label246:setWidth(107.25);
    obj.label246:setHeight(37.88);
    obj.label246:setFontSize(22);
    obj.label246:setHint("Preço da Arma");
    obj.label246:setField("Preco21");
    obj.label246:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label246, "fontStyle",  "bold");
    obj.label246:setFontColor("yellow");
    obj.label246:setFontFamily("kalam");
    obj.label246:setCursor("handPoint");
    obj.label246:setHitTest(true);
    obj.label246:setName("label246");

    obj.image148 = GUI.fromHandle(_obj_newObject("image"));
    obj.image148:setParent(obj.Arma21);
    obj.image148:setLeft(41.38);
    obj.image148:setTop(61.75);
    obj.image148:setWidth(67.88);
    obj.image148:setHeight(30);
    obj.image148:setCursor("handPoint");
    obj.image148:setHitTest(true);
    obj.image148:setHint("Clique aqui para comprar");
    obj.image148:setName("image148");

    obj.image149 = GUI.fromHandle(_obj_newObject("image"));
    obj.image149:setParent(obj.Arma21);
    obj.image149:setLeft(2.56);
    obj.image149:setTop(93.00);
    obj.image149:setWidth(136.69);
    obj.image149:setHeight(77.69);
    obj.image149:setStyle("proportional");
    obj.image149:setCenter(true);
    obj.image149:setEditable(true);
    obj.image149:setField("ImagemArma21");
    obj.image149:setName("image149");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.Arma21);
    obj.label247:setLeft(197);
    obj.label247:setTop(10);
    obj.label247:setWidth(249.25);
    obj.label247:setHeight(39);
    obj.label247:setFontSize(22);
    obj.label247:setField("ItemNome21");
    lfm_setPropAsString(obj.label247, "fontStyle",  "bold");
    obj.label247:setFontColor("black");
    obj.label247:setFontFamily("kalam");
    obj.label247:setName("label247");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.Arma21);
    obj.label248:setLeft(207.88);
    obj.label248:setTop(51);
    obj.label248:setWidth(49.88);
    obj.label248:setHeight(31.38);
    obj.label248:setHorzTextAlign("center");
    obj.label248:setField("Iniciativa21");
    obj.label248:setFontSize(19);
    lfm_setPropAsString(obj.label248, "fontStyle",  "bold");
    obj.label248:setFontColor("black");
    obj.label248:setFontFamily("kalam");
    obj.label248:setName("label248");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.Arma21);
    obj.label249:setLeft(182.88);
    obj.label249:setTop(90);
    obj.label249:setWidth(50.88);
    obj.label249:setHeight(31.38);
    obj.label249:setHorzTextAlign("center");
    obj.label249:setField("DanoItem21");
    obj.label249:setFontSize(19);
    lfm_setPropAsString(obj.label249, "fontStyle",  "bold");
    obj.label249:setFontColor("black");
    obj.label249:setFontFamily("kalam");
    obj.label249:setName("label249");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.Arma21);
    obj.label250:setLeft(195.88);
    obj.label250:setTop(128);
    obj.label250:setWidth(50.88);
    obj.label250:setHeight(32);
    obj.label250:setHorzTextAlign("center");
    obj.label250:setField("Alcance21");
    obj.label250:setFontSize(15);
    lfm_setPropAsString(obj.label250, "fontStyle",  "bold");
    obj.label250:setFontColor("black");
    obj.label250:setFontFamily("kalam");
    obj.label250:setName("label250");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.Arma21);
    obj.label251:setLeft(317.88);
    obj.label251:setTop(49);
    obj.label251:setWidth(68.88);
    obj.label251:setHeight(32);
    obj.label251:setHorzTextAlign("center");
    obj.label251:setField("Cadencia21");
    obj.label251:setFontSize(19);
    lfm_setPropAsString(obj.label251, "fontStyle",  "bold");
    obj.label251:setFontColor("black");
    obj.label251:setFontFamily("kalam");
    obj.label251:setName("label251");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.Arma21);
    obj.label252:setLeft(317.88);
    obj.label252:setTop(89);
    obj.label252:setWidth(68.88);
    obj.label252:setHeight(32);
    obj.label252:setHorzTextAlign("center");
    obj.label252:setField("Municao21");
    obj.label252:setFontSize(19);
    lfm_setPropAsString(obj.label252, "fontStyle",  "bold");
    obj.label252:setFontColor("black");
    obj.label252:setFontFamily("kalam");
    obj.label252:setName("label252");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.Arma21);
    obj.label253:setLeft(317.88);
    obj.label253:setTop(125);
    obj.label253:setWidth(48.12);
    obj.label253:setHeight(32);
    obj.label253:setHorzTextAlign("center");
    obj.label253:setField("ClasseDeDureza21");
    obj.label253:setFontSize(19);
    lfm_setPropAsString(obj.label253, "fontStyle",  "bold");
    obj.label253:setFontColor("black");
    obj.label253:setFontFamily("kalam");
    obj.label253:setName("label253");

    obj.Arma22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma22:setParent(obj.scrollBox10);
    obj.Arma22:setName("Arma22");
    obj.Arma22:setWidth(480);
    obj.Arma22:setHeight(174);
    obj.Arma22:setLeft(413);
    obj.Arma22:setTop(1726);

    obj.image150 = GUI.fromHandle(_obj_newObject("image"));
    obj.image150:setParent(obj.Arma22);
    obj.image150:setSRC("images/Loja.png");
    obj.image150:setLeft(0);
    obj.image150:setTop(0);
    obj.image150:setWidth(399);
    obj.image150:setHeight(174);
    obj.image150:setName("image150");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.Arma22);
    obj.label254:setLeft(22.25);
    obj.label254:setTop(20.50);
    obj.label254:setWidth(107.25);
    obj.label254:setHeight(37.88);
    obj.label254:setFontSize(22);
    obj.label254:setHint("Preço da Arma");
    obj.label254:setField("Preco22");
    obj.label254:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label254, "fontStyle",  "bold");
    obj.label254:setFontColor("yellow");
    obj.label254:setFontFamily("kalam");
    obj.label254:setCursor("handPoint");
    obj.label254:setHitTest(true);
    obj.label254:setName("label254");

    obj.image151 = GUI.fromHandle(_obj_newObject("image"));
    obj.image151:setParent(obj.Arma22);
    obj.image151:setLeft(41.38);
    obj.image151:setTop(61.75);
    obj.image151:setWidth(67.88);
    obj.image151:setHeight(30);
    obj.image151:setCursor("handPoint");
    obj.image151:setHitTest(true);
    obj.image151:setHint("Clique aqui para comprar");
    obj.image151:setName("image151");

    obj.image152 = GUI.fromHandle(_obj_newObject("image"));
    obj.image152:setParent(obj.Arma22);
    obj.image152:setLeft(2.56);
    obj.image152:setTop(93.00);
    obj.image152:setWidth(136.69);
    obj.image152:setHeight(77.69);
    obj.image152:setStyle("proportional");
    obj.image152:setCenter(true);
    obj.image152:setEditable(true);
    obj.image152:setField("ImagemArma22");
    obj.image152:setName("image152");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.Arma22);
    obj.label255:setLeft(197);
    obj.label255:setTop(10);
    obj.label255:setWidth(249.25);
    obj.label255:setHeight(39);
    obj.label255:setFontSize(22);
    obj.label255:setField("ItemNome22");
    lfm_setPropAsString(obj.label255, "fontStyle",  "bold");
    obj.label255:setFontColor("black");
    obj.label255:setFontFamily("kalam");
    obj.label255:setName("label255");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.Arma22);
    obj.label256:setLeft(207.88);
    obj.label256:setTop(51);
    obj.label256:setWidth(49.88);
    obj.label256:setHeight(31.38);
    obj.label256:setHorzTextAlign("center");
    obj.label256:setField("Iniciativa22");
    obj.label256:setFontSize(19);
    lfm_setPropAsString(obj.label256, "fontStyle",  "bold");
    obj.label256:setFontColor("black");
    obj.label256:setFontFamily("kalam");
    obj.label256:setName("label256");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.Arma22);
    obj.label257:setLeft(182.88);
    obj.label257:setTop(90);
    obj.label257:setWidth(50.88);
    obj.label257:setHeight(31.38);
    obj.label257:setHorzTextAlign("center");
    obj.label257:setField("DanoItem22");
    obj.label257:setFontSize(12);
    lfm_setPropAsString(obj.label257, "fontStyle",  "bold");
    obj.label257:setFontColor("black");
    obj.label257:setFontFamily("kalam");
    obj.label257:setName("label257");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.Arma22);
    obj.label258:setLeft(195.88);
    obj.label258:setTop(128);
    obj.label258:setWidth(50.88);
    obj.label258:setHeight(32);
    obj.label258:setHorzTextAlign("center");
    obj.label258:setField("Alcance22");
    obj.label258:setFontSize(15);
    lfm_setPropAsString(obj.label258, "fontStyle",  "bold");
    obj.label258:setFontColor("black");
    obj.label258:setFontFamily("kalam");
    obj.label258:setName("label258");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.Arma22);
    obj.label259:setLeft(317.88);
    obj.label259:setTop(49);
    obj.label259:setWidth(68.88);
    obj.label259:setHeight(32);
    obj.label259:setHorzTextAlign("center");
    obj.label259:setField("Cadencia22");
    obj.label259:setFontSize(19);
    lfm_setPropAsString(obj.label259, "fontStyle",  "bold");
    obj.label259:setFontColor("black");
    obj.label259:setFontFamily("kalam");
    obj.label259:setName("label259");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.Arma22);
    obj.label260:setLeft(317.88);
    obj.label260:setTop(89);
    obj.label260:setWidth(68.88);
    obj.label260:setHeight(32);
    obj.label260:setHorzTextAlign("center");
    obj.label260:setField("Municao22");
    obj.label260:setFontSize(19);
    lfm_setPropAsString(obj.label260, "fontStyle",  "bold");
    obj.label260:setFontColor("black");
    obj.label260:setFontFamily("kalam");
    obj.label260:setName("label260");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.Arma22);
    obj.label261:setLeft(317.88);
    obj.label261:setTop(125);
    obj.label261:setWidth(48.12);
    obj.label261:setHeight(32);
    obj.label261:setHorzTextAlign("center");
    obj.label261:setField("ClasseDeDureza22");
    obj.label261:setFontSize(19);
    lfm_setPropAsString(obj.label261, "fontStyle",  "bold");
    obj.label261:setFontColor("black");
    obj.label261:setFontFamily("kalam");
    obj.label261:setName("label261");

    obj.Arma23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma23:setParent(obj.scrollBox10);
    obj.Arma23:setName("Arma23");
    obj.Arma23:setWidth(480);
    obj.Arma23:setHeight(174);
    obj.Arma23:setLeft(413);
    obj.Arma23:setTop(1908);

    obj.image153 = GUI.fromHandle(_obj_newObject("image"));
    obj.image153:setParent(obj.Arma23);
    obj.image153:setSRC("images/Loja.png");
    obj.image153:setLeft(0);
    obj.image153:setTop(0);
    obj.image153:setWidth(399);
    obj.image153:setHeight(174);
    obj.image153:setName("image153");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.Arma23);
    obj.label262:setLeft(22.25);
    obj.label262:setTop(20.50);
    obj.label262:setWidth(107.25);
    obj.label262:setHeight(37.88);
    obj.label262:setFontSize(22);
    obj.label262:setHint("Preço da Arma");
    obj.label262:setField("Preco23");
    obj.label262:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label262, "fontStyle",  "bold");
    obj.label262:setFontColor("yellow");
    obj.label262:setFontFamily("kalam");
    obj.label262:setCursor("handPoint");
    obj.label262:setHitTest(true);
    obj.label262:setName("label262");

    obj.image154 = GUI.fromHandle(_obj_newObject("image"));
    obj.image154:setParent(obj.Arma23);
    obj.image154:setLeft(41.38);
    obj.image154:setTop(61.75);
    obj.image154:setWidth(67.88);
    obj.image154:setHeight(30);
    obj.image154:setCursor("handPoint");
    obj.image154:setHitTest(true);
    obj.image154:setHint("Clique aqui para comprar");
    obj.image154:setName("image154");

    obj.image155 = GUI.fromHandle(_obj_newObject("image"));
    obj.image155:setParent(obj.Arma23);
    obj.image155:setLeft(2.56);
    obj.image155:setTop(93.00);
    obj.image155:setWidth(136.69);
    obj.image155:setHeight(77.69);
    obj.image155:setStyle("proportional");
    obj.image155:setCenter(true);
    obj.image155:setEditable(true);
    obj.image155:setField("ImagemArma23");
    obj.image155:setName("image155");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.Arma23);
    obj.label263:setLeft(197);
    obj.label263:setTop(10);
    obj.label263:setWidth(249.25);
    obj.label263:setHeight(39);
    obj.label263:setFontSize(22);
    obj.label263:setField("ItemNome23");
    lfm_setPropAsString(obj.label263, "fontStyle",  "bold");
    obj.label263:setFontColor("black");
    obj.label263:setFontFamily("kalam");
    obj.label263:setName("label263");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.Arma23);
    obj.label264:setLeft(207.88);
    obj.label264:setTop(51);
    obj.label264:setWidth(49.88);
    obj.label264:setHeight(31.38);
    obj.label264:setHorzTextAlign("center");
    obj.label264:setField("Iniciativa23");
    obj.label264:setFontSize(19);
    lfm_setPropAsString(obj.label264, "fontStyle",  "bold");
    obj.label264:setFontColor("black");
    obj.label264:setFontFamily("kalam");
    obj.label264:setName("label264");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.Arma23);
    obj.label265:setLeft(182.88);
    obj.label265:setTop(90);
    obj.label265:setWidth(50.88);
    obj.label265:setHeight(31.38);
    obj.label265:setHorzTextAlign("center");
    obj.label265:setField("DanoItem23");
    obj.label265:setFontSize(12);
    lfm_setPropAsString(obj.label265, "fontStyle",  "bold");
    obj.label265:setFontColor("black");
    obj.label265:setFontFamily("kalam");
    obj.label265:setName("label265");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.Arma23);
    obj.label266:setLeft(195.88);
    obj.label266:setTop(128);
    obj.label266:setWidth(50.88);
    obj.label266:setHeight(32);
    obj.label266:setHorzTextAlign("center");
    obj.label266:setField("Alcance23");
    obj.label266:setFontSize(15);
    lfm_setPropAsString(obj.label266, "fontStyle",  "bold");
    obj.label266:setFontColor("black");
    obj.label266:setFontFamily("kalam");
    obj.label266:setName("label266");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.Arma23);
    obj.label267:setLeft(317.88);
    obj.label267:setTop(49);
    obj.label267:setWidth(68.88);
    obj.label267:setHeight(32);
    obj.label267:setHorzTextAlign("center");
    obj.label267:setField("Cadencia23");
    obj.label267:setFontSize(19);
    lfm_setPropAsString(obj.label267, "fontStyle",  "bold");
    obj.label267:setFontColor("black");
    obj.label267:setFontFamily("kalam");
    obj.label267:setName("label267");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.Arma23);
    obj.label268:setLeft(317.88);
    obj.label268:setTop(89);
    obj.label268:setWidth(68.88);
    obj.label268:setHeight(32);
    obj.label268:setHorzTextAlign("center");
    obj.label268:setField("Municao23");
    obj.label268:setFontSize(19);
    lfm_setPropAsString(obj.label268, "fontStyle",  "bold");
    obj.label268:setFontColor("black");
    obj.label268:setFontFamily("kalam");
    obj.label268:setName("label268");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.Arma23);
    obj.label269:setLeft(317.88);
    obj.label269:setTop(125);
    obj.label269:setWidth(48.12);
    obj.label269:setHeight(32);
    obj.label269:setHorzTextAlign("center");
    obj.label269:setField("ClasseDeDureza23");
    obj.label269:setFontSize(19);
    lfm_setPropAsString(obj.label269, "fontStyle",  "bold");
    obj.label269:setFontColor("black");
    obj.label269:setFontFamily("kalam");
    obj.label269:setName("label269");

    obj.Arma24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Arma24:setParent(obj.scrollBox10);
    obj.Arma24:setName("Arma24");
    obj.Arma24:setWidth(480);
    obj.Arma24:setHeight(174);
    obj.Arma24:setLeft(413);
    obj.Arma24:setTop(2090);

    obj.image156 = GUI.fromHandle(_obj_newObject("image"));
    obj.image156:setParent(obj.Arma24);
    obj.image156:setSRC("images/Loja.png");
    obj.image156:setLeft(0);
    obj.image156:setTop(0);
    obj.image156:setWidth(399);
    obj.image156:setHeight(174);
    obj.image156:setName("image156");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.Arma24);
    obj.label270:setLeft(22.25);
    obj.label270:setTop(20.50);
    obj.label270:setWidth(107.25);
    obj.label270:setHeight(37.88);
    obj.label270:setFontSize(22);
    obj.label270:setHint("Preço da Arma");
    obj.label270:setField("Preco24");
    obj.label270:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label270, "fontStyle",  "bold");
    obj.label270:setFontColor("yellow");
    obj.label270:setFontFamily("kalam");
    obj.label270:setCursor("handPoint");
    obj.label270:setHitTest(true);
    obj.label270:setName("label270");

    obj.image157 = GUI.fromHandle(_obj_newObject("image"));
    obj.image157:setParent(obj.Arma24);
    obj.image157:setLeft(41.38);
    obj.image157:setTop(61.75);
    obj.image157:setWidth(67.88);
    obj.image157:setHeight(30);
    obj.image157:setCursor("handPoint");
    obj.image157:setHitTest(true);
    obj.image157:setHint("Clique aqui para comprar");
    obj.image157:setName("image157");

    obj.image158 = GUI.fromHandle(_obj_newObject("image"));
    obj.image158:setParent(obj.Arma24);
    obj.image158:setLeft(2.56);
    obj.image158:setTop(93.00);
    obj.image158:setWidth(136.69);
    obj.image158:setHeight(77.69);
    obj.image158:setStyle("proportional");
    obj.image158:setCenter(true);
    obj.image158:setEditable(true);
    obj.image158:setField("ImagemArma24");
    obj.image158:setName("image158");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.Arma24);
    obj.label271:setLeft(197);
    obj.label271:setTop(10);
    obj.label271:setWidth(249.25);
    obj.label271:setHeight(39);
    obj.label271:setFontSize(22);
    obj.label271:setField("ItemNome24");
    lfm_setPropAsString(obj.label271, "fontStyle",  "bold");
    obj.label271:setFontColor("black");
    obj.label271:setFontFamily("kalam");
    obj.label271:setName("label271");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.Arma24);
    obj.label272:setLeft(207.88);
    obj.label272:setTop(51);
    obj.label272:setWidth(49.88);
    obj.label272:setHeight(31.38);
    obj.label272:setHorzTextAlign("center");
    obj.label272:setField("Iniciativa24");
    obj.label272:setFontSize(19);
    lfm_setPropAsString(obj.label272, "fontStyle",  "bold");
    obj.label272:setFontColor("black");
    obj.label272:setFontFamily("kalam");
    obj.label272:setName("label272");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.Arma24);
    obj.label273:setLeft(182.88);
    obj.label273:setTop(90);
    obj.label273:setWidth(50.88);
    obj.label273:setHeight(31.38);
    obj.label273:setHorzTextAlign("center");
    obj.label273:setField("DanoItem24");
    obj.label273:setFontSize(12);
    lfm_setPropAsString(obj.label273, "fontStyle",  "bold");
    obj.label273:setFontColor("black");
    obj.label273:setFontFamily("kalam");
    obj.label273:setName("label273");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.Arma24);
    obj.label274:setLeft(195.88);
    obj.label274:setTop(128);
    obj.label274:setWidth(50.88);
    obj.label274:setHeight(32);
    obj.label274:setHorzTextAlign("center");
    obj.label274:setField("Alcance24");
    obj.label274:setFontSize(15);
    lfm_setPropAsString(obj.label274, "fontStyle",  "bold");
    obj.label274:setFontColor("black");
    obj.label274:setFontFamily("kalam");
    obj.label274:setName("label274");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.Arma24);
    obj.label275:setLeft(317.88);
    obj.label275:setTop(49);
    obj.label275:setWidth(68.88);
    obj.label275:setHeight(32);
    obj.label275:setHorzTextAlign("center");
    obj.label275:setField("Cadencia24");
    obj.label275:setFontSize(19);
    lfm_setPropAsString(obj.label275, "fontStyle",  "bold");
    obj.label275:setFontColor("black");
    obj.label275:setFontFamily("kalam");
    obj.label275:setName("label275");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.Arma24);
    obj.label276:setLeft(317.88);
    obj.label276:setTop(89);
    obj.label276:setWidth(68.88);
    obj.label276:setHeight(32);
    obj.label276:setHorzTextAlign("center");
    obj.label276:setField("Municao24");
    obj.label276:setFontSize(19);
    lfm_setPropAsString(obj.label276, "fontStyle",  "bold");
    obj.label276:setFontColor("black");
    obj.label276:setFontFamily("kalam");
    obj.label276:setName("label276");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.Arma24);
    obj.label277:setLeft(317.88);
    obj.label277:setTop(125);
    obj.label277:setWidth(48.12);
    obj.label277:setHeight(32);
    obj.label277:setHorzTextAlign("center");
    obj.label277:setField("ClasseDeDureza24");
    obj.label277:setFontSize(19);
    lfm_setPropAsString(obj.label277, "fontStyle",  "bold");
    obj.label277:setFontColor("black");
    obj.label277:setFontFamily("kalam");
    obj.label277:setName("label277");

    obj.LojaCorpoACorpo = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaCorpoACorpo:setParent(obj.frmLoja_svg);
    obj.LojaCorpoACorpo:setName("LojaCorpoACorpo");
    obj.LojaCorpoACorpo:setAlign("client");
    obj.LojaCorpoACorpo:setVisible(false);

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.LojaCorpoACorpo);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("white");
    obj.rectangle26:setName("rectangle26");

    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.rectangle26);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.scrollBox11);
    obj.button85:setText("reset");
    obj.button85:setLeft(303);
    obj.button85:setName("button85");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.scrollBox11);
    obj.button86:setText("ADD");
    obj.button86:setLeft(303);
    obj.button86:setTop(20);
    obj.button86:setName("button86");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.scrollBox11);
    obj.layout155:setAlign("client");
    obj.layout155:setName("layout155");

    obj.image159 = GUI.fromHandle(_obj_newObject("image"));
    obj.image159:setParent(obj.layout155);
    obj.image159:setSRC("images/dinheiroArma.png");
    obj.image159:setLeft(0);
    obj.image159:setTop(5);
    obj.image159:setWidth(180.37);
    obj.image159:setHeight(80.25);
    obj.image159:setName("image159");

    obj.labSoma4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma4:setParent(obj.layout155);
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

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.labSoma4);
    obj.dataLink19:setField("Soma");
    obj.dataLink19:setName("dataLink19");

    obj.image160 = GUI.fromHandle(_obj_newObject("image"));
    obj.image160:setParent(obj.scrollBox11);
    obj.image160:setLeft(0);
    obj.image160:setTop(0);
    obj.image160:setWidth(130.37);
    obj.image160:setHeight(62.25);
    obj.image160:setHint("Seu dinheiro");
    obj.image160:setCursor("handPoint");
    obj.image160:setHitTest(true);
    obj.image160:setName("image160");

    obj.image161 = GUI.fromHandle(_obj_newObject("image"));
    obj.image161:setParent(obj.scrollBox11);
    obj.image161:setSRC("images/botaoVoltar.png");
    obj.image161:setLeft(200);
    obj.image161:setTop(29);
    obj.image161:setWidth(50);
    obj.image161:setHeight(50);
    obj.image161:setCursor("handPoint");
    obj.image161:setHint("Clique aqui para voltar");
    obj.image161:setHitTest(true);
    obj.image161:setName("image161");

    obj.CorpoACorpo = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo:setParent(obj.scrollBox11);
    obj.CorpoACorpo:setName("CorpoACorpo");
    obj.CorpoACorpo:setWidth(480);
    obj.CorpoACorpo:setHeight(174);
    obj.CorpoACorpo:setLeft(0);
    obj.CorpoACorpo:setTop(88);

    obj.image162 = GUI.fromHandle(_obj_newObject("image"));
    obj.image162:setParent(obj.CorpoACorpo);
    obj.image162:setSRC("images/LojaCorpoACorpo.png");
    obj.image162:setLeft(0);
    obj.image162:setTop(0);
    obj.image162:setWidth(399);
    obj.image162:setHeight(174);
    obj.image162:setName("image162");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.CorpoACorpo);
    obj.label278:setLeft(22.25);
    obj.label278:setTop(20.50);
    obj.label278:setWidth(107.25);
    obj.label278:setHeight(37.88);
    obj.label278:setFontSize(22);
    obj.label278:setHint("Preço da Arma");
    obj.label278:setField("Preco25");
    obj.label278:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label278, "fontStyle",  "bold");
    obj.label278:setFontColor("yellow");
    obj.label278:setFontFamily("kalam");
    obj.label278:setCursor("handPoint");
    obj.label278:setHitTest(true);
    obj.label278:setName("label278");

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

    obj.image163 = GUI.fromHandle(_obj_newObject("image"));
    obj.image163:setParent(obj.CorpoACorpo);
    obj.image163:setLeft(2.56);
    obj.image163:setTop(93.00);
    obj.image163:setWidth(136.69);
    obj.image163:setHeight(77.69);
    obj.image163:setStyle("proportional");
    obj.image163:setCenter(true);
    obj.image163:setEditable(true);
    obj.image163:setField("ImagemArma25");
    obj.image163:setName("image163");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.CorpoACorpo);
    obj.label279:setLeft(197);
    obj.label279:setTop(10);
    obj.label279:setWidth(249.25);
    obj.label279:setHeight(39);
    obj.label279:setFontSize(22);
    obj.label279:setField("ItemNome25");
    lfm_setPropAsString(obj.label279, "fontStyle",  "bold");
    obj.label279:setFontColor("black");
    obj.label279:setFontFamily("kalam");
    obj.label279:setName("label279");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.CorpoACorpo);
    obj.label280:setLeft(207.88);
    obj.label280:setTop(51);
    obj.label280:setWidth(49.88);
    obj.label280:setHeight(31.38);
    obj.label280:setHorzTextAlign("center");
    obj.label280:setField("Iniciativa25");
    obj.label280:setFontSize(19);
    lfm_setPropAsString(obj.label280, "fontStyle",  "bold");
    obj.label280:setFontColor("black");
    obj.label280:setFontFamily("kalam");
    obj.label280:setName("label280");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.CorpoACorpo);
    obj.label281:setLeft(182.88);
    obj.label281:setTop(90);
    obj.label281:setWidth(50.88);
    obj.label281:setHeight(31.38);
    obj.label281:setHorzTextAlign("center");
    obj.label281:setField("DanoItem25");
    obj.label281:setFontSize(19);
    lfm_setPropAsString(obj.label281, "fontStyle",  "bold");
    obj.label281:setFontColor("black");
    obj.label281:setFontFamily("kalam");
    obj.label281:setName("label281");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.CorpoACorpo);
    obj.label282:setLeft(195.88);
    obj.label282:setTop(128);
    obj.label282:setWidth(50.88);
    obj.label282:setHeight(32);
    obj.label282:setHorzTextAlign("center");
    obj.label282:setField("Golpear25");
    obj.label282:setFontSize(15);
    lfm_setPropAsString(obj.label282, "fontStyle",  "bold");
    obj.label282:setFontColor("black");
    obj.label282:setFontFamily("kalam");
    obj.label282:setName("label282");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.CorpoACorpo);
    obj.label283:setLeft(317.88);
    obj.label283:setTop(49);
    obj.label283:setWidth(68.88);
    obj.label283:setHeight(32);
    obj.label283:setHorzTextAlign("center");
    obj.label283:setField("Aparar25");
    obj.label283:setFontSize(19);
    lfm_setPropAsString(obj.label283, "fontStyle",  "bold");
    obj.label283:setFontColor("black");
    obj.label283:setFontFamily("kalam");
    obj.label283:setName("label283");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.CorpoACorpo);
    obj.label284:setLeft(317.88);
    obj.label284:setTop(89);
    obj.label284:setWidth(68.88);
    obj.label284:setHeight(32);
    obj.label284:setHorzTextAlign("center");
    obj.label284:setField("CD25");
    obj.label284:setFontSize(19);
    lfm_setPropAsString(obj.label284, "fontStyle",  "bold");
    obj.label284:setFontColor("black");
    obj.label284:setFontFamily("kalam");
    obj.label284:setName("label284");

    obj.CorpoACorpo26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo26:setParent(obj.scrollBox11);
    obj.CorpoACorpo26:setName("CorpoACorpo26");
    obj.CorpoACorpo26:setWidth(480);
    obj.CorpoACorpo26:setHeight(174);
    obj.CorpoACorpo26:setLeft(0);
    obj.CorpoACorpo26:setTop(270);

    obj.image164 = GUI.fromHandle(_obj_newObject("image"));
    obj.image164:setParent(obj.CorpoACorpo26);
    obj.image164:setSRC("images/LojaCorpoACorpo.png");
    obj.image164:setLeft(0);
    obj.image164:setTop(0);
    obj.image164:setWidth(399);
    obj.image164:setHeight(174);
    obj.image164:setName("image164");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.CorpoACorpo26);
    obj.label285:setLeft(22.25);
    obj.label285:setTop(20.50);
    obj.label285:setWidth(107.25);
    obj.label285:setHeight(37.88);
    obj.label285:setFontSize(22);
    obj.label285:setHint("Preço da Arma");
    obj.label285:setField("Preco26");
    obj.label285:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label285, "fontStyle",  "bold");
    obj.label285:setFontColor("yellow");
    obj.label285:setFontFamily("kalam");
    obj.label285:setCursor("handPoint");
    obj.label285:setHitTest(true);
    obj.label285:setName("label285");

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

    obj.image165 = GUI.fromHandle(_obj_newObject("image"));
    obj.image165:setParent(obj.CorpoACorpo26);
    obj.image165:setLeft(2.56);
    obj.image165:setTop(93.00);
    obj.image165:setWidth(136.69);
    obj.image165:setHeight(77.69);
    obj.image165:setStyle("proportional");
    obj.image165:setCenter(true);
    obj.image165:setEditable(true);
    obj.image165:setField("ImagemArma26");
    obj.image165:setName("image165");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.CorpoACorpo26);
    obj.label286:setLeft(197);
    obj.label286:setTop(10);
    obj.label286:setWidth(249.25);
    obj.label286:setHeight(39);
    obj.label286:setFontSize(22);
    obj.label286:setField("ItemNome26");
    lfm_setPropAsString(obj.label286, "fontStyle",  "bold");
    obj.label286:setFontColor("black");
    obj.label286:setFontFamily("kalam");
    obj.label286:setName("label286");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.CorpoACorpo26);
    obj.label287:setLeft(207.88);
    obj.label287:setTop(51);
    obj.label287:setWidth(49.88);
    obj.label287:setHeight(31.38);
    obj.label287:setHorzTextAlign("center");
    obj.label287:setField("Iniciativa26");
    obj.label287:setFontSize(19);
    lfm_setPropAsString(obj.label287, "fontStyle",  "bold");
    obj.label287:setFontColor("black");
    obj.label287:setFontFamily("kalam");
    obj.label287:setName("label287");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.CorpoACorpo26);
    obj.label288:setLeft(182.88);
    obj.label288:setTop(90);
    obj.label288:setWidth(50.88);
    obj.label288:setHeight(31.38);
    obj.label288:setHorzTextAlign("center");
    obj.label288:setField("DanoItem26");
    obj.label288:setFontSize(19);
    lfm_setPropAsString(obj.label288, "fontStyle",  "bold");
    obj.label288:setFontColor("black");
    obj.label288:setFontFamily("kalam");
    obj.label288:setName("label288");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.CorpoACorpo26);
    obj.label289:setLeft(195.88);
    obj.label289:setTop(128);
    obj.label289:setWidth(50.88);
    obj.label289:setHeight(32);
    obj.label289:setHorzTextAlign("center");
    obj.label289:setField("Golpear26");
    obj.label289:setFontSize(15);
    lfm_setPropAsString(obj.label289, "fontStyle",  "bold");
    obj.label289:setFontColor("black");
    obj.label289:setFontFamily("kalam");
    obj.label289:setName("label289");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.CorpoACorpo26);
    obj.label290:setLeft(317.88);
    obj.label290:setTop(49);
    obj.label290:setWidth(68.88);
    obj.label290:setHeight(32);
    obj.label290:setHorzTextAlign("center");
    obj.label290:setField("Aparar26");
    obj.label290:setFontSize(19);
    lfm_setPropAsString(obj.label290, "fontStyle",  "bold");
    obj.label290:setFontColor("black");
    obj.label290:setFontFamily("kalam");
    obj.label290:setName("label290");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.CorpoACorpo26);
    obj.label291:setLeft(317.88);
    obj.label291:setTop(89);
    obj.label291:setWidth(68.88);
    obj.label291:setHeight(32);
    obj.label291:setHorzTextAlign("center");
    obj.label291:setField("CD26");
    obj.label291:setFontSize(19);
    lfm_setPropAsString(obj.label291, "fontStyle",  "bold");
    obj.label291:setFontColor("black");
    obj.label291:setFontFamily("kalam");
    obj.label291:setName("label291");

    obj.CorpoACorpo27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo27:setParent(obj.scrollBox11);
    obj.CorpoACorpo27:setName("CorpoACorpo27");
    obj.CorpoACorpo27:setWidth(480);
    obj.CorpoACorpo27:setHeight(174);
    obj.CorpoACorpo27:setLeft(0);
    obj.CorpoACorpo27:setTop(452);

    obj.image166 = GUI.fromHandle(_obj_newObject("image"));
    obj.image166:setParent(obj.CorpoACorpo27);
    obj.image166:setSRC("images/LojaCorpoACorpo.png");
    obj.image166:setLeft(0);
    obj.image166:setTop(0);
    obj.image166:setWidth(399);
    obj.image166:setHeight(174);
    obj.image166:setName("image166");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.CorpoACorpo27);
    obj.label292:setLeft(22.25);
    obj.label292:setTop(20.50);
    obj.label292:setWidth(107.25);
    obj.label292:setHeight(37.88);
    obj.label292:setFontSize(22);
    obj.label292:setHint("Preço da Arma");
    obj.label292:setField("Preco27");
    obj.label292:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label292, "fontStyle",  "bold");
    obj.label292:setFontColor("yellow");
    obj.label292:setFontFamily("kalam");
    obj.label292:setCursor("handPoint");
    obj.label292:setHitTest(true);
    obj.label292:setName("label292");

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

    obj.image167 = GUI.fromHandle(_obj_newObject("image"));
    obj.image167:setParent(obj.CorpoACorpo27);
    obj.image167:setLeft(2.56);
    obj.image167:setTop(93.00);
    obj.image167:setWidth(136.69);
    obj.image167:setHeight(77.69);
    obj.image167:setStyle("proportional");
    obj.image167:setCenter(true);
    obj.image167:setEditable(true);
    obj.image167:setField("ImagemArma27");
    obj.image167:setName("image167");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.CorpoACorpo27);
    obj.label293:setLeft(197);
    obj.label293:setTop(10);
    obj.label293:setWidth(249.25);
    obj.label293:setHeight(39);
    obj.label293:setFontSize(16.8);
    obj.label293:setField("ItemNome27");
    lfm_setPropAsString(obj.label293, "fontStyle",  "bold");
    obj.label293:setFontColor("black");
    obj.label293:setFontFamily("kalam");
    obj.label293:setName("label293");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.CorpoACorpo27);
    obj.label294:setLeft(207.88);
    obj.label294:setTop(51);
    obj.label294:setWidth(49.88);
    obj.label294:setHeight(31.38);
    obj.label294:setHorzTextAlign("center");
    obj.label294:setField("Iniciativa27");
    obj.label294:setFontSize(19);
    lfm_setPropAsString(obj.label294, "fontStyle",  "bold");
    obj.label294:setFontColor("black");
    obj.label294:setFontFamily("kalam");
    obj.label294:setName("label294");

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.CorpoACorpo27);
    obj.label295:setLeft(182.88);
    obj.label295:setTop(90);
    obj.label295:setWidth(50.88);
    obj.label295:setHeight(31.38);
    obj.label295:setHorzTextAlign("center");
    obj.label295:setField("DanoItem27");
    obj.label295:setFontSize(19);
    lfm_setPropAsString(obj.label295, "fontStyle",  "bold");
    obj.label295:setFontColor("black");
    obj.label295:setFontFamily("kalam");
    obj.label295:setName("label295");

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.CorpoACorpo27);
    obj.label296:setLeft(195.88);
    obj.label296:setTop(128);
    obj.label296:setWidth(50.88);
    obj.label296:setHeight(32);
    obj.label296:setHorzTextAlign("center");
    obj.label296:setField("Golpear27");
    obj.label296:setFontSize(15);
    lfm_setPropAsString(obj.label296, "fontStyle",  "bold");
    obj.label296:setFontColor("black");
    obj.label296:setFontFamily("kalam");
    obj.label296:setName("label296");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.CorpoACorpo27);
    obj.label297:setLeft(317.88);
    obj.label297:setTop(49);
    obj.label297:setWidth(68.88);
    obj.label297:setHeight(32);
    obj.label297:setHorzTextAlign("center");
    obj.label297:setField("Aparar27");
    obj.label297:setFontSize(19);
    lfm_setPropAsString(obj.label297, "fontStyle",  "bold");
    obj.label297:setFontColor("black");
    obj.label297:setFontFamily("kalam");
    obj.label297:setName("label297");

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.CorpoACorpo27);
    obj.label298:setLeft(317.88);
    obj.label298:setTop(89);
    obj.label298:setWidth(68.88);
    obj.label298:setHeight(32);
    obj.label298:setHorzTextAlign("center");
    obj.label298:setField("CD27");
    obj.label298:setFontSize(19);
    lfm_setPropAsString(obj.label298, "fontStyle",  "bold");
    obj.label298:setFontColor("black");
    obj.label298:setFontFamily("kalam");
    obj.label298:setName("label298");

    obj.CorpoACorpo28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo28:setParent(obj.scrollBox11);
    obj.CorpoACorpo28:setName("CorpoACorpo28");
    obj.CorpoACorpo28:setWidth(480);
    obj.CorpoACorpo28:setHeight(174);
    obj.CorpoACorpo28:setLeft(0);
    obj.CorpoACorpo28:setTop(634);

    obj.image168 = GUI.fromHandle(_obj_newObject("image"));
    obj.image168:setParent(obj.CorpoACorpo28);
    obj.image168:setSRC("images/LojaCorpoACorpo.png");
    obj.image168:setLeft(0);
    obj.image168:setTop(0);
    obj.image168:setWidth(399);
    obj.image168:setHeight(174);
    obj.image168:setName("image168");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.CorpoACorpo28);
    obj.label299:setLeft(22.25);
    obj.label299:setTop(20.50);
    obj.label299:setWidth(107.25);
    obj.label299:setHeight(37.88);
    obj.label299:setFontSize(22);
    obj.label299:setHint("Preço da Arma");
    obj.label299:setField("Preco28");
    obj.label299:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label299, "fontStyle",  "bold");
    obj.label299:setFontColor("yellow");
    obj.label299:setFontFamily("kalam");
    obj.label299:setCursor("handPoint");
    obj.label299:setHitTest(true);
    obj.label299:setName("label299");

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

    obj.image169 = GUI.fromHandle(_obj_newObject("image"));
    obj.image169:setParent(obj.CorpoACorpo28);
    obj.image169:setLeft(2.56);
    obj.image169:setTop(93.00);
    obj.image169:setWidth(136.69);
    obj.image169:setHeight(77.69);
    obj.image169:setStyle("proportional");
    obj.image169:setCenter(true);
    obj.image169:setEditable(true);
    obj.image169:setField("ImagemArma28");
    obj.image169:setName("image169");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.CorpoACorpo28);
    obj.label300:setLeft(197);
    obj.label300:setTop(10);
    obj.label300:setWidth(249.25);
    obj.label300:setHeight(39);
    obj.label300:setFontSize(19);
    obj.label300:setField("ItemNome28");
    lfm_setPropAsString(obj.label300, "fontStyle",  "bold");
    obj.label300:setFontColor("black");
    obj.label300:setFontFamily("kalam");
    obj.label300:setName("label300");

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.CorpoACorpo28);
    obj.label301:setLeft(207.88);
    obj.label301:setTop(51);
    obj.label301:setWidth(49.88);
    obj.label301:setHeight(31.38);
    obj.label301:setHorzTextAlign("center");
    obj.label301:setField("Iniciativa28");
    obj.label301:setFontSize(19);
    lfm_setPropAsString(obj.label301, "fontStyle",  "bold");
    obj.label301:setFontColor("black");
    obj.label301:setFontFamily("kalam");
    obj.label301:setName("label301");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.CorpoACorpo28);
    obj.label302:setLeft(182.88);
    obj.label302:setTop(90);
    obj.label302:setWidth(50.88);
    obj.label302:setHeight(31.38);
    obj.label302:setHorzTextAlign("center");
    obj.label302:setField("DanoItem28");
    obj.label302:setFontSize(19);
    lfm_setPropAsString(obj.label302, "fontStyle",  "bold");
    obj.label302:setFontColor("black");
    obj.label302:setFontFamily("kalam");
    obj.label302:setName("label302");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.CorpoACorpo28);
    obj.label303:setLeft(195.88);
    obj.label303:setTop(128);
    obj.label303:setWidth(50.88);
    obj.label303:setHeight(32);
    obj.label303:setHorzTextAlign("center");
    obj.label303:setField("Golpear28");
    obj.label303:setFontSize(15);
    lfm_setPropAsString(obj.label303, "fontStyle",  "bold");
    obj.label303:setFontColor("black");
    obj.label303:setFontFamily("kalam");
    obj.label303:setName("label303");

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.CorpoACorpo28);
    obj.label304:setLeft(317.88);
    obj.label304:setTop(49);
    obj.label304:setWidth(68.88);
    obj.label304:setHeight(32);
    obj.label304:setHorzTextAlign("center");
    obj.label304:setField("Aparar28");
    obj.label304:setFontSize(19);
    lfm_setPropAsString(obj.label304, "fontStyle",  "bold");
    obj.label304:setFontColor("black");
    obj.label304:setFontFamily("kalam");
    obj.label304:setName("label304");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.CorpoACorpo28);
    obj.label305:setLeft(317.88);
    obj.label305:setTop(89);
    obj.label305:setWidth(68.88);
    obj.label305:setHeight(32);
    obj.label305:setHorzTextAlign("center");
    obj.label305:setField("CD28");
    obj.label305:setFontSize(19);
    lfm_setPropAsString(obj.label305, "fontStyle",  "bold");
    obj.label305:setFontColor("black");
    obj.label305:setFontFamily("kalam");
    obj.label305:setName("label305");

    obj.CorpoACorpo29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo29:setParent(obj.scrollBox11);
    obj.CorpoACorpo29:setName("CorpoACorpo29");
    obj.CorpoACorpo29:setWidth(480);
    obj.CorpoACorpo29:setHeight(174);
    obj.CorpoACorpo29:setLeft(0);
    obj.CorpoACorpo29:setTop(816);

    obj.image170 = GUI.fromHandle(_obj_newObject("image"));
    obj.image170:setParent(obj.CorpoACorpo29);
    obj.image170:setSRC("images/LojaCorpoACorpo.png");
    obj.image170:setLeft(0);
    obj.image170:setTop(0);
    obj.image170:setWidth(399);
    obj.image170:setHeight(174);
    obj.image170:setName("image170");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.CorpoACorpo29);
    obj.label306:setLeft(22.25);
    obj.label306:setTop(20.50);
    obj.label306:setWidth(107.25);
    obj.label306:setHeight(37.88);
    obj.label306:setFontSize(22);
    obj.label306:setHint("Preço da Arma");
    obj.label306:setField("Preco29");
    obj.label306:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label306, "fontStyle",  "bold");
    obj.label306:setFontColor("yellow");
    obj.label306:setFontFamily("kalam");
    obj.label306:setCursor("handPoint");
    obj.label306:setHitTest(true);
    obj.label306:setName("label306");

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

    obj.image171 = GUI.fromHandle(_obj_newObject("image"));
    obj.image171:setParent(obj.CorpoACorpo29);
    obj.image171:setLeft(2.56);
    obj.image171:setTop(93.00);
    obj.image171:setWidth(136.69);
    obj.image171:setHeight(77.69);
    obj.image171:setStyle("proportional");
    obj.image171:setCenter(true);
    obj.image171:setEditable(true);
    obj.image171:setField("ImagemArma29");
    obj.image171:setName("image171");

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.CorpoACorpo29);
    obj.label307:setLeft(197);
    obj.label307:setTop(10);
    obj.label307:setWidth(249.25);
    obj.label307:setHeight(39);
    obj.label307:setFontSize(22);
    obj.label307:setField("ItemNome29");
    lfm_setPropAsString(obj.label307, "fontStyle",  "bold");
    obj.label307:setFontColor("black");
    obj.label307:setFontFamily("kalam");
    obj.label307:setName("label307");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.CorpoACorpo29);
    obj.label308:setLeft(207.88);
    obj.label308:setTop(51);
    obj.label308:setWidth(49.88);
    obj.label308:setHeight(31.38);
    obj.label308:setHorzTextAlign("center");
    obj.label308:setField("Iniciativa29");
    obj.label308:setFontSize(19);
    lfm_setPropAsString(obj.label308, "fontStyle",  "bold");
    obj.label308:setFontColor("black");
    obj.label308:setFontFamily("kalam");
    obj.label308:setName("label308");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.CorpoACorpo29);
    obj.label309:setLeft(182.88);
    obj.label309:setTop(90);
    obj.label309:setWidth(50.88);
    obj.label309:setHeight(31.38);
    obj.label309:setHorzTextAlign("center");
    obj.label309:setField("DanoItem29");
    obj.label309:setFontSize(19);
    lfm_setPropAsString(obj.label309, "fontStyle",  "bold");
    obj.label309:setFontColor("black");
    obj.label309:setFontFamily("kalam");
    obj.label309:setName("label309");

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.CorpoACorpo29);
    obj.label310:setLeft(195.88);
    obj.label310:setTop(128);
    obj.label310:setWidth(50.88);
    obj.label310:setHeight(32);
    obj.label310:setHorzTextAlign("center");
    obj.label310:setField("Golpear29");
    obj.label310:setFontSize(15);
    lfm_setPropAsString(obj.label310, "fontStyle",  "bold");
    obj.label310:setFontColor("black");
    obj.label310:setFontFamily("kalam");
    obj.label310:setName("label310");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.CorpoACorpo29);
    obj.label311:setLeft(317.88);
    obj.label311:setTop(49);
    obj.label311:setWidth(68.88);
    obj.label311:setHeight(32);
    obj.label311:setHorzTextAlign("center");
    obj.label311:setField("Aparar29");
    obj.label311:setFontSize(19);
    lfm_setPropAsString(obj.label311, "fontStyle",  "bold");
    obj.label311:setFontColor("black");
    obj.label311:setFontFamily("kalam");
    obj.label311:setName("label311");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.CorpoACorpo29);
    obj.label312:setLeft(317.88);
    obj.label312:setTop(89);
    obj.label312:setWidth(68.88);
    obj.label312:setHeight(32);
    obj.label312:setHorzTextAlign("center");
    obj.label312:setField("CD29");
    obj.label312:setFontSize(19);
    lfm_setPropAsString(obj.label312, "fontStyle",  "bold");
    obj.label312:setFontColor("black");
    obj.label312:setFontFamily("kalam");
    obj.label312:setName("label312");

    obj.CorpoACorpo30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo30:setParent(obj.scrollBox11);
    obj.CorpoACorpo30:setName("CorpoACorpo30");
    obj.CorpoACorpo30:setWidth(480);
    obj.CorpoACorpo30:setHeight(174);
    obj.CorpoACorpo30:setLeft(0);
    obj.CorpoACorpo30:setTop(998);

    obj.image172 = GUI.fromHandle(_obj_newObject("image"));
    obj.image172:setParent(obj.CorpoACorpo30);
    obj.image172:setSRC("images/LojaCorpoACorpo.png");
    obj.image172:setLeft(0);
    obj.image172:setTop(0);
    obj.image172:setWidth(399);
    obj.image172:setHeight(174);
    obj.image172:setName("image172");

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.CorpoACorpo30);
    obj.label313:setLeft(22.25);
    obj.label313:setTop(20.50);
    obj.label313:setWidth(107.25);
    obj.label313:setHeight(37.88);
    obj.label313:setFontSize(22);
    obj.label313:setHint("Preço da Arma");
    obj.label313:setField("Preco30");
    obj.label313:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label313, "fontStyle",  "bold");
    obj.label313:setFontColor("yellow");
    obj.label313:setFontFamily("kalam");
    obj.label313:setCursor("handPoint");
    obj.label313:setHitTest(true);
    obj.label313:setName("label313");

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

    obj.image173 = GUI.fromHandle(_obj_newObject("image"));
    obj.image173:setParent(obj.CorpoACorpo30);
    obj.image173:setLeft(2.56);
    obj.image173:setTop(93.00);
    obj.image173:setWidth(136.69);
    obj.image173:setHeight(77.69);
    obj.image173:setStyle("proportional");
    obj.image173:setCenter(true);
    obj.image173:setEditable(true);
    obj.image173:setField("ImagemArma30");
    obj.image173:setName("image173");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.CorpoACorpo30);
    obj.label314:setLeft(197);
    obj.label314:setTop(10);
    obj.label314:setWidth(249.25);
    obj.label314:setHeight(39);
    obj.label314:setFontSize(22);
    obj.label314:setField("ItemNome30");
    lfm_setPropAsString(obj.label314, "fontStyle",  "bold");
    obj.label314:setFontColor("black");
    obj.label314:setFontFamily("kalam");
    obj.label314:setName("label314");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.CorpoACorpo30);
    obj.label315:setLeft(207.88);
    obj.label315:setTop(51);
    obj.label315:setWidth(49.88);
    obj.label315:setHeight(31.38);
    obj.label315:setHorzTextAlign("center");
    obj.label315:setField("Iniciativa30");
    obj.label315:setFontSize(19);
    lfm_setPropAsString(obj.label315, "fontStyle",  "bold");
    obj.label315:setFontColor("black");
    obj.label315:setFontFamily("kalam");
    obj.label315:setName("label315");

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.CorpoACorpo30);
    obj.label316:setLeft(182.88);
    obj.label316:setTop(90);
    obj.label316:setWidth(50.88);
    obj.label316:setHeight(31.38);
    obj.label316:setHorzTextAlign("center");
    obj.label316:setField("DanoItem30");
    obj.label316:setFontSize(19);
    lfm_setPropAsString(obj.label316, "fontStyle",  "bold");
    obj.label316:setFontColor("black");
    obj.label316:setFontFamily("kalam");
    obj.label316:setName("label316");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.CorpoACorpo30);
    obj.label317:setLeft(195.88);
    obj.label317:setTop(128);
    obj.label317:setWidth(50.88);
    obj.label317:setHeight(32);
    obj.label317:setHorzTextAlign("center");
    obj.label317:setField("Golpear30");
    obj.label317:setFontSize(15);
    lfm_setPropAsString(obj.label317, "fontStyle",  "bold");
    obj.label317:setFontColor("black");
    obj.label317:setFontFamily("kalam");
    obj.label317:setName("label317");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.CorpoACorpo30);
    obj.label318:setLeft(317.88);
    obj.label318:setTop(49);
    obj.label318:setWidth(68.88);
    obj.label318:setHeight(32);
    obj.label318:setHorzTextAlign("center");
    obj.label318:setField("Aparar30");
    obj.label318:setFontSize(19);
    lfm_setPropAsString(obj.label318, "fontStyle",  "bold");
    obj.label318:setFontColor("black");
    obj.label318:setFontFamily("kalam");
    obj.label318:setName("label318");

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.CorpoACorpo30);
    obj.label319:setLeft(317.88);
    obj.label319:setTop(89);
    obj.label319:setWidth(68.88);
    obj.label319:setHeight(32);
    obj.label319:setHorzTextAlign("center");
    obj.label319:setField("CD30");
    obj.label319:setFontSize(19);
    lfm_setPropAsString(obj.label319, "fontStyle",  "bold");
    obj.label319:setFontColor("black");
    obj.label319:setFontFamily("kalam");
    obj.label319:setName("label319");

    obj.CorpoACorpo31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo31:setParent(obj.scrollBox11);
    obj.CorpoACorpo31:setName("CorpoACorpo31");
    obj.CorpoACorpo31:setWidth(480);
    obj.CorpoACorpo31:setHeight(174);
    obj.CorpoACorpo31:setLeft(0);
    obj.CorpoACorpo31:setTop(1180);

    obj.image174 = GUI.fromHandle(_obj_newObject("image"));
    obj.image174:setParent(obj.CorpoACorpo31);
    obj.image174:setSRC("images/LojaCorpoACorpo.png");
    obj.image174:setLeft(0);
    obj.image174:setTop(0);
    obj.image174:setWidth(399);
    obj.image174:setHeight(174);
    obj.image174:setName("image174");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.CorpoACorpo31);
    obj.label320:setLeft(22.25);
    obj.label320:setTop(20.50);
    obj.label320:setWidth(107.25);
    obj.label320:setHeight(37.88);
    obj.label320:setFontSize(22);
    obj.label320:setHint("Preço da Arma");
    obj.label320:setField("Preco31");
    obj.label320:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label320, "fontStyle",  "bold");
    obj.label320:setFontColor("yellow");
    obj.label320:setFontFamily("kalam");
    obj.label320:setCursor("handPoint");
    obj.label320:setHitTest(true);
    obj.label320:setName("label320");

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

    obj.image175 = GUI.fromHandle(_obj_newObject("image"));
    obj.image175:setParent(obj.CorpoACorpo31);
    obj.image175:setLeft(2.56);
    obj.image175:setTop(93.00);
    obj.image175:setWidth(136.69);
    obj.image175:setHeight(77.69);
    obj.image175:setStyle("proportional");
    obj.image175:setCenter(true);
    obj.image175:setEditable(true);
    obj.image175:setField("ImagemArma31");
    obj.image175:setName("image175");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.CorpoACorpo31);
    obj.label321:setLeft(197);
    obj.label321:setTop(10);
    obj.label321:setWidth(249.25);
    obj.label321:setHeight(39);
    obj.label321:setFontSize(22);
    obj.label321:setField("ItemNome31");
    lfm_setPropAsString(obj.label321, "fontStyle",  "bold");
    obj.label321:setFontColor("black");
    obj.label321:setFontFamily("kalam");
    obj.label321:setName("label321");

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.CorpoACorpo31);
    obj.label322:setLeft(207.88);
    obj.label322:setTop(51);
    obj.label322:setWidth(49.88);
    obj.label322:setHeight(31.38);
    obj.label322:setHorzTextAlign("center");
    obj.label322:setField("Iniciativa31");
    obj.label322:setFontSize(19);
    lfm_setPropAsString(obj.label322, "fontStyle",  "bold");
    obj.label322:setFontColor("black");
    obj.label322:setFontFamily("kalam");
    obj.label322:setName("label322");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.CorpoACorpo31);
    obj.label323:setLeft(182.88);
    obj.label323:setTop(90);
    obj.label323:setWidth(50.88);
    obj.label323:setHeight(31.38);
    obj.label323:setHorzTextAlign("center");
    obj.label323:setField("DanoItem31");
    obj.label323:setFontSize(19);
    lfm_setPropAsString(obj.label323, "fontStyle",  "bold");
    obj.label323:setFontColor("black");
    obj.label323:setFontFamily("kalam");
    obj.label323:setName("label323");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.CorpoACorpo31);
    obj.label324:setLeft(195.88);
    obj.label324:setTop(128);
    obj.label324:setWidth(50.88);
    obj.label324:setHeight(32);
    obj.label324:setHorzTextAlign("center");
    obj.label324:setField("Golpear31");
    obj.label324:setFontSize(15);
    lfm_setPropAsString(obj.label324, "fontStyle",  "bold");
    obj.label324:setFontColor("black");
    obj.label324:setFontFamily("kalam");
    obj.label324:setName("label324");

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.CorpoACorpo31);
    obj.label325:setLeft(317.88);
    obj.label325:setTop(49);
    obj.label325:setWidth(68.88);
    obj.label325:setHeight(32);
    obj.label325:setHorzTextAlign("center");
    obj.label325:setField("Aparar31");
    obj.label325:setFontSize(19);
    lfm_setPropAsString(obj.label325, "fontStyle",  "bold");
    obj.label325:setFontColor("black");
    obj.label325:setFontFamily("kalam");
    obj.label325:setName("label325");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.CorpoACorpo31);
    obj.label326:setLeft(317.88);
    obj.label326:setTop(89);
    obj.label326:setWidth(68.88);
    obj.label326:setHeight(32);
    obj.label326:setHorzTextAlign("center");
    obj.label326:setField("CD31");
    obj.label326:setFontSize(19);
    lfm_setPropAsString(obj.label326, "fontStyle",  "bold");
    obj.label326:setFontColor("black");
    obj.label326:setFontFamily("kalam");
    obj.label326:setName("label326");

    obj.CorpoACorpo32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo32:setParent(obj.scrollBox11);
    obj.CorpoACorpo32:setName("CorpoACorpo32");
    obj.CorpoACorpo32:setWidth(480);
    obj.CorpoACorpo32:setHeight(174);
    obj.CorpoACorpo32:setLeft(0);
    obj.CorpoACorpo32:setTop(1362);

    obj.image176 = GUI.fromHandle(_obj_newObject("image"));
    obj.image176:setParent(obj.CorpoACorpo32);
    obj.image176:setSRC("images/LojaCorpoACorpo.png");
    obj.image176:setLeft(0);
    obj.image176:setTop(0);
    obj.image176:setWidth(399);
    obj.image176:setHeight(174);
    obj.image176:setName("image176");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.CorpoACorpo32);
    obj.label327:setLeft(22.25);
    obj.label327:setTop(20.50);
    obj.label327:setWidth(107.25);
    obj.label327:setHeight(37.88);
    obj.label327:setFontSize(22);
    obj.label327:setHint("Preço da Arma");
    obj.label327:setField("Preco32");
    obj.label327:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label327, "fontStyle",  "bold");
    obj.label327:setFontColor("yellow");
    obj.label327:setFontFamily("kalam");
    obj.label327:setCursor("handPoint");
    obj.label327:setHitTest(true);
    obj.label327:setName("label327");

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

    obj.image177 = GUI.fromHandle(_obj_newObject("image"));
    obj.image177:setParent(obj.CorpoACorpo32);
    obj.image177:setLeft(2.56);
    obj.image177:setTop(93.00);
    obj.image177:setWidth(136.69);
    obj.image177:setHeight(77.69);
    obj.image177:setStyle("proportional");
    obj.image177:setCenter(true);
    obj.image177:setEditable(true);
    obj.image177:setField("ImagemArma32");
    obj.image177:setName("image177");

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.CorpoACorpo32);
    obj.label328:setLeft(197);
    obj.label328:setTop(10);
    obj.label328:setWidth(249.25);
    obj.label328:setHeight(39);
    obj.label328:setFontSize(22);
    obj.label328:setField("ItemNome32");
    lfm_setPropAsString(obj.label328, "fontStyle",  "bold");
    obj.label328:setFontColor("black");
    obj.label328:setFontFamily("kalam");
    obj.label328:setName("label328");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.CorpoACorpo32);
    obj.label329:setLeft(207.88);
    obj.label329:setTop(51);
    obj.label329:setWidth(49.88);
    obj.label329:setHeight(31.38);
    obj.label329:setHorzTextAlign("center");
    obj.label329:setField("Iniciativa32");
    obj.label329:setFontSize(19);
    lfm_setPropAsString(obj.label329, "fontStyle",  "bold");
    obj.label329:setFontColor("black");
    obj.label329:setFontFamily("kalam");
    obj.label329:setName("label329");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.CorpoACorpo32);
    obj.label330:setLeft(182.88);
    obj.label330:setTop(90);
    obj.label330:setWidth(50.88);
    obj.label330:setHeight(31.38);
    obj.label330:setHorzTextAlign("center");
    obj.label330:setField("DanoItem32");
    obj.label330:setFontSize(19);
    lfm_setPropAsString(obj.label330, "fontStyle",  "bold");
    obj.label330:setFontColor("black");
    obj.label330:setFontFamily("kalam");
    obj.label330:setName("label330");

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.CorpoACorpo32);
    obj.label331:setLeft(195.88);
    obj.label331:setTop(128);
    obj.label331:setWidth(50.88);
    obj.label331:setHeight(32);
    obj.label331:setHorzTextAlign("center");
    obj.label331:setField("Golpear32");
    obj.label331:setFontSize(15);
    lfm_setPropAsString(obj.label331, "fontStyle",  "bold");
    obj.label331:setFontColor("black");
    obj.label331:setFontFamily("kalam");
    obj.label331:setName("label331");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.CorpoACorpo32);
    obj.label332:setLeft(317.88);
    obj.label332:setTop(49);
    obj.label332:setWidth(68.88);
    obj.label332:setHeight(32);
    obj.label332:setHorzTextAlign("center");
    obj.label332:setField("Aparar32");
    obj.label332:setFontSize(19);
    lfm_setPropAsString(obj.label332, "fontStyle",  "bold");
    obj.label332:setFontColor("black");
    obj.label332:setFontFamily("kalam");
    obj.label332:setName("label332");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.CorpoACorpo32);
    obj.label333:setLeft(317.88);
    obj.label333:setTop(89);
    obj.label333:setWidth(68.88);
    obj.label333:setHeight(32);
    obj.label333:setHorzTextAlign("center");
    obj.label333:setField("CD32");
    obj.label333:setFontSize(19);
    lfm_setPropAsString(obj.label333, "fontStyle",  "bold");
    obj.label333:setFontColor("black");
    obj.label333:setFontFamily("kalam");
    obj.label333:setName("label333");

    obj.CorpoACorpo33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo33:setParent(obj.scrollBox11);
    obj.CorpoACorpo33:setName("CorpoACorpo33");
    obj.CorpoACorpo33:setWidth(480);
    obj.CorpoACorpo33:setHeight(174);
    obj.CorpoACorpo33:setLeft(0);
    obj.CorpoACorpo33:setTop(1544);

    obj.image178 = GUI.fromHandle(_obj_newObject("image"));
    obj.image178:setParent(obj.CorpoACorpo33);
    obj.image178:setSRC("images/LojaCorpoACorpo.png");
    obj.image178:setLeft(0);
    obj.image178:setTop(0);
    obj.image178:setWidth(399);
    obj.image178:setHeight(174);
    obj.image178:setName("image178");

    obj.label334 = GUI.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.CorpoACorpo33);
    obj.label334:setLeft(22.25);
    obj.label334:setTop(20.50);
    obj.label334:setWidth(107.25);
    obj.label334:setHeight(37.88);
    obj.label334:setFontSize(22);
    obj.label334:setHint("Preço da Arma");
    obj.label334:setField("Preco33");
    obj.label334:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label334, "fontStyle",  "bold");
    obj.label334:setFontColor("yellow");
    obj.label334:setFontFamily("kalam");
    obj.label334:setCursor("handPoint");
    obj.label334:setHitTest(true);
    obj.label334:setName("label334");

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

    obj.image179 = GUI.fromHandle(_obj_newObject("image"));
    obj.image179:setParent(obj.CorpoACorpo33);
    obj.image179:setLeft(2.56);
    obj.image179:setTop(93.00);
    obj.image179:setWidth(136.69);
    obj.image179:setHeight(77.69);
    obj.image179:setStyle("proportional");
    obj.image179:setCenter(true);
    obj.image179:setEditable(true);
    obj.image179:setField("ImagemArma33");
    obj.image179:setName("image179");

    obj.label335 = GUI.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.CorpoACorpo33);
    obj.label335:setLeft(197);
    obj.label335:setTop(10);
    obj.label335:setWidth(249.25);
    obj.label335:setHeight(39);
    obj.label335:setFontSize(18);
    obj.label335:setField("ItemNome33");
    lfm_setPropAsString(obj.label335, "fontStyle",  "bold");
    obj.label335:setFontColor("black");
    obj.label335:setFontFamily("kalam");
    obj.label335:setName("label335");

    obj.label336 = GUI.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.CorpoACorpo33);
    obj.label336:setLeft(207.88);
    obj.label336:setTop(51);
    obj.label336:setWidth(49.88);
    obj.label336:setHeight(31.38);
    obj.label336:setHorzTextAlign("center");
    obj.label336:setField("Iniciativa33");
    obj.label336:setFontSize(19);
    lfm_setPropAsString(obj.label336, "fontStyle",  "bold");
    obj.label336:setFontColor("black");
    obj.label336:setFontFamily("kalam");
    obj.label336:setName("label336");

    obj.label337 = GUI.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.CorpoACorpo33);
    obj.label337:setLeft(182.88);
    obj.label337:setTop(90);
    obj.label337:setWidth(50.88);
    obj.label337:setHeight(31.38);
    obj.label337:setHorzTextAlign("center");
    obj.label337:setField("DanoItem33");
    obj.label337:setFontSize(19);
    lfm_setPropAsString(obj.label337, "fontStyle",  "bold");
    obj.label337:setFontColor("black");
    obj.label337:setFontFamily("kalam");
    obj.label337:setName("label337");

    obj.label338 = GUI.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.CorpoACorpo33);
    obj.label338:setLeft(195.88);
    obj.label338:setTop(128);
    obj.label338:setWidth(50.88);
    obj.label338:setHeight(32);
    obj.label338:setHorzTextAlign("center");
    obj.label338:setField("Golpear33");
    obj.label338:setFontSize(15);
    lfm_setPropAsString(obj.label338, "fontStyle",  "bold");
    obj.label338:setFontColor("black");
    obj.label338:setFontFamily("kalam");
    obj.label338:setName("label338");

    obj.label339 = GUI.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.CorpoACorpo33);
    obj.label339:setLeft(317.88);
    obj.label339:setTop(49);
    obj.label339:setWidth(68.88);
    obj.label339:setHeight(32);
    obj.label339:setHorzTextAlign("center");
    obj.label339:setField("Aparar33");
    obj.label339:setFontSize(19);
    lfm_setPropAsString(obj.label339, "fontStyle",  "bold");
    obj.label339:setFontColor("black");
    obj.label339:setFontFamily("kalam");
    obj.label339:setName("label339");

    obj.label340 = GUI.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.CorpoACorpo33);
    obj.label340:setLeft(317.88);
    obj.label340:setTop(89);
    obj.label340:setWidth(68.88);
    obj.label340:setHeight(32);
    obj.label340:setHorzTextAlign("center");
    obj.label340:setField("CD33");
    obj.label340:setFontSize(19);
    lfm_setPropAsString(obj.label340, "fontStyle",  "bold");
    obj.label340:setFontColor("black");
    obj.label340:setFontFamily("kalam");
    obj.label340:setName("label340");

    obj.CorpoACorpo34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo34:setParent(obj.scrollBox11);
    obj.CorpoACorpo34:setName("CorpoACorpo34");
    obj.CorpoACorpo34:setWidth(480);
    obj.CorpoACorpo34:setHeight(174);
    obj.CorpoACorpo34:setLeft(413);
    obj.CorpoACorpo34:setTop(1544);

    obj.image180 = GUI.fromHandle(_obj_newObject("image"));
    obj.image180:setParent(obj.CorpoACorpo34);
    obj.image180:setSRC("images/LojaCorpoACorpo.png");
    obj.image180:setLeft(0);
    obj.image180:setTop(0);
    obj.image180:setWidth(399);
    obj.image180:setHeight(174);
    obj.image180:setName("image180");

    obj.label341 = GUI.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.CorpoACorpo34);
    obj.label341:setLeft(22.25);
    obj.label341:setTop(20.50);
    obj.label341:setWidth(107.25);
    obj.label341:setHeight(37.88);
    obj.label341:setFontSize(22);
    obj.label341:setHint("Preço da Arma");
    obj.label341:setField("Preco34");
    obj.label341:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label341, "fontStyle",  "bold");
    obj.label341:setFontColor("yellow");
    obj.label341:setFontFamily("kalam");
    obj.label341:setCursor("handPoint");
    obj.label341:setHitTest(true);
    obj.label341:setName("label341");

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

    obj.image181 = GUI.fromHandle(_obj_newObject("image"));
    obj.image181:setParent(obj.CorpoACorpo34);
    obj.image181:setLeft(2.56);
    obj.image181:setTop(93.00);
    obj.image181:setWidth(136.69);
    obj.image181:setHeight(77.69);
    obj.image181:setStyle("proportional");
    obj.image181:setCenter(true);
    obj.image181:setEditable(true);
    obj.image181:setField("ImagemArma34");
    obj.image181:setName("image181");

    obj.label342 = GUI.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.CorpoACorpo34);
    obj.label342:setLeft(197);
    obj.label342:setTop(10);
    obj.label342:setWidth(249.25);
    obj.label342:setHeight(39);
    obj.label342:setFontSize(22);
    obj.label342:setField("ItemNome34");
    lfm_setPropAsString(obj.label342, "fontStyle",  "bold");
    obj.label342:setFontColor("black");
    obj.label342:setFontFamily("kalam");
    obj.label342:setName("label342");

    obj.label343 = GUI.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.CorpoACorpo34);
    obj.label343:setLeft(207.88);
    obj.label343:setTop(51);
    obj.label343:setWidth(49.88);
    obj.label343:setHeight(31.38);
    obj.label343:setHorzTextAlign("center");
    obj.label343:setField("Iniciativa34");
    obj.label343:setFontSize(19);
    lfm_setPropAsString(obj.label343, "fontStyle",  "bold");
    obj.label343:setFontColor("black");
    obj.label343:setFontFamily("kalam");
    obj.label343:setName("label343");

    obj.label344 = GUI.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.CorpoACorpo34);
    obj.label344:setLeft(182.88);
    obj.label344:setTop(90);
    obj.label344:setWidth(50.88);
    obj.label344:setHeight(31.38);
    obj.label344:setHorzTextAlign("center");
    obj.label344:setField("DanoItem34");
    obj.label344:setFontSize(19);
    lfm_setPropAsString(obj.label344, "fontStyle",  "bold");
    obj.label344:setFontColor("black");
    obj.label344:setFontFamily("kalam");
    obj.label344:setName("label344");

    obj.label345 = GUI.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.CorpoACorpo34);
    obj.label345:setLeft(195.88);
    obj.label345:setTop(128);
    obj.label345:setWidth(50.88);
    obj.label345:setHeight(32);
    obj.label345:setHorzTextAlign("center");
    obj.label345:setField("Golpear34");
    obj.label345:setFontSize(15);
    lfm_setPropAsString(obj.label345, "fontStyle",  "bold");
    obj.label345:setFontColor("black");
    obj.label345:setFontFamily("kalam");
    obj.label345:setName("label345");

    obj.label346 = GUI.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.CorpoACorpo34);
    obj.label346:setLeft(317.88);
    obj.label346:setTop(49);
    obj.label346:setWidth(68.88);
    obj.label346:setHeight(32);
    obj.label346:setHorzTextAlign("center");
    obj.label346:setField("Aparar34");
    obj.label346:setFontSize(19);
    lfm_setPropAsString(obj.label346, "fontStyle",  "bold");
    obj.label346:setFontColor("black");
    obj.label346:setFontFamily("kalam");
    obj.label346:setName("label346");

    obj.label347 = GUI.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.CorpoACorpo34);
    obj.label347:setLeft(317.88);
    obj.label347:setTop(89);
    obj.label347:setWidth(68.88);
    obj.label347:setHeight(32);
    obj.label347:setHorzTextAlign("center");
    obj.label347:setField("CD34");
    obj.label347:setFontSize(19);
    lfm_setPropAsString(obj.label347, "fontStyle",  "bold");
    obj.label347:setFontColor("black");
    obj.label347:setFontFamily("kalam");
    obj.label347:setName("label347");

    obj.CorpoACorpo35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo35:setParent(obj.scrollBox11);
    obj.CorpoACorpo35:setName("CorpoACorpo35");
    obj.CorpoACorpo35:setWidth(480);
    obj.CorpoACorpo35:setHeight(174);
    obj.CorpoACorpo35:setLeft(413);
    obj.CorpoACorpo35:setTop(88);

    obj.image182 = GUI.fromHandle(_obj_newObject("image"));
    obj.image182:setParent(obj.CorpoACorpo35);
    obj.image182:setSRC("images/LojaCorpoACorpo.png");
    obj.image182:setLeft(0);
    obj.image182:setTop(0);
    obj.image182:setWidth(399);
    obj.image182:setHeight(174);
    obj.image182:setName("image182");

    obj.label348 = GUI.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.CorpoACorpo35);
    obj.label348:setLeft(22.25);
    obj.label348:setTop(20.50);
    obj.label348:setWidth(107.25);
    obj.label348:setHeight(37.88);
    obj.label348:setFontSize(22);
    obj.label348:setHint("Preço da Arma");
    obj.label348:setField("Preco35");
    obj.label348:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label348, "fontStyle",  "bold");
    obj.label348:setFontColor("yellow");
    obj.label348:setFontFamily("kalam");
    obj.label348:setCursor("handPoint");
    obj.label348:setHitTest(true);
    obj.label348:setName("label348");

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

    obj.image183 = GUI.fromHandle(_obj_newObject("image"));
    obj.image183:setParent(obj.CorpoACorpo35);
    obj.image183:setLeft(2.56);
    obj.image183:setTop(93.00);
    obj.image183:setWidth(136.69);
    obj.image183:setHeight(77.69);
    obj.image183:setStyle("proportional");
    obj.image183:setCenter(true);
    obj.image183:setEditable(true);
    obj.image183:setField("ImagemArma35");
    obj.image183:setName("image183");

    obj.label349 = GUI.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.CorpoACorpo35);
    obj.label349:setLeft(197);
    obj.label349:setTop(10);
    obj.label349:setWidth(249.25);
    obj.label349:setHeight(39);
    obj.label349:setFontSize(22);
    obj.label349:setField("ItemNome35");
    lfm_setPropAsString(obj.label349, "fontStyle",  "bold");
    obj.label349:setFontColor("black");
    obj.label349:setFontFamily("kalam");
    obj.label349:setName("label349");

    obj.label350 = GUI.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.CorpoACorpo35);
    obj.label350:setLeft(207.88);
    obj.label350:setTop(51);
    obj.label350:setWidth(49.88);
    obj.label350:setHeight(31.38);
    obj.label350:setHorzTextAlign("center");
    obj.label350:setField("Iniciativa35");
    obj.label350:setFontSize(19);
    lfm_setPropAsString(obj.label350, "fontStyle",  "bold");
    obj.label350:setFontColor("black");
    obj.label350:setFontFamily("kalam");
    obj.label350:setName("label350");

    obj.label351 = GUI.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.CorpoACorpo35);
    obj.label351:setLeft(182.88);
    obj.label351:setTop(90);
    obj.label351:setWidth(50.88);
    obj.label351:setHeight(31.38);
    obj.label351:setHorzTextAlign("center");
    obj.label351:setField("DanoItem35");
    obj.label351:setFontSize(19);
    lfm_setPropAsString(obj.label351, "fontStyle",  "bold");
    obj.label351:setFontColor("black");
    obj.label351:setFontFamily("kalam");
    obj.label351:setName("label351");

    obj.label352 = GUI.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.CorpoACorpo35);
    obj.label352:setLeft(195.88);
    obj.label352:setTop(128);
    obj.label352:setWidth(50.88);
    obj.label352:setHeight(32);
    obj.label352:setHorzTextAlign("center");
    obj.label352:setField("Golpear35");
    obj.label352:setFontSize(15);
    lfm_setPropAsString(obj.label352, "fontStyle",  "bold");
    obj.label352:setFontColor("black");
    obj.label352:setFontFamily("kalam");
    obj.label352:setName("label352");

    obj.label353 = GUI.fromHandle(_obj_newObject("label"));
    obj.label353:setParent(obj.CorpoACorpo35);
    obj.label353:setLeft(317.88);
    obj.label353:setTop(49);
    obj.label353:setWidth(68.88);
    obj.label353:setHeight(32);
    obj.label353:setHorzTextAlign("center");
    obj.label353:setField("Aparar35");
    obj.label353:setFontSize(19);
    lfm_setPropAsString(obj.label353, "fontStyle",  "bold");
    obj.label353:setFontColor("black");
    obj.label353:setFontFamily("kalam");
    obj.label353:setName("label353");

    obj.label354 = GUI.fromHandle(_obj_newObject("label"));
    obj.label354:setParent(obj.CorpoACorpo35);
    obj.label354:setLeft(317.88);
    obj.label354:setTop(89);
    obj.label354:setWidth(68.88);
    obj.label354:setHeight(32);
    obj.label354:setHorzTextAlign("center");
    obj.label354:setField("CD35");
    obj.label354:setFontSize(19);
    lfm_setPropAsString(obj.label354, "fontStyle",  "bold");
    obj.label354:setFontColor("black");
    obj.label354:setFontFamily("kalam");
    obj.label354:setName("label354");

    obj.CorpoACorpo36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo36:setParent(obj.scrollBox11);
    obj.CorpoACorpo36:setName("CorpoACorpo36");
    obj.CorpoACorpo36:setWidth(480);
    obj.CorpoACorpo36:setHeight(174);
    obj.CorpoACorpo36:setLeft(413);
    obj.CorpoACorpo36:setTop(270);

    obj.image184 = GUI.fromHandle(_obj_newObject("image"));
    obj.image184:setParent(obj.CorpoACorpo36);
    obj.image184:setSRC("images/LojaCorpoACorpo.png");
    obj.image184:setLeft(0);
    obj.image184:setTop(0);
    obj.image184:setWidth(399);
    obj.image184:setHeight(174);
    obj.image184:setName("image184");

    obj.label355 = GUI.fromHandle(_obj_newObject("label"));
    obj.label355:setParent(obj.CorpoACorpo36);
    obj.label355:setLeft(22.25);
    obj.label355:setTop(20.50);
    obj.label355:setWidth(107.25);
    obj.label355:setHeight(37.88);
    obj.label355:setFontSize(22);
    obj.label355:setHint("Preço da Arma");
    obj.label355:setField("Preco36");
    obj.label355:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label355, "fontStyle",  "bold");
    obj.label355:setFontColor("yellow");
    obj.label355:setFontFamily("kalam");
    obj.label355:setCursor("handPoint");
    obj.label355:setHitTest(true);
    obj.label355:setName("label355");

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

    obj.image185 = GUI.fromHandle(_obj_newObject("image"));
    obj.image185:setParent(obj.CorpoACorpo36);
    obj.image185:setLeft(2.56);
    obj.image185:setTop(93.00);
    obj.image185:setWidth(136.69);
    obj.image185:setHeight(77.69);
    obj.image185:setStyle("proportional");
    obj.image185:setCenter(true);
    obj.image185:setEditable(true);
    obj.image185:setField("ImagemArma36");
    obj.image185:setName("image185");

    obj.label356 = GUI.fromHandle(_obj_newObject("label"));
    obj.label356:setParent(obj.CorpoACorpo36);
    obj.label356:setLeft(197);
    obj.label356:setTop(10);
    obj.label356:setWidth(249.25);
    obj.label356:setHeight(39);
    obj.label356:setFontSize(14.8);
    obj.label356:setField("ItemNome36");
    lfm_setPropAsString(obj.label356, "fontStyle",  "bold");
    obj.label356:setFontColor("black");
    obj.label356:setFontFamily("kalam");
    obj.label356:setName("label356");

    obj.label357 = GUI.fromHandle(_obj_newObject("label"));
    obj.label357:setParent(obj.CorpoACorpo36);
    obj.label357:setLeft(207.88);
    obj.label357:setTop(51);
    obj.label357:setWidth(49.88);
    obj.label357:setHeight(31.38);
    obj.label357:setHorzTextAlign("center");
    obj.label357:setField("Iniciativa36");
    obj.label357:setFontSize(19);
    lfm_setPropAsString(obj.label357, "fontStyle",  "bold");
    obj.label357:setFontColor("black");
    obj.label357:setFontFamily("kalam");
    obj.label357:setName("label357");

    obj.label358 = GUI.fromHandle(_obj_newObject("label"));
    obj.label358:setParent(obj.CorpoACorpo36);
    obj.label358:setLeft(182.88);
    obj.label358:setTop(90);
    obj.label358:setWidth(50.88);
    obj.label358:setHeight(31.38);
    obj.label358:setHorzTextAlign("center");
    obj.label358:setField("DanoItem36");
    obj.label358:setFontSize(19);
    lfm_setPropAsString(obj.label358, "fontStyle",  "bold");
    obj.label358:setFontColor("black");
    obj.label358:setFontFamily("kalam");
    obj.label358:setName("label358");

    obj.label359 = GUI.fromHandle(_obj_newObject("label"));
    obj.label359:setParent(obj.CorpoACorpo36);
    obj.label359:setLeft(195.88);
    obj.label359:setTop(128);
    obj.label359:setWidth(50.88);
    obj.label359:setHeight(32);
    obj.label359:setHorzTextAlign("center");
    obj.label359:setField("Golpear36");
    obj.label359:setFontSize(15);
    lfm_setPropAsString(obj.label359, "fontStyle",  "bold");
    obj.label359:setFontColor("black");
    obj.label359:setFontFamily("kalam");
    obj.label359:setName("label359");

    obj.label360 = GUI.fromHandle(_obj_newObject("label"));
    obj.label360:setParent(obj.CorpoACorpo36);
    obj.label360:setLeft(317.88);
    obj.label360:setTop(49);
    obj.label360:setWidth(68.88);
    obj.label360:setHeight(32);
    obj.label360:setHorzTextAlign("center");
    obj.label360:setField("Aparar36");
    obj.label360:setFontSize(19);
    lfm_setPropAsString(obj.label360, "fontStyle",  "bold");
    obj.label360:setFontColor("black");
    obj.label360:setFontFamily("kalam");
    obj.label360:setName("label360");

    obj.label361 = GUI.fromHandle(_obj_newObject("label"));
    obj.label361:setParent(obj.CorpoACorpo36);
    obj.label361:setLeft(317.88);
    obj.label361:setTop(89);
    obj.label361:setWidth(68.88);
    obj.label361:setHeight(32);
    obj.label361:setHorzTextAlign("center");
    obj.label361:setField("CD36");
    obj.label361:setFontSize(19);
    lfm_setPropAsString(obj.label361, "fontStyle",  "bold");
    obj.label361:setFontColor("black");
    obj.label361:setFontFamily("kalam");
    obj.label361:setName("label361");

    obj.CorpoACorpo37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo37:setParent(obj.scrollBox11);
    obj.CorpoACorpo37:setName("CorpoACorpo37");
    obj.CorpoACorpo37:setWidth(480);
    obj.CorpoACorpo37:setHeight(174);
    obj.CorpoACorpo37:setLeft(413);
    obj.CorpoACorpo37:setTop(452);

    obj.image186 = GUI.fromHandle(_obj_newObject("image"));
    obj.image186:setParent(obj.CorpoACorpo37);
    obj.image186:setSRC("images/LojaCorpoACorpo.png");
    obj.image186:setLeft(0);
    obj.image186:setTop(0);
    obj.image186:setWidth(399);
    obj.image186:setHeight(174);
    obj.image186:setName("image186");

    obj.label362 = GUI.fromHandle(_obj_newObject("label"));
    obj.label362:setParent(obj.CorpoACorpo37);
    obj.label362:setLeft(22.25);
    obj.label362:setTop(20.50);
    obj.label362:setWidth(107.25);
    obj.label362:setHeight(37.88);
    obj.label362:setFontSize(22);
    obj.label362:setHint("Preço da Arma");
    obj.label362:setField("Preco37");
    obj.label362:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label362, "fontStyle",  "bold");
    obj.label362:setFontColor("yellow");
    obj.label362:setFontFamily("kalam");
    obj.label362:setCursor("handPoint");
    obj.label362:setHitTest(true);
    obj.label362:setName("label362");

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

    obj.image187 = GUI.fromHandle(_obj_newObject("image"));
    obj.image187:setParent(obj.CorpoACorpo37);
    obj.image187:setLeft(2.56);
    obj.image187:setTop(93.00);
    obj.image187:setWidth(136.69);
    obj.image187:setHeight(77.69);
    obj.image187:setStyle("proportional");
    obj.image187:setCenter(true);
    obj.image187:setEditable(true);
    obj.image187:setField("ImagemArma37");
    obj.image187:setName("image187");

    obj.label363 = GUI.fromHandle(_obj_newObject("label"));
    obj.label363:setParent(obj.CorpoACorpo37);
    obj.label363:setLeft(197);
    obj.label363:setTop(10);
    obj.label363:setWidth(249.25);
    obj.label363:setHeight(39);
    obj.label363:setFontSize(22);
    obj.label363:setField("ItemNome37");
    lfm_setPropAsString(obj.label363, "fontStyle",  "bold");
    obj.label363:setFontColor("black");
    obj.label363:setFontFamily("kalam");
    obj.label363:setName("label363");

    obj.label364 = GUI.fromHandle(_obj_newObject("label"));
    obj.label364:setParent(obj.CorpoACorpo37);
    obj.label364:setLeft(207.88);
    obj.label364:setTop(51);
    obj.label364:setWidth(49.88);
    obj.label364:setHeight(31.38);
    obj.label364:setHorzTextAlign("center");
    obj.label364:setField("Iniciativa37");
    obj.label364:setFontSize(19);
    lfm_setPropAsString(obj.label364, "fontStyle",  "bold");
    obj.label364:setFontColor("black");
    obj.label364:setFontFamily("kalam");
    obj.label364:setName("label364");

    obj.label365 = GUI.fromHandle(_obj_newObject("label"));
    obj.label365:setParent(obj.CorpoACorpo37);
    obj.label365:setLeft(182.88);
    obj.label365:setTop(90);
    obj.label365:setWidth(50.88);
    obj.label365:setHeight(31.38);
    obj.label365:setHorzTextAlign("center");
    obj.label365:setField("DanoItem37");
    obj.label365:setFontSize(19);
    lfm_setPropAsString(obj.label365, "fontStyle",  "bold");
    obj.label365:setFontColor("black");
    obj.label365:setFontFamily("kalam");
    obj.label365:setName("label365");

    obj.label366 = GUI.fromHandle(_obj_newObject("label"));
    obj.label366:setParent(obj.CorpoACorpo37);
    obj.label366:setLeft(195.88);
    obj.label366:setTop(128);
    obj.label366:setWidth(50.88);
    obj.label366:setHeight(32);
    obj.label366:setHorzTextAlign("center");
    obj.label366:setField("Golpear37");
    obj.label366:setFontSize(15);
    lfm_setPropAsString(obj.label366, "fontStyle",  "bold");
    obj.label366:setFontColor("black");
    obj.label366:setFontFamily("kalam");
    obj.label366:setName("label366");

    obj.label367 = GUI.fromHandle(_obj_newObject("label"));
    obj.label367:setParent(obj.CorpoACorpo37);
    obj.label367:setLeft(317.88);
    obj.label367:setTop(49);
    obj.label367:setWidth(68.88);
    obj.label367:setHeight(32);
    obj.label367:setHorzTextAlign("center");
    obj.label367:setField("Aparar37");
    obj.label367:setFontSize(19);
    lfm_setPropAsString(obj.label367, "fontStyle",  "bold");
    obj.label367:setFontColor("black");
    obj.label367:setFontFamily("kalam");
    obj.label367:setName("label367");

    obj.label368 = GUI.fromHandle(_obj_newObject("label"));
    obj.label368:setParent(obj.CorpoACorpo37);
    obj.label368:setLeft(317.88);
    obj.label368:setTop(89);
    obj.label368:setWidth(68.88);
    obj.label368:setHeight(32);
    obj.label368:setHorzTextAlign("center");
    obj.label368:setField("CD37");
    obj.label368:setFontSize(19);
    lfm_setPropAsString(obj.label368, "fontStyle",  "bold");
    obj.label368:setFontColor("black");
    obj.label368:setFontFamily("kalam");
    obj.label368:setName("label368");

    obj.CorpoACorpo38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo38:setParent(obj.scrollBox11);
    obj.CorpoACorpo38:setName("CorpoACorpo38");
    obj.CorpoACorpo38:setWidth(480);
    obj.CorpoACorpo38:setHeight(174);
    obj.CorpoACorpo38:setLeft(413);
    obj.CorpoACorpo38:setTop(634);

    obj.image188 = GUI.fromHandle(_obj_newObject("image"));
    obj.image188:setParent(obj.CorpoACorpo38);
    obj.image188:setSRC("images/LojaCorpoACorpo.png");
    obj.image188:setLeft(0);
    obj.image188:setTop(0);
    obj.image188:setWidth(399);
    obj.image188:setHeight(174);
    obj.image188:setName("image188");

    obj.label369 = GUI.fromHandle(_obj_newObject("label"));
    obj.label369:setParent(obj.CorpoACorpo38);
    obj.label369:setLeft(22.25);
    obj.label369:setTop(20.50);
    obj.label369:setWidth(107.25);
    obj.label369:setHeight(37.88);
    obj.label369:setFontSize(22);
    obj.label369:setHint("Preço da Arma");
    obj.label369:setField("Preco38");
    obj.label369:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label369, "fontStyle",  "bold");
    obj.label369:setFontColor("yellow");
    obj.label369:setFontFamily("kalam");
    obj.label369:setCursor("handPoint");
    obj.label369:setHitTest(true);
    obj.label369:setName("label369");

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

    obj.image189 = GUI.fromHandle(_obj_newObject("image"));
    obj.image189:setParent(obj.CorpoACorpo38);
    obj.image189:setLeft(2.56);
    obj.image189:setTop(93.00);
    obj.image189:setWidth(136.69);
    obj.image189:setHeight(77.69);
    obj.image189:setStyle("proportional");
    obj.image189:setCenter(true);
    obj.image189:setEditable(true);
    obj.image189:setField("ImagemArma38");
    obj.image189:setName("image189");

    obj.label370 = GUI.fromHandle(_obj_newObject("label"));
    obj.label370:setParent(obj.CorpoACorpo38);
    obj.label370:setLeft(197);
    obj.label370:setTop(10);
    obj.label370:setWidth(249.25);
    obj.label370:setHeight(39);
    obj.label370:setFontSize(22);
    obj.label370:setField("ItemNome38");
    lfm_setPropAsString(obj.label370, "fontStyle",  "bold");
    obj.label370:setFontColor("black");
    obj.label370:setFontFamily("kalam");
    obj.label370:setName("label370");

    obj.label371 = GUI.fromHandle(_obj_newObject("label"));
    obj.label371:setParent(obj.CorpoACorpo38);
    obj.label371:setLeft(207.88);
    obj.label371:setTop(51);
    obj.label371:setWidth(49.88);
    obj.label371:setHeight(31.38);
    obj.label371:setHorzTextAlign("center");
    obj.label371:setField("Iniciativa38");
    obj.label371:setFontSize(19);
    lfm_setPropAsString(obj.label371, "fontStyle",  "bold");
    obj.label371:setFontColor("black");
    obj.label371:setFontFamily("kalam");
    obj.label371:setName("label371");

    obj.label372 = GUI.fromHandle(_obj_newObject("label"));
    obj.label372:setParent(obj.CorpoACorpo38);
    obj.label372:setLeft(182.88);
    obj.label372:setTop(90);
    obj.label372:setWidth(50.88);
    obj.label372:setHeight(31.38);
    obj.label372:setHorzTextAlign("center");
    obj.label372:setField("DanoItem38");
    obj.label372:setFontSize(19);
    lfm_setPropAsString(obj.label372, "fontStyle",  "bold");
    obj.label372:setFontColor("black");
    obj.label372:setFontFamily("kalam");
    obj.label372:setName("label372");

    obj.label373 = GUI.fromHandle(_obj_newObject("label"));
    obj.label373:setParent(obj.CorpoACorpo38);
    obj.label373:setLeft(195.88);
    obj.label373:setTop(128);
    obj.label373:setWidth(50.88);
    obj.label373:setHeight(32);
    obj.label373:setHorzTextAlign("center");
    obj.label373:setField("Golpear38");
    obj.label373:setFontSize(15);
    lfm_setPropAsString(obj.label373, "fontStyle",  "bold");
    obj.label373:setFontColor("black");
    obj.label373:setFontFamily("kalam");
    obj.label373:setName("label373");

    obj.label374 = GUI.fromHandle(_obj_newObject("label"));
    obj.label374:setParent(obj.CorpoACorpo38);
    obj.label374:setLeft(317.88);
    obj.label374:setTop(49);
    obj.label374:setWidth(68.88);
    obj.label374:setHeight(32);
    obj.label374:setHorzTextAlign("center");
    obj.label374:setField("Aparar38");
    obj.label374:setFontSize(19);
    lfm_setPropAsString(obj.label374, "fontStyle",  "bold");
    obj.label374:setFontColor("black");
    obj.label374:setFontFamily("kalam");
    obj.label374:setName("label374");

    obj.label375 = GUI.fromHandle(_obj_newObject("label"));
    obj.label375:setParent(obj.CorpoACorpo38);
    obj.label375:setLeft(317.88);
    obj.label375:setTop(89);
    obj.label375:setWidth(68.88);
    obj.label375:setHeight(32);
    obj.label375:setHorzTextAlign("center");
    obj.label375:setField("CD38");
    obj.label375:setFontSize(19);
    lfm_setPropAsString(obj.label375, "fontStyle",  "bold");
    obj.label375:setFontColor("black");
    obj.label375:setFontFamily("kalam");
    obj.label375:setName("label375");

    obj.CorpoACorpo39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo39:setParent(obj.scrollBox11);
    obj.CorpoACorpo39:setName("CorpoACorpo39");
    obj.CorpoACorpo39:setWidth(480);
    obj.CorpoACorpo39:setHeight(174);
    obj.CorpoACorpo39:setLeft(413);
    obj.CorpoACorpo39:setTop(816);

    obj.image190 = GUI.fromHandle(_obj_newObject("image"));
    obj.image190:setParent(obj.CorpoACorpo39);
    obj.image190:setSRC("images/LojaCorpoACorpo.png");
    obj.image190:setLeft(0);
    obj.image190:setTop(0);
    obj.image190:setWidth(399);
    obj.image190:setHeight(174);
    obj.image190:setName("image190");

    obj.label376 = GUI.fromHandle(_obj_newObject("label"));
    obj.label376:setParent(obj.CorpoACorpo39);
    obj.label376:setLeft(22.25);
    obj.label376:setTop(20.50);
    obj.label376:setWidth(107.25);
    obj.label376:setHeight(37.88);
    obj.label376:setFontSize(22);
    obj.label376:setHint("Preço da Arma");
    obj.label376:setField("Preco39");
    obj.label376:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label376, "fontStyle",  "bold");
    obj.label376:setFontColor("yellow");
    obj.label376:setFontFamily("kalam");
    obj.label376:setCursor("handPoint");
    obj.label376:setHitTest(true);
    obj.label376:setName("label376");

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

    obj.image191 = GUI.fromHandle(_obj_newObject("image"));
    obj.image191:setParent(obj.CorpoACorpo39);
    obj.image191:setLeft(2.56);
    obj.image191:setTop(93.00);
    obj.image191:setWidth(136.69);
    obj.image191:setHeight(77.69);
    obj.image191:setStyle("proportional");
    obj.image191:setCenter(true);
    obj.image191:setEditable(true);
    obj.image191:setField("ImagemArma39");
    obj.image191:setName("image191");

    obj.label377 = GUI.fromHandle(_obj_newObject("label"));
    obj.label377:setParent(obj.CorpoACorpo39);
    obj.label377:setLeft(197);
    obj.label377:setTop(10);
    obj.label377:setWidth(249.25);
    obj.label377:setHeight(39);
    obj.label377:setFontSize(22);
    obj.label377:setField("ItemNome39");
    lfm_setPropAsString(obj.label377, "fontStyle",  "bold");
    obj.label377:setFontColor("black");
    obj.label377:setFontFamily("kalam");
    obj.label377:setName("label377");

    obj.label378 = GUI.fromHandle(_obj_newObject("label"));
    obj.label378:setParent(obj.CorpoACorpo39);
    obj.label378:setLeft(207.88);
    obj.label378:setTop(51);
    obj.label378:setWidth(49.88);
    obj.label378:setHeight(31.38);
    obj.label378:setHorzTextAlign("center");
    obj.label378:setField("Iniciativa39");
    obj.label378:setFontSize(19);
    lfm_setPropAsString(obj.label378, "fontStyle",  "bold");
    obj.label378:setFontColor("black");
    obj.label378:setFontFamily("kalam");
    obj.label378:setName("label378");

    obj.label379 = GUI.fromHandle(_obj_newObject("label"));
    obj.label379:setParent(obj.CorpoACorpo39);
    obj.label379:setLeft(182.88);
    obj.label379:setTop(90);
    obj.label379:setWidth(50.88);
    obj.label379:setHeight(31.38);
    obj.label379:setHorzTextAlign("center");
    obj.label379:setField("DanoItem39");
    obj.label379:setFontSize(19);
    lfm_setPropAsString(obj.label379, "fontStyle",  "bold");
    obj.label379:setFontColor("black");
    obj.label379:setFontFamily("kalam");
    obj.label379:setName("label379");

    obj.label380 = GUI.fromHandle(_obj_newObject("label"));
    obj.label380:setParent(obj.CorpoACorpo39);
    obj.label380:setLeft(195.88);
    obj.label380:setTop(128);
    obj.label380:setWidth(50.88);
    obj.label380:setHeight(32);
    obj.label380:setHorzTextAlign("center");
    obj.label380:setField("Golpear39");
    obj.label380:setFontSize(15);
    lfm_setPropAsString(obj.label380, "fontStyle",  "bold");
    obj.label380:setFontColor("black");
    obj.label380:setFontFamily("kalam");
    obj.label380:setName("label380");

    obj.label381 = GUI.fromHandle(_obj_newObject("label"));
    obj.label381:setParent(obj.CorpoACorpo39);
    obj.label381:setLeft(317.88);
    obj.label381:setTop(49);
    obj.label381:setWidth(68.88);
    obj.label381:setHeight(32);
    obj.label381:setHorzTextAlign("center");
    obj.label381:setField("Aparar39");
    obj.label381:setFontSize(19);
    lfm_setPropAsString(obj.label381, "fontStyle",  "bold");
    obj.label381:setFontColor("black");
    obj.label381:setFontFamily("kalam");
    obj.label381:setName("label381");

    obj.label382 = GUI.fromHandle(_obj_newObject("label"));
    obj.label382:setParent(obj.CorpoACorpo39);
    obj.label382:setLeft(317.88);
    obj.label382:setTop(89);
    obj.label382:setWidth(68.88);
    obj.label382:setHeight(32);
    obj.label382:setHorzTextAlign("center");
    obj.label382:setField("CD39");
    obj.label382:setFontSize(19);
    lfm_setPropAsString(obj.label382, "fontStyle",  "bold");
    obj.label382:setFontColor("black");
    obj.label382:setFontFamily("kalam");
    obj.label382:setName("label382");

    obj.CorpoACorpo40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo40:setParent(obj.scrollBox11);
    obj.CorpoACorpo40:setName("CorpoACorpo40");
    obj.CorpoACorpo40:setWidth(480);
    obj.CorpoACorpo40:setHeight(174);
    obj.CorpoACorpo40:setLeft(413);
    obj.CorpoACorpo40:setTop(998);

    obj.image192 = GUI.fromHandle(_obj_newObject("image"));
    obj.image192:setParent(obj.CorpoACorpo40);
    obj.image192:setSRC("images/LojaCorpoACorpo.png");
    obj.image192:setLeft(0);
    obj.image192:setTop(0);
    obj.image192:setWidth(399);
    obj.image192:setHeight(174);
    obj.image192:setName("image192");

    obj.label383 = GUI.fromHandle(_obj_newObject("label"));
    obj.label383:setParent(obj.CorpoACorpo40);
    obj.label383:setLeft(22.25);
    obj.label383:setTop(20.50);
    obj.label383:setWidth(107.25);
    obj.label383:setHeight(37.88);
    obj.label383:setFontSize(22);
    obj.label383:setHint("Preço da Arma");
    obj.label383:setField("Preco40");
    obj.label383:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label383, "fontStyle",  "bold");
    obj.label383:setFontColor("yellow");
    obj.label383:setFontFamily("kalam");
    obj.label383:setCursor("handPoint");
    obj.label383:setHitTest(true);
    obj.label383:setName("label383");

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

    obj.image193 = GUI.fromHandle(_obj_newObject("image"));
    obj.image193:setParent(obj.CorpoACorpo40);
    obj.image193:setLeft(2.56);
    obj.image193:setTop(93.00);
    obj.image193:setWidth(136.69);
    obj.image193:setHeight(77.69);
    obj.image193:setStyle("proportional");
    obj.image193:setCenter(true);
    obj.image193:setEditable(true);
    obj.image193:setField("ImagemArma40");
    obj.image193:setName("image193");

    obj.label384 = GUI.fromHandle(_obj_newObject("label"));
    obj.label384:setParent(obj.CorpoACorpo40);
    obj.label384:setLeft(197);
    obj.label384:setTop(10);
    obj.label384:setWidth(249.25);
    obj.label384:setHeight(39);
    obj.label384:setFontSize(22);
    obj.label384:setField("ItemNome40");
    lfm_setPropAsString(obj.label384, "fontStyle",  "bold");
    obj.label384:setFontColor("black");
    obj.label384:setFontFamily("kalam");
    obj.label384:setName("label384");

    obj.label385 = GUI.fromHandle(_obj_newObject("label"));
    obj.label385:setParent(obj.CorpoACorpo40);
    obj.label385:setLeft(207.88);
    obj.label385:setTop(51);
    obj.label385:setWidth(49.88);
    obj.label385:setHeight(31.38);
    obj.label385:setHorzTextAlign("center");
    obj.label385:setField("Iniciativa40");
    obj.label385:setFontSize(19);
    lfm_setPropAsString(obj.label385, "fontStyle",  "bold");
    obj.label385:setFontColor("black");
    obj.label385:setFontFamily("kalam");
    obj.label385:setName("label385");

    obj.label386 = GUI.fromHandle(_obj_newObject("label"));
    obj.label386:setParent(obj.CorpoACorpo40);
    obj.label386:setLeft(182.88);
    obj.label386:setTop(90);
    obj.label386:setWidth(50.88);
    obj.label386:setHeight(31.38);
    obj.label386:setHorzTextAlign("center");
    obj.label386:setField("DanoItem40");
    obj.label386:setFontSize(19);
    lfm_setPropAsString(obj.label386, "fontStyle",  "bold");
    obj.label386:setFontColor("black");
    obj.label386:setFontFamily("kalam");
    obj.label386:setName("label386");

    obj.label387 = GUI.fromHandle(_obj_newObject("label"));
    obj.label387:setParent(obj.CorpoACorpo40);
    obj.label387:setLeft(195.88);
    obj.label387:setTop(128);
    obj.label387:setWidth(50.88);
    obj.label387:setHeight(32);
    obj.label387:setHorzTextAlign("center");
    obj.label387:setField("Golpear40");
    obj.label387:setFontSize(15);
    lfm_setPropAsString(obj.label387, "fontStyle",  "bold");
    obj.label387:setFontColor("black");
    obj.label387:setFontFamily("kalam");
    obj.label387:setName("label387");

    obj.label388 = GUI.fromHandle(_obj_newObject("label"));
    obj.label388:setParent(obj.CorpoACorpo40);
    obj.label388:setLeft(317.88);
    obj.label388:setTop(49);
    obj.label388:setWidth(68.88);
    obj.label388:setHeight(32);
    obj.label388:setHorzTextAlign("center");
    obj.label388:setField("Aparar40");
    obj.label388:setFontSize(19);
    lfm_setPropAsString(obj.label388, "fontStyle",  "bold");
    obj.label388:setFontColor("black");
    obj.label388:setFontFamily("kalam");
    obj.label388:setName("label388");

    obj.label389 = GUI.fromHandle(_obj_newObject("label"));
    obj.label389:setParent(obj.CorpoACorpo40);
    obj.label389:setLeft(317.88);
    obj.label389:setTop(89);
    obj.label389:setWidth(68.88);
    obj.label389:setHeight(32);
    obj.label389:setHorzTextAlign("center");
    obj.label389:setField("CD40");
    obj.label389:setFontSize(19);
    lfm_setPropAsString(obj.label389, "fontStyle",  "bold");
    obj.label389:setFontColor("black");
    obj.label389:setFontFamily("kalam");
    obj.label389:setName("label389");

    obj.CorpoACorpo41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo41:setParent(obj.scrollBox11);
    obj.CorpoACorpo41:setName("CorpoACorpo41");
    obj.CorpoACorpo41:setWidth(480);
    obj.CorpoACorpo41:setHeight(174);
    obj.CorpoACorpo41:setLeft(413);
    obj.CorpoACorpo41:setTop(1180);

    obj.image194 = GUI.fromHandle(_obj_newObject("image"));
    obj.image194:setParent(obj.CorpoACorpo41);
    obj.image194:setSRC("images/LojaCorpoACorpo.png");
    obj.image194:setLeft(0);
    obj.image194:setTop(0);
    obj.image194:setWidth(399);
    obj.image194:setHeight(174);
    obj.image194:setName("image194");

    obj.label390 = GUI.fromHandle(_obj_newObject("label"));
    obj.label390:setParent(obj.CorpoACorpo41);
    obj.label390:setLeft(22.25);
    obj.label390:setTop(20.50);
    obj.label390:setWidth(107.25);
    obj.label390:setHeight(37.88);
    obj.label390:setFontSize(22);
    obj.label390:setHint("Preço da Arma");
    obj.label390:setField("Preco41");
    obj.label390:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label390, "fontStyle",  "bold");
    obj.label390:setFontColor("yellow");
    obj.label390:setFontFamily("kalam");
    obj.label390:setCursor("handPoint");
    obj.label390:setHitTest(true);
    obj.label390:setName("label390");

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

    obj.image195 = GUI.fromHandle(_obj_newObject("image"));
    obj.image195:setParent(obj.CorpoACorpo41);
    obj.image195:setLeft(2.56);
    obj.image195:setTop(93.00);
    obj.image195:setWidth(136.69);
    obj.image195:setHeight(77.69);
    obj.image195:setStyle("proportional");
    obj.image195:setCenter(true);
    obj.image195:setEditable(true);
    obj.image195:setField("ImagemArma41");
    obj.image195:setName("image195");

    obj.label391 = GUI.fromHandle(_obj_newObject("label"));
    obj.label391:setParent(obj.CorpoACorpo41);
    obj.label391:setLeft(197);
    obj.label391:setTop(10);
    obj.label391:setWidth(249.25);
    obj.label391:setHeight(39);
    obj.label391:setFontSize(22);
    obj.label391:setField("ItemNome41");
    lfm_setPropAsString(obj.label391, "fontStyle",  "bold");
    obj.label391:setFontColor("black");
    obj.label391:setFontFamily("kalam");
    obj.label391:setName("label391");

    obj.label392 = GUI.fromHandle(_obj_newObject("label"));
    obj.label392:setParent(obj.CorpoACorpo41);
    obj.label392:setLeft(207.88);
    obj.label392:setTop(51);
    obj.label392:setWidth(49.88);
    obj.label392:setHeight(31.38);
    obj.label392:setHorzTextAlign("center");
    obj.label392:setField("Iniciativa41");
    obj.label392:setFontSize(19);
    lfm_setPropAsString(obj.label392, "fontStyle",  "bold");
    obj.label392:setFontColor("black");
    obj.label392:setFontFamily("kalam");
    obj.label392:setName("label392");

    obj.label393 = GUI.fromHandle(_obj_newObject("label"));
    obj.label393:setParent(obj.CorpoACorpo41);
    obj.label393:setLeft(182.88);
    obj.label393:setTop(90);
    obj.label393:setWidth(50.88);
    obj.label393:setHeight(31.38);
    obj.label393:setHorzTextAlign("center");
    obj.label393:setField("DanoItem41");
    obj.label393:setFontSize(19);
    lfm_setPropAsString(obj.label393, "fontStyle",  "bold");
    obj.label393:setFontColor("black");
    obj.label393:setFontFamily("kalam");
    obj.label393:setName("label393");

    obj.label394 = GUI.fromHandle(_obj_newObject("label"));
    obj.label394:setParent(obj.CorpoACorpo41);
    obj.label394:setLeft(195.88);
    obj.label394:setTop(128);
    obj.label394:setWidth(50.88);
    obj.label394:setHeight(32);
    obj.label394:setHorzTextAlign("center");
    obj.label394:setField("Golpear41");
    obj.label394:setFontSize(15);
    lfm_setPropAsString(obj.label394, "fontStyle",  "bold");
    obj.label394:setFontColor("black");
    obj.label394:setFontFamily("kalam");
    obj.label394:setName("label394");

    obj.label395 = GUI.fromHandle(_obj_newObject("label"));
    obj.label395:setParent(obj.CorpoACorpo41);
    obj.label395:setLeft(317.88);
    obj.label395:setTop(49);
    obj.label395:setWidth(68.88);
    obj.label395:setHeight(32);
    obj.label395:setHorzTextAlign("center");
    obj.label395:setField("Aparar41");
    obj.label395:setFontSize(19);
    lfm_setPropAsString(obj.label395, "fontStyle",  "bold");
    obj.label395:setFontColor("black");
    obj.label395:setFontFamily("kalam");
    obj.label395:setName("label395");

    obj.label396 = GUI.fromHandle(_obj_newObject("label"));
    obj.label396:setParent(obj.CorpoACorpo41);
    obj.label396:setLeft(317.88);
    obj.label396:setTop(89);
    obj.label396:setWidth(68.88);
    obj.label396:setHeight(32);
    obj.label396:setHorzTextAlign("center");
    obj.label396:setField("CD41");
    obj.label396:setFontSize(19);
    lfm_setPropAsString(obj.label396, "fontStyle",  "bold");
    obj.label396:setFontColor("black");
    obj.label396:setFontFamily("kalam");
    obj.label396:setName("label396");

    obj.CorpoACorpo42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.CorpoACorpo42:setParent(obj.scrollBox11);
    obj.CorpoACorpo42:setName("CorpoACorpo42");
    obj.CorpoACorpo42:setWidth(480);
    obj.CorpoACorpo42:setHeight(174);
    obj.CorpoACorpo42:setLeft(413);
    obj.CorpoACorpo42:setTop(1362);

    obj.image196 = GUI.fromHandle(_obj_newObject("image"));
    obj.image196:setParent(obj.CorpoACorpo42);
    obj.image196:setSRC("images/LojaCorpoACorpo.png");
    obj.image196:setLeft(0);
    obj.image196:setTop(0);
    obj.image196:setWidth(399);
    obj.image196:setHeight(174);
    obj.image196:setName("image196");

    obj.label397 = GUI.fromHandle(_obj_newObject("label"));
    obj.label397:setParent(obj.CorpoACorpo42);
    obj.label397:setLeft(22.25);
    obj.label397:setTop(20.50);
    obj.label397:setWidth(107.25);
    obj.label397:setHeight(37.88);
    obj.label397:setFontSize(22);
    obj.label397:setHint("Preço da Arma");
    obj.label397:setField("Preco42");
    obj.label397:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label397, "fontStyle",  "bold");
    obj.label397:setFontColor("yellow");
    obj.label397:setFontFamily("kalam");
    obj.label397:setCursor("handPoint");
    obj.label397:setHitTest(true);
    obj.label397:setName("label397");

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

    obj.image197 = GUI.fromHandle(_obj_newObject("image"));
    obj.image197:setParent(obj.CorpoACorpo42);
    obj.image197:setLeft(2.56);
    obj.image197:setTop(93.00);
    obj.image197:setWidth(136.69);
    obj.image197:setHeight(77.69);
    obj.image197:setStyle("proportional");
    obj.image197:setCenter(true);
    obj.image197:setEditable(true);
    obj.image197:setField("ImagemArma42");
    obj.image197:setName("image197");

    obj.label398 = GUI.fromHandle(_obj_newObject("label"));
    obj.label398:setParent(obj.CorpoACorpo42);
    obj.label398:setLeft(197);
    obj.label398:setTop(10);
    obj.label398:setWidth(249.25);
    obj.label398:setHeight(39);
    obj.label398:setFontSize(22);
    obj.label398:setField("ItemNome42");
    lfm_setPropAsString(obj.label398, "fontStyle",  "bold");
    obj.label398:setFontColor("black");
    obj.label398:setFontFamily("kalam");
    obj.label398:setName("label398");

    obj.label399 = GUI.fromHandle(_obj_newObject("label"));
    obj.label399:setParent(obj.CorpoACorpo42);
    obj.label399:setLeft(207.88);
    obj.label399:setTop(51);
    obj.label399:setWidth(49.88);
    obj.label399:setHeight(31.38);
    obj.label399:setHorzTextAlign("center");
    obj.label399:setField("Iniciativa42");
    obj.label399:setFontSize(19);
    lfm_setPropAsString(obj.label399, "fontStyle",  "bold");
    obj.label399:setFontColor("black");
    obj.label399:setFontFamily("kalam");
    obj.label399:setName("label399");

    obj.label400 = GUI.fromHandle(_obj_newObject("label"));
    obj.label400:setParent(obj.CorpoACorpo42);
    obj.label400:setLeft(182.88);
    obj.label400:setTop(90);
    obj.label400:setWidth(50.88);
    obj.label400:setHeight(31.38);
    obj.label400:setHorzTextAlign("center");
    obj.label400:setField("DanoItem42");
    obj.label400:setFontSize(19);
    lfm_setPropAsString(obj.label400, "fontStyle",  "bold");
    obj.label400:setFontColor("black");
    obj.label400:setFontFamily("kalam");
    obj.label400:setName("label400");

    obj.label401 = GUI.fromHandle(_obj_newObject("label"));
    obj.label401:setParent(obj.CorpoACorpo42);
    obj.label401:setLeft(195.88);
    obj.label401:setTop(128);
    obj.label401:setWidth(50.88);
    obj.label401:setHeight(32);
    obj.label401:setHorzTextAlign("center");
    obj.label401:setField("Golpear42");
    obj.label401:setFontSize(15);
    lfm_setPropAsString(obj.label401, "fontStyle",  "bold");
    obj.label401:setFontColor("black");
    obj.label401:setFontFamily("kalam");
    obj.label401:setName("label401");

    obj.label402 = GUI.fromHandle(_obj_newObject("label"));
    obj.label402:setParent(obj.CorpoACorpo42);
    obj.label402:setLeft(317.88);
    obj.label402:setTop(49);
    obj.label402:setWidth(68.88);
    obj.label402:setHeight(32);
    obj.label402:setHorzTextAlign("center");
    obj.label402:setField("Aparar42");
    obj.label402:setFontSize(19);
    lfm_setPropAsString(obj.label402, "fontStyle",  "bold");
    obj.label402:setFontColor("black");
    obj.label402:setFontFamily("kalam");
    obj.label402:setName("label402");

    obj.label403 = GUI.fromHandle(_obj_newObject("label"));
    obj.label403:setParent(obj.CorpoACorpo42);
    obj.label403:setLeft(317.88);
    obj.label403:setTop(89);
    obj.label403:setWidth(68.88);
    obj.label403:setHeight(32);
    obj.label403:setHorzTextAlign("center");
    obj.label403:setField("CD42");
    obj.label403:setFontSize(19);
    lfm_setPropAsString(obj.label403, "fontStyle",  "bold");
    obj.label403:setFontColor("black");
    obj.label403:setFontFamily("kalam");
    obj.label403:setName("label403");

    obj.LojaArmaduras = GUI.fromHandle(_obj_newObject("layout"));
    obj.LojaArmaduras:setParent(obj.frmLoja_svg);
    obj.LojaArmaduras:setName("LojaArmaduras");
    obj.LojaArmaduras:setAlign("client");
    obj.LojaArmaduras:setVisible(false);

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.LojaArmaduras);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("white");
    obj.rectangle27:setName("rectangle27");

    obj.scrollBox12 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox12:setParent(obj.rectangle27);
    obj.scrollBox12:setAlign("client");
    obj.scrollBox12:setName("scrollBox12");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.scrollBox12);
    obj.layout156:setAlign("client");
    obj.layout156:setName("layout156");

    obj.image198 = GUI.fromHandle(_obj_newObject("image"));
    obj.image198:setParent(obj.layout156);
    obj.image198:setSRC("images/dinheiroArma.png");
    obj.image198:setLeft(0);
    obj.image198:setTop(5);
    obj.image198:setWidth(180.37);
    obj.image198:setHeight(80.25);
    obj.image198:setName("image198");

    obj.labSoma5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma5:setParent(obj.layout156);
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

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.labSoma5);
    obj.dataLink20:setField("Soma");
    obj.dataLink20:setName("dataLink20");

    obj.image199 = GUI.fromHandle(_obj_newObject("image"));
    obj.image199:setParent(obj.scrollBox12);
    obj.image199:setLeft(0);
    obj.image199:setTop(0);
    obj.image199:setWidth(130.37);
    obj.image199:setHeight(62.25);
    obj.image199:setHint("Seu dinheiro");
    obj.image199:setCursor("handPoint");
    obj.image199:setHitTest(true);
    obj.image199:setName("image199");

    obj.image200 = GUI.fromHandle(_obj_newObject("image"));
    obj.image200:setParent(obj.scrollBox12);
    obj.image200:setSRC("images/botaoVoltar.png");
    obj.image200:setLeft(200);
    obj.image200:setTop(29);
    obj.image200:setWidth(50);
    obj.image200:setHeight(50);
    obj.image200:setCursor("handPoint");
    obj.image200:setHint("Clique aqui para voltar");
    obj.image200:setHitTest(true);
    obj.image200:setName("image200");

    obj.Armadura45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura45:setParent(obj.scrollBox12);
    obj.Armadura45:setName("Armadura45");
    obj.Armadura45:setWidth(480);
    obj.Armadura45:setHeight(174);
    obj.Armadura45:setLeft(0);
    obj.Armadura45:setTop(88);

    obj.image201 = GUI.fromHandle(_obj_newObject("image"));
    obj.image201:setParent(obj.Armadura45);
    obj.image201:setSRC("images/LojaparaArmaduras.png");
    obj.image201:setLeft(0);
    obj.image201:setTop(0);
    obj.image201:setWidth(399);
    obj.image201:setHeight(174);
    obj.image201:setName("image201");

    obj.label404 = GUI.fromHandle(_obj_newObject("label"));
    obj.label404:setParent(obj.Armadura45);
    obj.label404:setLeft(22.25);
    obj.label404:setTop(20.50);
    obj.label404:setWidth(107.25);
    obj.label404:setHeight(37.88);
    obj.label404:setFontSize(22);
    obj.label404:setHint("Preço da Arma");
    obj.label404:setField("Preco45");
    obj.label404:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label404, "fontStyle",  "bold");
    obj.label404:setFontColor("yellow");
    obj.label404:setFontFamily("kalam");
    obj.label404:setCursor("handPoint");
    obj.label404:setHitTest(true);
    obj.label404:setName("label404");

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

    obj.image202 = GUI.fromHandle(_obj_newObject("image"));
    obj.image202:setParent(obj.Armadura45);
    obj.image202:setLeft(2.56);
    obj.image202:setTop(93.00);
    obj.image202:setWidth(136.69);
    obj.image202:setHeight(77.69);
    obj.image202:setStyle("proportional");
    obj.image202:setCenter(true);
    obj.image202:setEditable(true);
    obj.image202:setField("ImagemArma45");
    obj.image202:setName("image202");

    obj.label405 = GUI.fromHandle(_obj_newObject("label"));
    obj.label405:setParent(obj.Armadura45);
    obj.label405:setLeft(197);
    obj.label405:setTop(10);
    obj.label405:setWidth(249.25);
    obj.label405:setHeight(39);
    obj.label405:setFontSize(12.8);
    obj.label405:setField("ItemNome45");
    lfm_setPropAsString(obj.label405, "fontStyle",  "bold");
    obj.label405:setFontColor("black");
    obj.label405:setFontFamily("kalam");
    obj.label405:setName("label405");

    obj.label406 = GUI.fromHandle(_obj_newObject("label"));
    obj.label406:setParent(obj.Armadura45);
    obj.label406:setLeft(243.50);
    obj.label406:setTop(46);
    obj.label406:setWidth(149.25);
    obj.label406:setHeight(38.63);
    obj.label406:setHorzTextAlign("center");
    obj.label406:setField("AbsorverAparar45");
    obj.label406:setFontSize(19);
    lfm_setPropAsString(obj.label406, "fontStyle",  "bold");
    obj.label406:setFontColor("black");
    obj.label406:setFontFamily("kalam");
    obj.label406:setName("label406");

    obj.label407 = GUI.fromHandle(_obj_newObject("label"));
    obj.label407:setParent(obj.Armadura45);
    obj.label407:setLeft(182);
    obj.label407:setTop(86.13);
    obj.label407:setWidth(61.88);
    obj.label407:setHeight(38.87);
    obj.label407:setHorzTextAlign("center");
    obj.label407:setField("CD45");
    obj.label407:setFontSize(19);
    lfm_setPropAsString(obj.label407, "fontStyle",  "bold");
    obj.label407:setFontColor("black");
    obj.label407:setFontFamily("kalam");
    obj.label407:setName("label407");

    obj.label408 = GUI.fromHandle(_obj_newObject("label"));
    obj.label408:setParent(obj.Armadura45);
    obj.label408:setLeft(300);
    obj.label408:setTop(127);
    obj.label408:setWidth(61.88);
    obj.label408:setHeight(38.88);
    obj.label408:setHorzTextAlign("center");
    obj.label408:setField("PenalidadedeMovimento45");
    obj.label408:setFontSize(15);
    lfm_setPropAsString(obj.label408, "fontStyle",  "bold");
    obj.label408:setFontColor("black");
    obj.label408:setFontFamily("kalam");
    obj.label408:setName("label408");

    obj.label409 = GUI.fromHandle(_obj_newObject("label"));
    obj.label409:setParent(obj.Armadura45);
    obj.label409:setLeft(336);
    obj.label409:setTop(86.12);
    obj.label409:setWidth(61.88);
    obj.label409:setHeight(38.88);
    obj.label409:setHorzTextAlign("center");
    obj.label409:setField("PenalidadeDePercepcao45");
    obj.label409:setFontSize(19);
    lfm_setPropAsString(obj.label409, "fontStyle",  "bold");
    obj.label409:setFontColor("black");
    obj.label409:setFontFamily("kalam");
    obj.label409:setName("label409");

    obj.Armadura46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura46:setParent(obj.scrollBox12);
    obj.Armadura46:setName("Armadura46");
    obj.Armadura46:setWidth(480);
    obj.Armadura46:setHeight(174);
    obj.Armadura46:setLeft(0);
    obj.Armadura46:setTop(270);

    obj.image203 = GUI.fromHandle(_obj_newObject("image"));
    obj.image203:setParent(obj.Armadura46);
    obj.image203:setSRC("images/LojaparaArmaduras.png");
    obj.image203:setLeft(0);
    obj.image203:setTop(0);
    obj.image203:setWidth(399);
    obj.image203:setHeight(174);
    obj.image203:setName("image203");

    obj.label410 = GUI.fromHandle(_obj_newObject("label"));
    obj.label410:setParent(obj.Armadura46);
    obj.label410:setLeft(22.25);
    obj.label410:setTop(20.50);
    obj.label410:setWidth(107.25);
    obj.label410:setHeight(37.88);
    obj.label410:setFontSize(22);
    obj.label410:setHint("Preço da Arma");
    obj.label410:setField("Preco46");
    obj.label410:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label410, "fontStyle",  "bold");
    obj.label410:setFontColor("yellow");
    obj.label410:setFontFamily("kalam");
    obj.label410:setCursor("handPoint");
    obj.label410:setHitTest(true);
    obj.label410:setName("label410");

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

    obj.image204 = GUI.fromHandle(_obj_newObject("image"));
    obj.image204:setParent(obj.Armadura46);
    obj.image204:setLeft(2.56);
    obj.image204:setTop(93.00);
    obj.image204:setWidth(136.69);
    obj.image204:setHeight(77.69);
    obj.image204:setStyle("proportional");
    obj.image204:setCenter(true);
    obj.image204:setEditable(true);
    obj.image204:setField("ImagemArma46");
    obj.image204:setName("image204");

    obj.label411 = GUI.fromHandle(_obj_newObject("label"));
    obj.label411:setParent(obj.Armadura46);
    obj.label411:setLeft(197);
    obj.label411:setTop(10);
    obj.label411:setWidth(249.25);
    obj.label411:setHeight(39);
    obj.label411:setFontSize(22);
    obj.label411:setField("ItemNome46");
    lfm_setPropAsString(obj.label411, "fontStyle",  "bold");
    obj.label411:setFontColor("black");
    obj.label411:setFontFamily("kalam");
    obj.label411:setName("label411");

    obj.label412 = GUI.fromHandle(_obj_newObject("label"));
    obj.label412:setParent(obj.Armadura46);
    obj.label412:setLeft(243.50);
    obj.label412:setTop(46);
    obj.label412:setWidth(149.25);
    obj.label412:setHeight(38.63);
    obj.label412:setHorzTextAlign("center");
    obj.label412:setField("AbsorverAparar46");
    obj.label412:setFontSize(19);
    lfm_setPropAsString(obj.label412, "fontStyle",  "bold");
    obj.label412:setFontColor("black");
    obj.label412:setFontFamily("kalam");
    obj.label412:setName("label412");

    obj.label413 = GUI.fromHandle(_obj_newObject("label"));
    obj.label413:setParent(obj.Armadura46);
    obj.label413:setLeft(182);
    obj.label413:setTop(86.13);
    obj.label413:setWidth(61.88);
    obj.label413:setHeight(38.87);
    obj.label413:setHorzTextAlign("center");
    obj.label413:setField("CD46");
    obj.label413:setFontSize(19);
    lfm_setPropAsString(obj.label413, "fontStyle",  "bold");
    obj.label413:setFontColor("black");
    obj.label413:setFontFamily("kalam");
    obj.label413:setName("label413");

    obj.label414 = GUI.fromHandle(_obj_newObject("label"));
    obj.label414:setParent(obj.Armadura46);
    obj.label414:setLeft(300);
    obj.label414:setTop(127);
    obj.label414:setWidth(61.88);
    obj.label414:setHeight(38.88);
    obj.label414:setHorzTextAlign("center");
    obj.label414:setField("PenalidadedeMovimento46");
    obj.label414:setFontSize(15);
    lfm_setPropAsString(obj.label414, "fontStyle",  "bold");
    obj.label414:setFontColor("black");
    obj.label414:setFontFamily("kalam");
    obj.label414:setName("label414");

    obj.label415 = GUI.fromHandle(_obj_newObject("label"));
    obj.label415:setParent(obj.Armadura46);
    obj.label415:setLeft(336);
    obj.label415:setTop(86.12);
    obj.label415:setWidth(61.88);
    obj.label415:setHeight(38.88);
    obj.label415:setHorzTextAlign("center");
    obj.label415:setField("PenalidadeDePercepcao46");
    obj.label415:setFontSize(19);
    lfm_setPropAsString(obj.label415, "fontStyle",  "bold");
    obj.label415:setFontColor("black");
    obj.label415:setFontFamily("kalam");
    obj.label415:setName("label415");

    obj.Armadura47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura47:setParent(obj.scrollBox12);
    obj.Armadura47:setName("Armadura47");
    obj.Armadura47:setWidth(480);
    obj.Armadura47:setHeight(174);
    obj.Armadura47:setLeft(0);
    obj.Armadura47:setTop(452);

    obj.image205 = GUI.fromHandle(_obj_newObject("image"));
    obj.image205:setParent(obj.Armadura47);
    obj.image205:setSRC("images/LojaparaArmaduras.png");
    obj.image205:setLeft(0);
    obj.image205:setTop(0);
    obj.image205:setWidth(399);
    obj.image205:setHeight(174);
    obj.image205:setName("image205");

    obj.label416 = GUI.fromHandle(_obj_newObject("label"));
    obj.label416:setParent(obj.Armadura47);
    obj.label416:setLeft(22.25);
    obj.label416:setTop(20.50);
    obj.label416:setWidth(107.25);
    obj.label416:setHeight(37.88);
    obj.label416:setFontSize(22);
    obj.label416:setHint("Preço da Arma");
    obj.label416:setField("Preco47");
    obj.label416:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label416, "fontStyle",  "bold");
    obj.label416:setFontColor("yellow");
    obj.label416:setFontFamily("kalam");
    obj.label416:setCursor("handPoint");
    obj.label416:setHitTest(true);
    obj.label416:setName("label416");

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

    obj.image206 = GUI.fromHandle(_obj_newObject("image"));
    obj.image206:setParent(obj.Armadura47);
    obj.image206:setLeft(2.56);
    obj.image206:setTop(93.00);
    obj.image206:setWidth(136.69);
    obj.image206:setHeight(77.69);
    obj.image206:setStyle("proportional");
    obj.image206:setCenter(true);
    obj.image206:setEditable(true);
    obj.image206:setField("ImagemArma47");
    obj.image206:setName("image206");

    obj.label417 = GUI.fromHandle(_obj_newObject("label"));
    obj.label417:setParent(obj.Armadura47);
    obj.label417:setLeft(197);
    obj.label417:setTop(10);
    obj.label417:setWidth(249.25);
    obj.label417:setHeight(39);
    obj.label417:setFontSize(22);
    obj.label417:setField("ItemNome47");
    lfm_setPropAsString(obj.label417, "fontStyle",  "bold");
    obj.label417:setFontColor("black");
    obj.label417:setFontFamily("kalam");
    obj.label417:setName("label417");

    obj.label418 = GUI.fromHandle(_obj_newObject("label"));
    obj.label418:setParent(obj.Armadura47);
    obj.label418:setLeft(243.50);
    obj.label418:setTop(46);
    obj.label418:setWidth(149.25);
    obj.label418:setHeight(38.63);
    obj.label418:setHorzTextAlign("center");
    obj.label418:setField("AbsorverAparar47");
    obj.label418:setFontSize(19);
    lfm_setPropAsString(obj.label418, "fontStyle",  "bold");
    obj.label418:setFontColor("black");
    obj.label418:setFontFamily("kalam");
    obj.label418:setName("label418");

    obj.label419 = GUI.fromHandle(_obj_newObject("label"));
    obj.label419:setParent(obj.Armadura47);
    obj.label419:setLeft(182);
    obj.label419:setTop(86.13);
    obj.label419:setWidth(61.88);
    obj.label419:setHeight(38.87);
    obj.label419:setHorzTextAlign("center");
    obj.label419:setField("CD47");
    obj.label419:setFontSize(19);
    lfm_setPropAsString(obj.label419, "fontStyle",  "bold");
    obj.label419:setFontColor("black");
    obj.label419:setFontFamily("kalam");
    obj.label419:setName("label419");

    obj.label420 = GUI.fromHandle(_obj_newObject("label"));
    obj.label420:setParent(obj.Armadura47);
    obj.label420:setLeft(300);
    obj.label420:setTop(127);
    obj.label420:setWidth(61.88);
    obj.label420:setHeight(38.88);
    obj.label420:setHorzTextAlign("center");
    obj.label420:setField("PenalidadedeMovimento47");
    obj.label420:setFontSize(15);
    lfm_setPropAsString(obj.label420, "fontStyle",  "bold");
    obj.label420:setFontColor("black");
    obj.label420:setFontFamily("kalam");
    obj.label420:setName("label420");

    obj.label421 = GUI.fromHandle(_obj_newObject("label"));
    obj.label421:setParent(obj.Armadura47);
    obj.label421:setLeft(336);
    obj.label421:setTop(86.12);
    obj.label421:setWidth(61.88);
    obj.label421:setHeight(38.88);
    obj.label421:setHorzTextAlign("center");
    obj.label421:setField("PenalidadeDePercepcao47");
    obj.label421:setFontSize(19);
    lfm_setPropAsString(obj.label421, "fontStyle",  "bold");
    obj.label421:setFontColor("black");
    obj.label421:setFontFamily("kalam");
    obj.label421:setName("label421");

    obj.Armadura48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura48:setParent(obj.scrollBox12);
    obj.Armadura48:setName("Armadura48");
    obj.Armadura48:setWidth(480);
    obj.Armadura48:setHeight(174);
    obj.Armadura48:setLeft(0);
    obj.Armadura48:setTop(634);

    obj.image207 = GUI.fromHandle(_obj_newObject("image"));
    obj.image207:setParent(obj.Armadura48);
    obj.image207:setSRC("images/LojaparaArmaduras.png");
    obj.image207:setLeft(0);
    obj.image207:setTop(0);
    obj.image207:setWidth(399);
    obj.image207:setHeight(174);
    obj.image207:setName("image207");

    obj.label422 = GUI.fromHandle(_obj_newObject("label"));
    obj.label422:setParent(obj.Armadura48);
    obj.label422:setLeft(22.25);
    obj.label422:setTop(20.50);
    obj.label422:setWidth(107.25);
    obj.label422:setHeight(37.88);
    obj.label422:setFontSize(22);
    obj.label422:setHint("Preço da Arma");
    obj.label422:setField("Preco48");
    obj.label422:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label422, "fontStyle",  "bold");
    obj.label422:setFontColor("yellow");
    obj.label422:setFontFamily("kalam");
    obj.label422:setCursor("handPoint");
    obj.label422:setHitTest(true);
    obj.label422:setName("label422");

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

    obj.image208 = GUI.fromHandle(_obj_newObject("image"));
    obj.image208:setParent(obj.Armadura48);
    obj.image208:setLeft(2.56);
    obj.image208:setTop(93.00);
    obj.image208:setWidth(136.69);
    obj.image208:setHeight(77.69);
    obj.image208:setStyle("proportional");
    obj.image208:setCenter(true);
    obj.image208:setEditable(true);
    obj.image208:setField("ImagemArma48");
    obj.image208:setName("image208");

    obj.label423 = GUI.fromHandle(_obj_newObject("label"));
    obj.label423:setParent(obj.Armadura48);
    obj.label423:setLeft(197);
    obj.label423:setTop(10);
    obj.label423:setWidth(249.25);
    obj.label423:setHeight(39);
    obj.label423:setFontSize(15);
    obj.label423:setField("ItemNome48");
    lfm_setPropAsString(obj.label423, "fontStyle",  "bold");
    obj.label423:setFontColor("black");
    obj.label423:setFontFamily("kalam");
    obj.label423:setName("label423");

    obj.label424 = GUI.fromHandle(_obj_newObject("label"));
    obj.label424:setParent(obj.Armadura48);
    obj.label424:setLeft(243.50);
    obj.label424:setTop(47);
    obj.label424:setWidth(149.25);
    obj.label424:setHeight(38.63);
    obj.label424:setHorzTextAlign("center");
    obj.label424:setField("AbsorverAparar48");
    obj.label424:setFontSize(19);
    lfm_setPropAsString(obj.label424, "fontStyle",  "bold");
    obj.label424:setFontColor("black");
    obj.label424:setFontFamily("kalam");
    obj.label424:setName("label424");

    obj.label425 = GUI.fromHandle(_obj_newObject("label"));
    obj.label425:setParent(obj.Armadura48);
    obj.label425:setLeft(182);
    obj.label425:setTop(86.13);
    obj.label425:setWidth(61.88);
    obj.label425:setHeight(38.87);
    obj.label425:setHorzTextAlign("center");
    obj.label425:setField("CD48");
    obj.label425:setFontSize(19);
    lfm_setPropAsString(obj.label425, "fontStyle",  "bold");
    obj.label425:setFontColor("black");
    obj.label425:setFontFamily("kalam");
    obj.label425:setName("label425");

    obj.label426 = GUI.fromHandle(_obj_newObject("label"));
    obj.label426:setParent(obj.Armadura48);
    obj.label426:setLeft(300);
    obj.label426:setTop(127);
    obj.label426:setWidth(61.88);
    obj.label426:setHeight(38.88);
    obj.label426:setHorzTextAlign("center");
    obj.label426:setField("PenalidadedeMovimento48");
    obj.label426:setFontSize(15);
    lfm_setPropAsString(obj.label426, "fontStyle",  "bold");
    obj.label426:setFontColor("black");
    obj.label426:setFontFamily("kalam");
    obj.label426:setName("label426");

    obj.label427 = GUI.fromHandle(_obj_newObject("label"));
    obj.label427:setParent(obj.Armadura48);
    obj.label427:setLeft(336);
    obj.label427:setTop(86.12);
    obj.label427:setWidth(61.88);
    obj.label427:setHeight(38.88);
    obj.label427:setHorzTextAlign("center");
    obj.label427:setField("PenalidadeDePercepcao48");
    obj.label427:setFontSize(19);
    lfm_setPropAsString(obj.label427, "fontStyle",  "bold");
    obj.label427:setFontColor("black");
    obj.label427:setFontFamily("kalam");
    obj.label427:setName("label427");

    obj.Armadura49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura49:setParent(obj.scrollBox12);
    obj.Armadura49:setName("Armadura49");
    obj.Armadura49:setWidth(480);
    obj.Armadura49:setHeight(174);
    obj.Armadura49:setLeft(0);
    obj.Armadura49:setTop(816);

    obj.image209 = GUI.fromHandle(_obj_newObject("image"));
    obj.image209:setParent(obj.Armadura49);
    obj.image209:setSRC("images/LojaparaArmaduras.png");
    obj.image209:setLeft(0);
    obj.image209:setTop(0);
    obj.image209:setWidth(399);
    obj.image209:setHeight(174);
    obj.image209:setName("image209");

    obj.label428 = GUI.fromHandle(_obj_newObject("label"));
    obj.label428:setParent(obj.Armadura49);
    obj.label428:setLeft(22.25);
    obj.label428:setTop(20.50);
    obj.label428:setWidth(107.25);
    obj.label428:setHeight(37.88);
    obj.label428:setFontSize(22);
    obj.label428:setHint("Preço da Arma");
    obj.label428:setField("Preco49");
    obj.label428:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label428, "fontStyle",  "bold");
    obj.label428:setFontColor("yellow");
    obj.label428:setFontFamily("kalam");
    obj.label428:setCursor("handPoint");
    obj.label428:setHitTest(true);
    obj.label428:setName("label428");

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

    obj.image210 = GUI.fromHandle(_obj_newObject("image"));
    obj.image210:setParent(obj.Armadura49);
    obj.image210:setLeft(2.56);
    obj.image210:setTop(93.00);
    obj.image210:setWidth(136.69);
    obj.image210:setHeight(77.69);
    obj.image210:setStyle("proportional");
    obj.image210:setCenter(true);
    obj.image210:setEditable(true);
    obj.image210:setField("ImagemArma49");
    obj.image210:setName("image210");

    obj.label429 = GUI.fromHandle(_obj_newObject("label"));
    obj.label429:setParent(obj.Armadura49);
    obj.label429:setLeft(197);
    obj.label429:setTop(10);
    obj.label429:setWidth(249.25);
    obj.label429:setHeight(39);
    obj.label429:setFontSize(16);
    obj.label429:setField("ItemNome49");
    lfm_setPropAsString(obj.label429, "fontStyle",  "bold");
    obj.label429:setFontColor("black");
    obj.label429:setFontFamily("kalam");
    obj.label429:setName("label429");

    obj.label430 = GUI.fromHandle(_obj_newObject("label"));
    obj.label430:setParent(obj.Armadura49);
    obj.label430:setLeft(243.50);
    obj.label430:setTop(47);
    obj.label430:setWidth(149.25);
    obj.label430:setHeight(38.63);
    obj.label430:setHorzTextAlign("center");
    obj.label430:setField("AbsorverAparar49");
    obj.label430:setFontSize(19);
    lfm_setPropAsString(obj.label430, "fontStyle",  "bold");
    obj.label430:setFontColor("black");
    obj.label430:setFontFamily("kalam");
    obj.label430:setName("label430");

    obj.label431 = GUI.fromHandle(_obj_newObject("label"));
    obj.label431:setParent(obj.Armadura49);
    obj.label431:setLeft(182);
    obj.label431:setTop(86.13);
    obj.label431:setWidth(61.88);
    obj.label431:setHeight(38.87);
    obj.label431:setHorzTextAlign("center");
    obj.label431:setField("CD49");
    obj.label431:setFontSize(19);
    lfm_setPropAsString(obj.label431, "fontStyle",  "bold");
    obj.label431:setFontColor("black");
    obj.label431:setFontFamily("kalam");
    obj.label431:setName("label431");

    obj.label432 = GUI.fromHandle(_obj_newObject("label"));
    obj.label432:setParent(obj.Armadura49);
    obj.label432:setLeft(300);
    obj.label432:setTop(127);
    obj.label432:setWidth(61.88);
    obj.label432:setHeight(38.88);
    obj.label432:setHorzTextAlign("center");
    obj.label432:setField("PenalidadedeMovimento49");
    obj.label432:setFontSize(15);
    lfm_setPropAsString(obj.label432, "fontStyle",  "bold");
    obj.label432:setFontColor("black");
    obj.label432:setFontFamily("kalam");
    obj.label432:setName("label432");

    obj.label433 = GUI.fromHandle(_obj_newObject("label"));
    obj.label433:setParent(obj.Armadura49);
    obj.label433:setLeft(336);
    obj.label433:setTop(86.12);
    obj.label433:setWidth(61.88);
    obj.label433:setHeight(38.88);
    obj.label433:setHorzTextAlign("center");
    obj.label433:setField("PenalidadeDePercepcao49");
    obj.label433:setFontSize(19);
    lfm_setPropAsString(obj.label433, "fontStyle",  "bold");
    obj.label433:setFontColor("black");
    obj.label433:setFontFamily("kalam");
    obj.label433:setName("label433");

    obj.Armadura50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura50:setParent(obj.scrollBox12);
    obj.Armadura50:setName("Armadura50");
    obj.Armadura50:setWidth(480);
    obj.Armadura50:setHeight(174);
    obj.Armadura50:setLeft(0);
    obj.Armadura50:setTop(998);

    obj.image211 = GUI.fromHandle(_obj_newObject("image"));
    obj.image211:setParent(obj.Armadura50);
    obj.image211:setSRC("images/LojaparaArmaduras.png");
    obj.image211:setLeft(0);
    obj.image211:setTop(0);
    obj.image211:setWidth(399);
    obj.image211:setHeight(174);
    obj.image211:setName("image211");

    obj.label434 = GUI.fromHandle(_obj_newObject("label"));
    obj.label434:setParent(obj.Armadura50);
    obj.label434:setLeft(22.25);
    obj.label434:setTop(20.50);
    obj.label434:setWidth(107.25);
    obj.label434:setHeight(37.88);
    obj.label434:setFontSize(22);
    obj.label434:setHint("Preço da Arma");
    obj.label434:setField("Preco50");
    obj.label434:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label434, "fontStyle",  "bold");
    obj.label434:setFontColor("yellow");
    obj.label434:setFontFamily("kalam");
    obj.label434:setCursor("handPoint");
    obj.label434:setHitTest(true);
    obj.label434:setName("label434");

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

    obj.image212 = GUI.fromHandle(_obj_newObject("image"));
    obj.image212:setParent(obj.Armadura50);
    obj.image212:setLeft(2.56);
    obj.image212:setTop(93.00);
    obj.image212:setWidth(136.69);
    obj.image212:setHeight(77.69);
    obj.image212:setStyle("proportional");
    obj.image212:setCenter(true);
    obj.image212:setEditable(true);
    obj.image212:setField("ImagemArma50");
    obj.image212:setName("image212");

    obj.label435 = GUI.fromHandle(_obj_newObject("label"));
    obj.label435:setParent(obj.Armadura50);
    obj.label435:setLeft(197);
    obj.label435:setTop(10);
    obj.label435:setWidth(249.25);
    obj.label435:setHeight(39);
    obj.label435:setFontSize(16.5);
    obj.label435:setField("ItemNome50");
    lfm_setPropAsString(obj.label435, "fontStyle",  "bold");
    obj.label435:setFontColor("black");
    obj.label435:setFontFamily("kalam");
    obj.label435:setName("label435");

    obj.label436 = GUI.fromHandle(_obj_newObject("label"));
    obj.label436:setParent(obj.Armadura50);
    obj.label436:setLeft(243.50);
    obj.label436:setTop(47);
    obj.label436:setWidth(149.25);
    obj.label436:setHeight(38.63);
    obj.label436:setHorzTextAlign("center");
    obj.label436:setField("AbsorverAparar50");
    obj.label436:setFontSize(19);
    lfm_setPropAsString(obj.label436, "fontStyle",  "bold");
    obj.label436:setFontColor("black");
    obj.label436:setFontFamily("kalam");
    obj.label436:setName("label436");

    obj.label437 = GUI.fromHandle(_obj_newObject("label"));
    obj.label437:setParent(obj.Armadura50);
    obj.label437:setLeft(182);
    obj.label437:setTop(86.13);
    obj.label437:setWidth(61.88);
    obj.label437:setHeight(38.87);
    obj.label437:setHorzTextAlign("center");
    obj.label437:setField("CD50");
    obj.label437:setFontSize(19);
    lfm_setPropAsString(obj.label437, "fontStyle",  "bold");
    obj.label437:setFontColor("black");
    obj.label437:setFontFamily("kalam");
    obj.label437:setName("label437");

    obj.label438 = GUI.fromHandle(_obj_newObject("label"));
    obj.label438:setParent(obj.Armadura50);
    obj.label438:setLeft(300);
    obj.label438:setTop(127);
    obj.label438:setWidth(61.88);
    obj.label438:setHeight(38.88);
    obj.label438:setHorzTextAlign("center");
    obj.label438:setField("PenalidadedeMovimento50");
    obj.label438:setFontSize(15);
    lfm_setPropAsString(obj.label438, "fontStyle",  "bold");
    obj.label438:setFontColor("black");
    obj.label438:setFontFamily("kalam");
    obj.label438:setName("label438");

    obj.label439 = GUI.fromHandle(_obj_newObject("label"));
    obj.label439:setParent(obj.Armadura50);
    obj.label439:setLeft(336);
    obj.label439:setTop(86.12);
    obj.label439:setWidth(61.88);
    obj.label439:setHeight(38.88);
    obj.label439:setHorzTextAlign("center");
    obj.label439:setField("PenalidadeDePercepcao50");
    obj.label439:setFontSize(19);
    lfm_setPropAsString(obj.label439, "fontStyle",  "bold");
    obj.label439:setFontColor("black");
    obj.label439:setFontFamily("kalam");
    obj.label439:setName("label439");

    obj.Armadura51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura51:setParent(obj.scrollBox12);
    obj.Armadura51:setName("Armadura51");
    obj.Armadura51:setWidth(480);
    obj.Armadura51:setHeight(174);
    obj.Armadura51:setLeft(413);
    obj.Armadura51:setTop(88);

    obj.image213 = GUI.fromHandle(_obj_newObject("image"));
    obj.image213:setParent(obj.Armadura51);
    obj.image213:setSRC("images/LojaparaArmaduras.png");
    obj.image213:setLeft(0);
    obj.image213:setTop(0);
    obj.image213:setWidth(399);
    obj.image213:setHeight(174);
    obj.image213:setName("image213");

    obj.label440 = GUI.fromHandle(_obj_newObject("label"));
    obj.label440:setParent(obj.Armadura51);
    obj.label440:setLeft(22.25);
    obj.label440:setTop(20.50);
    obj.label440:setWidth(107.25);
    obj.label440:setHeight(37.88);
    obj.label440:setFontSize(22);
    obj.label440:setHint("Preço da Arma");
    obj.label440:setField("Preco51");
    obj.label440:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label440, "fontStyle",  "bold");
    obj.label440:setFontColor("yellow");
    obj.label440:setFontFamily("kalam");
    obj.label440:setCursor("handPoint");
    obj.label440:setHitTest(true);
    obj.label440:setName("label440");

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

    obj.image214 = GUI.fromHandle(_obj_newObject("image"));
    obj.image214:setParent(obj.Armadura51);
    obj.image214:setLeft(2.56);
    obj.image214:setTop(93.00);
    obj.image214:setWidth(136.69);
    obj.image214:setHeight(77.69);
    obj.image214:setStyle("proportional");
    obj.image214:setCenter(true);
    obj.image214:setEditable(true);
    obj.image214:setField("ImagemArma51");
    obj.image214:setName("image214");

    obj.label441 = GUI.fromHandle(_obj_newObject("label"));
    obj.label441:setParent(obj.Armadura51);
    obj.label441:setLeft(197);
    obj.label441:setTop(10);
    obj.label441:setWidth(249.25);
    obj.label441:setHeight(39);
    obj.label441:setFontSize(18);
    obj.label441:setField("ItemNome51");
    lfm_setPropAsString(obj.label441, "fontStyle",  "bold");
    obj.label441:setFontColor("black");
    obj.label441:setFontFamily("kalam");
    obj.label441:setName("label441");

    obj.label442 = GUI.fromHandle(_obj_newObject("label"));
    obj.label442:setParent(obj.Armadura51);
    obj.label442:setLeft(243.51);
    obj.label442:setTop(47);
    obj.label442:setWidth(149.25);
    obj.label442:setHeight(38.63);
    obj.label442:setHorzTextAlign("center");
    obj.label442:setField("AbsorverAparar51");
    obj.label442:setFontSize(19);
    lfm_setPropAsString(obj.label442, "fontStyle",  "bold");
    obj.label442:setFontColor("black");
    obj.label442:setFontFamily("kalam");
    obj.label442:setName("label442");

    obj.label443 = GUI.fromHandle(_obj_newObject("label"));
    obj.label443:setParent(obj.Armadura51);
    obj.label443:setLeft(182);
    obj.label443:setTop(86.13);
    obj.label443:setWidth(61.88);
    obj.label443:setHeight(38.87);
    obj.label443:setHorzTextAlign("center");
    obj.label443:setField("CD51");
    obj.label443:setFontSize(19);
    lfm_setPropAsString(obj.label443, "fontStyle",  "bold");
    obj.label443:setFontColor("black");
    obj.label443:setFontFamily("kalam");
    obj.label443:setName("label443");

    obj.label444 = GUI.fromHandle(_obj_newObject("label"));
    obj.label444:setParent(obj.Armadura51);
    obj.label444:setLeft(300);
    obj.label444:setTop(127);
    obj.label444:setWidth(61.88);
    obj.label444:setHeight(38.88);
    obj.label444:setHorzTextAlign("center");
    obj.label444:setField("PenalidadedeMovimento51");
    obj.label444:setFontSize(15);
    lfm_setPropAsString(obj.label444, "fontStyle",  "bold");
    obj.label444:setFontColor("black");
    obj.label444:setFontFamily("kalam");
    obj.label444:setName("label444");

    obj.label445 = GUI.fromHandle(_obj_newObject("label"));
    obj.label445:setParent(obj.Armadura51);
    obj.label445:setLeft(336);
    obj.label445:setTop(86.12);
    obj.label445:setWidth(61.88);
    obj.label445:setHeight(38.88);
    obj.label445:setHorzTextAlign("center");
    obj.label445:setField("PenalidadeDePercepcao51");
    obj.label445:setFontSize(19);
    lfm_setPropAsString(obj.label445, "fontStyle",  "bold");
    obj.label445:setFontColor("black");
    obj.label445:setFontFamily("kalam");
    obj.label445:setName("label445");

    obj.Armadura52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura52:setParent(obj.scrollBox12);
    obj.Armadura52:setName("Armadura52");
    obj.Armadura52:setWidth(480);
    obj.Armadura52:setHeight(174);
    obj.Armadura52:setLeft(413);
    obj.Armadura52:setTop(270);

    obj.image215 = GUI.fromHandle(_obj_newObject("image"));
    obj.image215:setParent(obj.Armadura52);
    obj.image215:setSRC("images/LojaparaArmaduras.png");
    obj.image215:setLeft(0);
    obj.image215:setTop(0);
    obj.image215:setWidth(399);
    obj.image215:setHeight(174);
    obj.image215:setName("image215");

    obj.label446 = GUI.fromHandle(_obj_newObject("label"));
    obj.label446:setParent(obj.Armadura52);
    obj.label446:setLeft(22.25);
    obj.label446:setTop(20.50);
    obj.label446:setWidth(107.25);
    obj.label446:setHeight(37.88);
    obj.label446:setFontSize(22);
    obj.label446:setHint("Preço da Arma");
    obj.label446:setField("Preco52");
    obj.label446:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label446, "fontStyle",  "bold");
    obj.label446:setFontColor("yellow");
    obj.label446:setFontFamily("kalam");
    obj.label446:setCursor("handPoint");
    obj.label446:setHitTest(true);
    obj.label446:setName("label446");

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

    obj.image216 = GUI.fromHandle(_obj_newObject("image"));
    obj.image216:setParent(obj.Armadura52);
    obj.image216:setLeft(2.56);
    obj.image216:setTop(93.00);
    obj.image216:setWidth(136.69);
    obj.image216:setHeight(77.69);
    obj.image216:setStyle("proportional");
    obj.image216:setCenter(true);
    obj.image216:setEditable(true);
    obj.image216:setField("ImagemArma52");
    obj.image216:setName("image216");

    obj.label447 = GUI.fromHandle(_obj_newObject("label"));
    obj.label447:setParent(obj.Armadura52);
    obj.label447:setLeft(197);
    obj.label447:setTop(10);
    obj.label447:setWidth(249.25);
    obj.label447:setHeight(39);
    obj.label447:setFontSize(16);
    obj.label447:setField("ItemNome52");
    lfm_setPropAsString(obj.label447, "fontStyle",  "bold");
    obj.label447:setFontColor("black");
    obj.label447:setFontFamily("kalam");
    obj.label447:setName("label447");

    obj.label448 = GUI.fromHandle(_obj_newObject("label"));
    obj.label448:setParent(obj.Armadura52);
    obj.label448:setLeft(243.51);
    obj.label448:setTop(47);
    obj.label448:setWidth(149.25);
    obj.label448:setHeight(38.63);
    obj.label448:setHorzTextAlign("center");
    obj.label448:setField("AbsorverAparar52");
    obj.label448:setFontSize(19);
    lfm_setPropAsString(obj.label448, "fontStyle",  "bold");
    obj.label448:setFontColor("black");
    obj.label448:setFontFamily("kalam");
    obj.label448:setName("label448");

    obj.label449 = GUI.fromHandle(_obj_newObject("label"));
    obj.label449:setParent(obj.Armadura52);
    obj.label449:setLeft(182);
    obj.label449:setTop(86.13);
    obj.label449:setWidth(61.88);
    obj.label449:setHeight(38.87);
    obj.label449:setHorzTextAlign("center");
    obj.label449:setField("CD52");
    obj.label449:setFontSize(19);
    lfm_setPropAsString(obj.label449, "fontStyle",  "bold");
    obj.label449:setFontColor("black");
    obj.label449:setFontFamily("kalam");
    obj.label449:setName("label449");

    obj.label450 = GUI.fromHandle(_obj_newObject("label"));
    obj.label450:setParent(obj.Armadura52);
    obj.label450:setLeft(300);
    obj.label450:setTop(127);
    obj.label450:setWidth(61.88);
    obj.label450:setHeight(38.88);
    obj.label450:setHorzTextAlign("center");
    obj.label450:setField("PenalidadedeMovimento52");
    obj.label450:setFontSize(15);
    lfm_setPropAsString(obj.label450, "fontStyle",  "bold");
    obj.label450:setFontColor("black");
    obj.label450:setFontFamily("kalam");
    obj.label450:setName("label450");

    obj.label451 = GUI.fromHandle(_obj_newObject("label"));
    obj.label451:setParent(obj.Armadura52);
    obj.label451:setLeft(336);
    obj.label451:setTop(86.12);
    obj.label451:setWidth(61.88);
    obj.label451:setHeight(38.88);
    obj.label451:setHorzTextAlign("center");
    obj.label451:setField("PenalidadeDePercepcao52");
    obj.label451:setFontSize(19);
    lfm_setPropAsString(obj.label451, "fontStyle",  "bold");
    obj.label451:setFontColor("black");
    obj.label451:setFontFamily("kalam");
    obj.label451:setName("label451");

    obj.Armadura53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura53:setParent(obj.scrollBox12);
    obj.Armadura53:setName("Armadura53");
    obj.Armadura53:setWidth(480);
    obj.Armadura53:setHeight(174);
    obj.Armadura53:setLeft(413);
    obj.Armadura53:setTop(634);

    obj.image217 = GUI.fromHandle(_obj_newObject("image"));
    obj.image217:setParent(obj.Armadura53);
    obj.image217:setSRC("images/LojaparaArmaduras.png");
    obj.image217:setLeft(0);
    obj.image217:setTop(0);
    obj.image217:setWidth(399);
    obj.image217:setHeight(174);
    obj.image217:setName("image217");

    obj.label452 = GUI.fromHandle(_obj_newObject("label"));
    obj.label452:setParent(obj.Armadura53);
    obj.label452:setLeft(22.25);
    obj.label452:setTop(20.50);
    obj.label452:setWidth(107.25);
    obj.label452:setHeight(37.88);
    obj.label452:setFontSize(18);
    obj.label452:setHint("Preço da Arma");
    obj.label452:setField("Preco53");
    obj.label452:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label452, "fontStyle",  "bold");
    obj.label452:setFontColor("yellow");
    obj.label452:setFontFamily("kalam");
    obj.label452:setCursor("handPoint");
    obj.label452:setHitTest(true);
    obj.label452:setName("label452");

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

    obj.image218 = GUI.fromHandle(_obj_newObject("image"));
    obj.image218:setParent(obj.Armadura53);
    obj.image218:setLeft(2.56);
    obj.image218:setTop(93.00);
    obj.image218:setWidth(136.69);
    obj.image218:setHeight(77.69);
    obj.image218:setStyle("proportional");
    obj.image218:setCenter(true);
    obj.image218:setEditable(true);
    obj.image218:setField("ImagemArma53");
    obj.image218:setName("image218");

    obj.label453 = GUI.fromHandle(_obj_newObject("label"));
    obj.label453:setParent(obj.Armadura53);
    obj.label453:setLeft(197);
    obj.label453:setTop(10);
    obj.label453:setWidth(249.25);
    obj.label453:setHeight(39);
    obj.label453:setFontSize(16);
    obj.label453:setField("ItemNome53");
    lfm_setPropAsString(obj.label453, "fontStyle",  "bold");
    obj.label453:setFontColor("black");
    obj.label453:setFontFamily("kalam");
    obj.label453:setName("label453");

    obj.label454 = GUI.fromHandle(_obj_newObject("label"));
    obj.label454:setParent(obj.Armadura53);
    obj.label454:setLeft(243.51);
    obj.label454:setTop(47);
    obj.label454:setWidth(149.25);
    obj.label454:setHeight(38.63);
    obj.label454:setHorzTextAlign("center");
    obj.label454:setField("AbsorverAparar53");
    obj.label454:setFontSize(19);
    lfm_setPropAsString(obj.label454, "fontStyle",  "bold");
    obj.label454:setFontColor("black");
    obj.label454:setFontFamily("kalam");
    obj.label454:setName("label454");

    obj.label455 = GUI.fromHandle(_obj_newObject("label"));
    obj.label455:setParent(obj.Armadura53);
    obj.label455:setLeft(182);
    obj.label455:setTop(86.13);
    obj.label455:setWidth(61.88);
    obj.label455:setHeight(38.87);
    obj.label455:setHorzTextAlign("center");
    obj.label455:setField("CD53");
    obj.label455:setFontSize(19);
    lfm_setPropAsString(obj.label455, "fontStyle",  "bold");
    obj.label455:setFontColor("black");
    obj.label455:setFontFamily("kalam");
    obj.label455:setName("label455");

    obj.label456 = GUI.fromHandle(_obj_newObject("label"));
    obj.label456:setParent(obj.Armadura53);
    obj.label456:setLeft(300);
    obj.label456:setTop(127);
    obj.label456:setWidth(61.88);
    obj.label456:setHeight(38.88);
    obj.label456:setHorzTextAlign("center");
    obj.label456:setField("PenalidadedeMovimento53");
    obj.label456:setFontSize(15);
    lfm_setPropAsString(obj.label456, "fontStyle",  "bold");
    obj.label456:setFontColor("black");
    obj.label456:setFontFamily("kalam");
    obj.label456:setName("label456");

    obj.label457 = GUI.fromHandle(_obj_newObject("label"));
    obj.label457:setParent(obj.Armadura53);
    obj.label457:setLeft(336);
    obj.label457:setTop(86.12);
    obj.label457:setWidth(61.88);
    obj.label457:setHeight(38.88);
    obj.label457:setHorzTextAlign("center");
    obj.label457:setField("PenalidadeDePercepcao53");
    obj.label457:setFontSize(19);
    lfm_setPropAsString(obj.label457, "fontStyle",  "bold");
    obj.label457:setFontColor("black");
    obj.label457:setFontFamily("kalam");
    obj.label457:setName("label457");

    obj.Armadura54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura54:setParent(obj.scrollBox12);
    obj.Armadura54:setName("Armadura54");
    obj.Armadura54:setWidth(480);
    obj.Armadura54:setHeight(174);
    obj.Armadura54:setLeft(413);
    obj.Armadura54:setTop(452);

    obj.image219 = GUI.fromHandle(_obj_newObject("image"));
    obj.image219:setParent(obj.Armadura54);
    obj.image219:setSRC("images/LojaparaArmaduras.png");
    obj.image219:setLeft(0);
    obj.image219:setTop(0);
    obj.image219:setWidth(399);
    obj.image219:setHeight(174);
    obj.image219:setName("image219");

    obj.label458 = GUI.fromHandle(_obj_newObject("label"));
    obj.label458:setParent(obj.Armadura54);
    obj.label458:setLeft(22.25);
    obj.label458:setTop(20.50);
    obj.label458:setWidth(107.25);
    obj.label458:setHeight(37.88);
    obj.label458:setFontSize(22);
    obj.label458:setHint("Preço da Arma");
    obj.label458:setField("Preco54");
    obj.label458:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label458, "fontStyle",  "bold");
    obj.label458:setFontColor("yellow");
    obj.label458:setFontFamily("kalam");
    obj.label458:setCursor("handPoint");
    obj.label458:setHitTest(true);
    obj.label458:setName("label458");

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

    obj.image220 = GUI.fromHandle(_obj_newObject("image"));
    obj.image220:setParent(obj.Armadura54);
    obj.image220:setLeft(2.56);
    obj.image220:setTop(93.00);
    obj.image220:setWidth(136.69);
    obj.image220:setHeight(77.69);
    obj.image220:setStyle("proportional");
    obj.image220:setCenter(true);
    obj.image220:setEditable(true);
    obj.image220:setField("ImagemArma54");
    obj.image220:setName("image220");

    obj.label459 = GUI.fromHandle(_obj_newObject("label"));
    obj.label459:setParent(obj.Armadura54);
    obj.label459:setLeft(197);
    obj.label459:setTop(10);
    obj.label459:setWidth(249.25);
    obj.label459:setHeight(39);
    obj.label459:setFontSize(14.8);
    obj.label459:setField("ItemNome54");
    lfm_setPropAsString(obj.label459, "fontStyle",  "bold");
    obj.label459:setFontColor("black");
    obj.label459:setFontFamily("kalam");
    obj.label459:setName("label459");

    obj.label460 = GUI.fromHandle(_obj_newObject("label"));
    obj.label460:setParent(obj.Armadura54);
    obj.label460:setLeft(243.51);
    obj.label460:setTop(47);
    obj.label460:setWidth(149.25);
    obj.label460:setHeight(38.63);
    obj.label460:setHorzTextAlign("center");
    obj.label460:setField("AbsorverAparar54");
    obj.label460:setFontSize(19);
    lfm_setPropAsString(obj.label460, "fontStyle",  "bold");
    obj.label460:setFontColor("black");
    obj.label460:setFontFamily("kalam");
    obj.label460:setName("label460");

    obj.label461 = GUI.fromHandle(_obj_newObject("label"));
    obj.label461:setParent(obj.Armadura54);
    obj.label461:setLeft(182);
    obj.label461:setTop(86.13);
    obj.label461:setWidth(61.88);
    obj.label461:setHeight(38.87);
    obj.label461:setHorzTextAlign("center");
    obj.label461:setField("CD54");
    obj.label461:setFontSize(19.9);
    lfm_setPropAsString(obj.label461, "fontStyle",  "bold");
    obj.label461:setFontColor("black");
    obj.label461:setFontFamily("kalam");
    obj.label461:setName("label461");

    obj.label462 = GUI.fromHandle(_obj_newObject("label"));
    obj.label462:setParent(obj.Armadura54);
    obj.label462:setLeft(300);
    obj.label462:setTop(127);
    obj.label462:setWidth(61.88);
    obj.label462:setHeight(38.88);
    obj.label462:setHorzTextAlign("center");
    obj.label462:setField("PenalidadedeMovimento54");
    obj.label462:setFontSize(15);
    lfm_setPropAsString(obj.label462, "fontStyle",  "bold");
    obj.label462:setFontColor("black");
    obj.label462:setFontFamily("kalam");
    obj.label462:setName("label462");

    obj.label463 = GUI.fromHandle(_obj_newObject("label"));
    obj.label463:setParent(obj.Armadura54);
    obj.label463:setLeft(336);
    obj.label463:setTop(86.12);
    obj.label463:setWidth(61.88);
    obj.label463:setHeight(38.88);
    obj.label463:setHorzTextAlign("center");
    obj.label463:setField("PenalidadeDePercepcao54");
    obj.label463:setFontSize(19);
    lfm_setPropAsString(obj.label463, "fontStyle",  "bold");
    obj.label463:setFontColor("black");
    obj.label463:setFontFamily("kalam");
    obj.label463:setName("label463");

    obj.Armadura55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura55:setParent(obj.scrollBox12);
    obj.Armadura55:setName("Armadura55");
    obj.Armadura55:setWidth(480);
    obj.Armadura55:setHeight(174);
    obj.Armadura55:setLeft(413);
    obj.Armadura55:setTop(816);

    obj.image221 = GUI.fromHandle(_obj_newObject("image"));
    obj.image221:setParent(obj.Armadura55);
    obj.image221:setSRC("images/LojaparaArmaduras.png");
    obj.image221:setLeft(0);
    obj.image221:setTop(0);
    obj.image221:setWidth(399);
    obj.image221:setHeight(174);
    obj.image221:setName("image221");

    obj.label464 = GUI.fromHandle(_obj_newObject("label"));
    obj.label464:setParent(obj.Armadura55);
    obj.label464:setLeft(22.25);
    obj.label464:setTop(20.50);
    obj.label464:setWidth(107.25);
    obj.label464:setHeight(37.88);
    obj.label464:setFontSize(22);
    obj.label464:setHint("Preço da Arma");
    obj.label464:setField("Preco55");
    obj.label464:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label464, "fontStyle",  "bold");
    obj.label464:setFontColor("yellow");
    obj.label464:setFontFamily("kalam");
    obj.label464:setCursor("handPoint");
    obj.label464:setHitTest(true);
    obj.label464:setName("label464");

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

    obj.image222 = GUI.fromHandle(_obj_newObject("image"));
    obj.image222:setParent(obj.Armadura55);
    obj.image222:setLeft(2.56);
    obj.image222:setTop(93.00);
    obj.image222:setWidth(136.69);
    obj.image222:setHeight(77.69);
    obj.image222:setStyle("proportional");
    obj.image222:setCenter(true);
    obj.image222:setEditable(true);
    obj.image222:setField("ImagemArma55");
    obj.image222:setName("image222");

    obj.label465 = GUI.fromHandle(_obj_newObject("label"));
    obj.label465:setParent(obj.Armadura55);
    obj.label465:setLeft(197);
    obj.label465:setTop(10);
    obj.label465:setWidth(249.25);
    obj.label465:setHeight(39);
    obj.label465:setFontSize(22);
    obj.label465:setField("ItemNome55");
    lfm_setPropAsString(obj.label465, "fontStyle",  "bold");
    obj.label465:setFontColor("black");
    obj.label465:setFontFamily("kalam");
    obj.label465:setName("label465");

    obj.label466 = GUI.fromHandle(_obj_newObject("label"));
    obj.label466:setParent(obj.Armadura55);
    obj.label466:setLeft(243.51);
    obj.label466:setTop(47);
    obj.label466:setWidth(149.25);
    obj.label466:setHeight(38.63);
    obj.label466:setHorzTextAlign("center");
    obj.label466:setField("AbsorverAparar55");
    obj.label466:setFontSize(19);
    lfm_setPropAsString(obj.label466, "fontStyle",  "bold");
    obj.label466:setFontColor("black");
    obj.label466:setFontFamily("kalam");
    obj.label466:setName("label466");

    obj.label467 = GUI.fromHandle(_obj_newObject("label"));
    obj.label467:setParent(obj.Armadura55);
    obj.label467:setLeft(182);
    obj.label467:setTop(86.13);
    obj.label467:setWidth(61.88);
    obj.label467:setHeight(38.87);
    obj.label467:setHorzTextAlign("center");
    obj.label467:setField("CD55");
    obj.label467:setFontSize(19);
    lfm_setPropAsString(obj.label467, "fontStyle",  "bold");
    obj.label467:setFontColor("black");
    obj.label467:setFontFamily("kalam");
    obj.label467:setName("label467");

    obj.label468 = GUI.fromHandle(_obj_newObject("label"));
    obj.label468:setParent(obj.Armadura55);
    obj.label468:setLeft(300);
    obj.label468:setTop(127);
    obj.label468:setWidth(61.88);
    obj.label468:setHeight(38.88);
    obj.label468:setHorzTextAlign("center");
    obj.label468:setField("PenalidadedeMovimento55");
    obj.label468:setFontSize(15);
    lfm_setPropAsString(obj.label468, "fontStyle",  "bold");
    obj.label468:setFontColor("black");
    obj.label468:setFontFamily("kalam");
    obj.label468:setName("label468");

    obj.label469 = GUI.fromHandle(_obj_newObject("label"));
    obj.label469:setParent(obj.Armadura55);
    obj.label469:setLeft(336);
    obj.label469:setTop(86.12);
    obj.label469:setWidth(61.88);
    obj.label469:setHeight(38.88);
    obj.label469:setHorzTextAlign("center");
    obj.label469:setField("PenalidadeDePercepcao55");
    obj.label469:setFontSize(19);
    lfm_setPropAsString(obj.label469, "fontStyle",  "bold");
    obj.label469:setFontColor("black");
    obj.label469:setFontFamily("kalam");
    obj.label469:setName("label469");

    obj.Armadura56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Armadura56:setParent(obj.scrollBox12);
    obj.Armadura56:setName("Armadura56");
    obj.Armadura56:setWidth(480);
    obj.Armadura56:setHeight(174);
    obj.Armadura56:setLeft(413);
    obj.Armadura56:setTop(998);

    obj.image223 = GUI.fromHandle(_obj_newObject("image"));
    obj.image223:setParent(obj.Armadura56);
    obj.image223:setSRC("images/LojaparaArmaduras.png");
    obj.image223:setLeft(0);
    obj.image223:setTop(0);
    obj.image223:setWidth(399);
    obj.image223:setHeight(174);
    obj.image223:setName("image223");

    obj.label470 = GUI.fromHandle(_obj_newObject("label"));
    obj.label470:setParent(obj.Armadura56);
    obj.label470:setLeft(22.25);
    obj.label470:setTop(20.50);
    obj.label470:setWidth(107.25);
    obj.label470:setHeight(37.88);
    obj.label470:setFontSize(22);
    obj.label470:setHint("Preço da Arma");
    obj.label470:setField("Preco56");
    obj.label470:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label470, "fontStyle",  "bold");
    obj.label470:setFontColor("yellow");
    obj.label470:setFontFamily("kalam");
    obj.label470:setCursor("handPoint");
    obj.label470:setHitTest(true);
    obj.label470:setName("label470");

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

    obj.image224 = GUI.fromHandle(_obj_newObject("image"));
    obj.image224:setParent(obj.Armadura56);
    obj.image224:setLeft(2.56);
    obj.image224:setTop(93.00);
    obj.image224:setWidth(136.69);
    obj.image224:setHeight(77.69);
    obj.image224:setStyle("proportional");
    obj.image224:setCenter(true);
    obj.image224:setEditable(true);
    obj.image224:setField("ImagemArma56");
    obj.image224:setName("image224");

    obj.label471 = GUI.fromHandle(_obj_newObject("label"));
    obj.label471:setParent(obj.Armadura56);
    obj.label471:setLeft(197);
    obj.label471:setTop(10);
    obj.label471:setWidth(249.25);
    obj.label471:setHeight(39);
    obj.label471:setFontSize(22);
    obj.label471:setField("ItemNome56");
    lfm_setPropAsString(obj.label471, "fontStyle",  "bold");
    obj.label471:setFontColor("black");
    obj.label471:setFontFamily("kalam");
    obj.label471:setName("label471");

    obj.label472 = GUI.fromHandle(_obj_newObject("label"));
    obj.label472:setParent(obj.Armadura56);
    obj.label472:setLeft(243.51);
    obj.label472:setTop(47);
    obj.label472:setWidth(149.25);
    obj.label472:setHeight(38.63);
    obj.label472:setHorzTextAlign("center");
    obj.label472:setField("AbsorverAparar56");
    obj.label472:setFontSize(19);
    lfm_setPropAsString(obj.label472, "fontStyle",  "bold");
    obj.label472:setFontColor("black");
    obj.label472:setFontFamily("kalam");
    obj.label472:setName("label472");

    obj.label473 = GUI.fromHandle(_obj_newObject("label"));
    obj.label473:setParent(obj.Armadura56);
    obj.label473:setLeft(182);
    obj.label473:setTop(86.13);
    obj.label473:setWidth(61.88);
    obj.label473:setHeight(38.87);
    obj.label473:setHorzTextAlign("center");
    obj.label473:setField("CD56");
    obj.label473:setFontSize(19);
    lfm_setPropAsString(obj.label473, "fontStyle",  "bold");
    obj.label473:setFontColor("black");
    obj.label473:setFontFamily("kalam");
    obj.label473:setName("label473");

    obj.label474 = GUI.fromHandle(_obj_newObject("label"));
    obj.label474:setParent(obj.Armadura56);
    obj.label474:setLeft(300);
    obj.label474:setTop(127);
    obj.label474:setWidth(61.88);
    obj.label474:setHeight(38.88);
    obj.label474:setHorzTextAlign("center");
    obj.label474:setField("PenalidadedeMovimento56");
    obj.label474:setFontSize(15);
    lfm_setPropAsString(obj.label474, "fontStyle",  "bold");
    obj.label474:setFontColor("black");
    obj.label474:setFontFamily("kalam");
    obj.label474:setName("label474");

    obj.label475 = GUI.fromHandle(_obj_newObject("label"));
    obj.label475:setParent(obj.Armadura56);
    obj.label475:setLeft(336);
    obj.label475:setTop(86.12);
    obj.label475:setWidth(61.88);
    obj.label475:setHeight(38.88);
    obj.label475:setHorzTextAlign("center");
    obj.label475:setField("PenalidadeDePercepcao56");
    obj.label475:setFontSize(19);
    lfm_setPropAsString(obj.label475, "fontStyle",  "bold");
    obj.label475:setFontColor("black");
    obj.label475:setFontFamily("kalam");
    obj.label475:setName("label475");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmFichaCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaCreditos:setParent(obj.tab5);
    obj.frmFichaCreditos:setName("frmFichaCreditos");
    obj.frmFichaCreditos:setAlign("client");

    obj.scrollBox13 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox13:setParent(obj.frmFichaCreditos);
    obj.scrollBox13:setAlign("client");
    obj.scrollBox13:setName("scrollBox13");

    obj.image225 = GUI.fromHandle(_obj_newObject("image"));
    obj.image225:setParent(obj.scrollBox13);
    obj.image225:setLeft(0);
    obj.image225:setTop(0);
    obj.image225:setWidth(500);
    obj.image225:setHeight(500);
    obj.image225:setStyle("autoFit");
    obj.image225:setSRC("logo_mesa");
    obj.image225:setName("image225");

    obj.image226 = GUI.fromHandle(_obj_newObject("image"));
    obj.image226:setParent(obj.scrollBox13);
    obj.image226:setLeft(480);
    obj.image226:setTop(0);
    obj.image226:setWidth(350);
    obj.image226:setHeight(125);
    obj.image226:setStyle("autoFit");
    obj.image226:setSRC("https://i.imgur.com/HNK29eO.png?1");
    obj.image226:setName("image226");

    obj.image227 = GUI.fromHandle(_obj_newObject("image"));
    obj.image227:setParent(obj.scrollBox13);
    obj.image227:setLeft(500);
    obj.image227:setTop(125);
    obj.image227:setWidth(350);
    obj.image227:setHeight(125);
    obj.image227:setStyle("autoFit");
    obj.image227:setSRC("https://i.imgur.com/Xp12RUs.png");
    obj.image227:setName("image227");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.scrollBox13);
    obj.layout157:setLeft(460);
    obj.layout157:setTop(290);
    obj.layout157:setWidth(200);
    obj.layout157:setHeight(160);
    obj.layout157:setName("layout157");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout157);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(15);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label476 = GUI.fromHandle(_obj_newObject("label"));
    obj.label476:setParent(obj.layout157);
    obj.label476:setLeft(0);
    obj.label476:setTop(10);
    obj.label476:setWidth(200);
    obj.label476:setHeight(20);
    obj.label476:setText("Ficha criada por ");
    obj.label476:setHorzTextAlign("center");
    obj.label476:setName("label476");

    obj.label477 = GUI.fromHandle(_obj_newObject("label"));
    obj.label477:setParent(obj.layout157);
    obj.label477:setLeft(0);
    obj.label477:setTop(35);
    obj.label477:setWidth(200);
    obj.label477:setHeight(20);
    obj.label477:setText("Marcio F. (Samelfero)");
    obj.label477:setHorzTextAlign("center");
    obj.label477:setName("label477");

    obj.label478 = GUI.fromHandle(_obj_newObject("label"));
    obj.label478:setParent(obj.layout157);
    obj.label478:setLeft(0);
    obj.label478:setTop(60);
    obj.label478:setWidth(200);
    obj.label478:setHeight(20);
    obj.label478:setText("para o sistema Dead Zone");
    obj.label478:setHorzTextAlign("center");
    obj.label478:setName("label478");

    obj.label479 = GUI.fromHandle(_obj_newObject("label"));
    obj.label479:setParent(obj.layout157);
    obj.label479:setLeft(0);
    obj.label479:setTop(85);
    obj.label479:setWidth(200);
    obj.label479:setHeight(20);
    obj.label479:setText("escrito por");
    obj.label479:setHorzTextAlign("center");
    obj.label479:setName("label479");

    obj.label480 = GUI.fromHandle(_obj_newObject("label"));
    obj.label480:setParent(obj.layout157);
    obj.label480:setLeft(0);
    obj.label480:setTop(105);
    obj.label480:setWidth(200);
    obj.label480:setHeight(20);
    obj.label480:setText("Allan (allan_fns)");
    obj.label480:setHorzTextAlign("center");
    obj.label480:setName("label480");

    obj.label481 = GUI.fromHandle(_obj_newObject("label"));
    obj.label481:setParent(obj.scrollBox13);
    obj.label481:setLeft(560);
    obj.label481:setTop(480);
    obj.label481:setWidth(210);
    obj.label481:setHeight(20);
    obj.label481:setText("Sua Versão: 2.3.1");
    obj.label481:setHorzTextAlign("center");
    obj.label481:setName("label481");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.scrollBox13);
    obj.button87:setLeft(555);
    obj.button87:setTop(500);
    obj.button87:setWidth(100);
    obj.button87:setText("Change Log");
    obj.button87:setHint("Abre as notas de atualização da ficha");
    obj.button87:setName("button87");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.scrollBox13);
    obj.button88:setLeft(667);
    obj.button88:setTop(500);
    obj.button88:setWidth(100);
    obj.button88:setText("Atualizar");
    obj.button88:setHint("Baixa a versão mais recente da ficha");
    obj.button88:setName("button88");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.scrollBox13);
    obj.layout158:setLeft(680);
    obj.layout158:setTop(290);
    obj.layout158:setWidth(200);
    obj.layout158:setHeight(160);
    obj.layout158:setName("layout158");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout158);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label482 = GUI.fromHandle(_obj_newObject("label"));
    obj.label482:setParent(obj.layout158);
    obj.label482:setLeft(0);
    obj.label482:setTop(10);
    obj.label482:setWidth(200);
    obj.label482:setHeight(20);
    obj.label482:setText("Mecânicas e implementações");
    obj.label482:setHorzTextAlign("center");
    obj.label482:setName("label482");

    obj.label483 = GUI.fromHandle(_obj_newObject("label"));
    obj.label483:setParent(obj.layout158);
    obj.label483:setLeft(0);
    obj.label483:setTop(35);
    obj.label483:setWidth(200);
    obj.label483:setHeight(20);
    obj.label483:setFontSize(11.5);
    obj.label483:setText("Por MestreWill nick: (WillXOkumura)");
    obj.label483:setHorzTextAlign("center");
    obj.label483:setName("label483");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout158);
    obj.button89:setLeft(50);
    obj.button89:setTop(60);
    obj.button89:setWidth(100);
    obj.button89:setHeight(20);
    obj.button89:setText("Atualizar");
    obj.button89:setHint("Baixa a versão com mecânicas");
    obj.button89:setFontColor("yellow");
    obj.button89:setName("button89");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout158);
    obj.button90:setLeft(50);
    obj.button90:setTop(90);
    obj.button90:setWidth(100);
    obj.button90:setHeight(20);
    obj.button90:setText("Meu GitHub");
    obj.button90:setHint("Baixa a versão com mecânicas");
    lfm_setPropAsString(obj.button90, "fontStyle",  "bold");
    obj.button90:setFontColor("red");
    obj.button90:setName("button90");

    obj.label484 = GUI.fromHandle(_obj_newObject("label"));
    obj.label484:setParent(obj.layout158);
    obj.label484:setLeft(0);
    obj.label484:setTop(120);
    obj.label484:setWidth(200);
    obj.label484:setHeight(20);
    obj.label484:setFontSize(15);
    obj.label484:setText("Atualização provisória");
    obj.label484:setHorzTextAlign("center");
    obj.label484:setName("label484");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                    dialogs.inputQuery("Carteira do jogador", "Colocar dinheiro para jogador:", "",
                                       function (valorPreenchido)
                                       sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                end);
                                    end;
        end, obj);

    obj._e_event2 = obj.troca:addEventListener("onMouseEnter",
        function (_)
            self.troca.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event3 = obj.troca:addEventListener("onMouseLeave",
        function (_)
            self.troca.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event4 = obj.troca:addEventListener("onClick",
        function (_)
            self.fichaPrincipal.visible = true
                         self.Inventario.visible = false;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclEquip:append();
        end, obj);

    obj._e_event6 = obj.image2:addEventListener("onClick",
        function (_)
            self.FichaPrincipal.visible = true
                           self.Inventario.visible = false
        end, obj);

    obj._e_event7 = obj.rclEquip:addEventListener("onSelect",
        function (_)
            local node = self.rclEquip.selectedNode;  
                                     self.boxDetalhesDoItem.node = node;      
            						 
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event8 = obj.testeee:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + 0;
                    self.boxDetalhesDoItem.node.nivelItem = 0;
        end, obj);

    obj._e_event9 = obj.label1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel do item", "Level:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.nivelItem = (sheet.nivelItem or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem.node.nivelItem == 0 then
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.naoVende.visible = true;
                self.dinheiro.visible = false;
               end;
              if self.boxDetalhesDoItem.node.nivelItem == 1 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 2 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 3 then
              self.mercadoNegro.visible = true;
                  self.botaoDeVenda.visible = false;
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.dinheiro.visible = false;
            
              end;
        end, obj);

    obj._e_event11 = obj.colocarDinheiro:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa", "Quantidades:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event12 = obj.botaoDeVenda:addEventListener("onClick",
        function (_)
            local custo = tonumber(sheet.custo) or 0;
                local Soma = tonumber(sheet.Soma) or 0;
                sheet.Soma = Soma + self.boxDetalhesDoItem.node.custo; 
                custo = ndb.deleteNode(self.boxDetalhesDoItem.node);
        end, obj);

    obj._e_event13 = obj.button2:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.FOR); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event14 = obj.button3:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.DES); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Destreza de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event15 = obj.button4:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.PRE); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Presença de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event16 = obj.button5:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.TAT); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Tato de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event17 = obj.button6:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.PER); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Percepção de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.INT); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Inteligencia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event19 = obj.button8:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.DET); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Determinação de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event20 = obj.button9:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.SOR); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event21 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Iniciativa = (tonumber(sheet.DES) or 0) + (tonumber(sheet.PER) or 0);
        end, obj);

    obj._e_event22 = obj.button10:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Iniciativa); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K14]Iniciativa de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event23 = obj.button11:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Moralidade); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K14][ Moralidade ] [§T][§T][§B][§K6]"..sheet.StatusMoralidade.. "[§B][§K14] " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event24 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Saude_Base = (tonumber(sheet.FOR) or 0) + (tonumber(sheet.SOR) or 0);
        end, obj);

    obj._e_event25 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Saude_Total = (tonumber(sheet.Saude_Base) or 0) + (tonumber(sheet.Saude_Extra) or 0);
        end, obj);

    obj._e_event26 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Lesionado = (tonumber(sheet.Saude_Total) or 0) / 3;
            						sheet.Machucado = (tonumber(sheet.Saude_Total) or 0) / 3;
            						sheet.Ferido = (tonumber(sheet.Saude_Total) or 0) / 3;
        end, obj);

    obj._e_event27 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Resistencia = ((tonumber(sheet.FOR) or 0)*(-1));
        end, obj);

    obj._e_event28 = obj.button12:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri01); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Manusear Animais de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event29 = obj.button13:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri02); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Atletismo de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event30 = obj.button14:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri03); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Liderança de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event31 = obj.button15:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri04); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Construção "..sheet.Construcao.." "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event32 = obj.button16:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri05); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Enganar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri06); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Dedução de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event34 = obj.button18:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri07); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Diplomacia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event35 = obj.button19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);			
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri08); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Esquiva de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event36 = obj.button20:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri09); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Doméstico de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event37 = obj.button21:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri10); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Briga de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event38 = obj.button22:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri11); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Intimidação de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event39 = obj.button23:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri12); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Conhecimento Geral de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event40 = obj.button24:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);			
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri13); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Idioma "..sheet.Idiomas.." de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event41 = obj.button25:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri14); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Arma branca de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event42 = obj.button26:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri15); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Arma de fogo de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event43 = obj.button27:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri16); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Estratégia militar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event44 = obj.button28:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri17); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Observar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event45 = obj.button29:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri18); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Performance de "..sheet.Performance.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event46 = obj.button30:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri19); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Pilotagem de "..sheet.Pilotagem.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event47 = obj.button31:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri20); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Condução de "..sheet.Conducao.." de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event48 = obj.button32:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri21); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Manha de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event49 = obj.button33:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri22); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Furtar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event50 = obj.button34:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri23); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Furtividade de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event51 = obj.button35:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);				
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri24); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Sobrevivencia de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event52 = obj.button36:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri25); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Medicina de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event53 = obj.button37:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri26); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]Cavalgar de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event54 = obj.button38:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri27); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa1); end;
        end, obj);

    obj._e_event55 = obj.button39:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri28); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa2); end;
        end, obj);

    obj._e_event56 = obj.button40:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.Peri29); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K8][ Pericia ] [§K14]"..sheet.Coringa3); end;
        end, obj);

    obj._e_event57 = obj.button41:addEventListener("onClick",
        function (_)
            self.DescCircunstancia1:show('bottom', self.labNome);
        end, obj);

    obj._e_event58 = obj.button42:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_1); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event59 = obj.button43:addEventListener("onClick",
        function (_)
            self.DescCircunstancia2:show('bottom', self.labNome);
        end, obj);

    obj._e_event60 = obj.button44:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_2); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event61 = obj.button45:addEventListener("onClick",
        function (_)
            self.DescCircunstancia3:show('bottom', self.labNome);
        end, obj);

    obj._e_event62 = obj.button46:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_3); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event63 = obj.button47:addEventListener("onClick",
        function (_)
            self.DescCircunstancia4:show('bottom', self.labNome);
        end, obj);

    obj._e_event64 = obj.button48:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_4); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de"..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event65 = obj.button49:addEventListener("onClick",
        function (_)
            self.DescCircunstancia5:show('bottom', self.labNome);
        end, obj);

    obj._e_event66 = obj.button50:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_5); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event67 = obj.button51:addEventListener("onClick",
        function (_)
            self.DescCircunstancia6:show('bottom', self.labNome);
        end, obj);

    obj._e_event68 = obj.button52:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_6); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event69 = obj.button53:addEventListener("onClick",
        function (_)
            self.DescCircunstancia7:show('bottom', self.labNome);
        end, obj);

    obj._e_event70 = obj.button54:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_7); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event71 = obj.button55:addEventListener("onClick",
        function (_)
            self.DescCircunstancia8:show('bottom', self.labNome);
        end, obj);

    obj._e_event72 = obj.button56:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_8); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event73 = obj.button57:addEventListener("onClick",
        function (_)
            self.DescCircunstancia9:show('bottom', self.labNome);
        end, obj);

    obj._e_event74 = obj.button58:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_9); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event75 = obj.button59:addEventListener("onClick",
        function (_)
            self.DescCircunstancia10:show('bottom', self.labNome);
        end, obj);

    obj._e_event76 = obj.button60:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local rolagem = Firecast.interpretarRolagem(sheet.CircXP_10); 
            					if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            					if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K1][ Circunstancia ][§B][§K14] de "..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event77 = obj.button61:addEventListener("onClick",
        function (_)
            self.DescVanDes1:show('bottom', self.labNome);
        end, obj);

    obj._e_event78 = obj.button62:addEventListener("onClick",
        function (_)
            self.DescVanDes2:show('bottom', self.labNome);
        end, obj);

    obj._e_event79 = obj.button63:addEventListener("onClick",
        function (_)
            self.DescVanDes3:show('bottom', self.labNome);
        end, obj);

    obj._e_event80 = obj.button64:addEventListener("onClick",
        function (_)
            self.DescVanDes4:show('bottom', self.labNome);
        end, obj);

    obj._e_event81 = obj.button65:addEventListener("onClick",
        function (_)
            self.DescVanDes5:show('bottom', self.labNome);
        end, obj);

    obj._e_event82 = obj.button66:addEventListener("onClick",
        function (_)
            self.DescVanDes6:show('bottom', self.labNome);
        end, obj);

    obj._e_event83 = obj.button67:addEventListener("onClick",
        function (_)
            self.DescVanDes7:show('bottom', self.labNome);
        end, obj);

    obj._e_event84 = obj.button68:addEventListener("onClick",
        function (_)
            self.DescVanDes8:show('bottom', self.labNome);
        end, obj);

    obj._e_event85 = obj.button69:addEventListener("onClick",
        function (_)
            self.DescVanDes9:show('bottom', self.labNome);
        end, obj);

    obj._e_event86 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Exp_nUtil = (tonumber(sheet.XP_t) or 0) - (tonumber(sheet.XP_t_gasta) or 0);
        end, obj);

    obj._e_event87 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.XP_t_gasta = (tonumber(sheet.Satts) or 0) + (tonumber(sheet.Sper) or 0) + (tonumber(sheet.Scir) or 0) + (tonumber(sheet.XP_Gasto_Adicional) or 0) + (tonumber(sheet.Svan) or 0) + (tonumber(sheet.ExpMoralidadeG) or 0) + ((tonumber(sheet.Saude_Extra) or 0)*2);
        end, obj);

    obj._e_event88 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ExpSaudeExtra = ((tonumber(sheet.Saude_Extra) or 0)*2);
        end, obj);

    obj._e_event89 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.XP_t = (tonumber(sheet.XPInicial) or 0) + (tonumber(sheet.XPS1) or 0) + (tonumber(sheet.XPS2) or 0) + (tonumber(sheet.XPS3) or 0) + (tonumber(sheet.XPS4) or 0) + (tonumber(sheet.XPS5) or 0) + (tonumber(sheet.XPS6) or 0) + (tonumber(sheet.XPS7) or 0) + (tonumber(sheet.XPS8) or 0) + (tonumber(sheet.XPS9) or 0) + (tonumber(sheet.XPS10) or 0) + (tonumber(sheet.ExpExtraGanha) or 0);
        end, obj);

    obj._e_event90 = obj.button70:addEventListener("onClick",
        function (_)
            self.PopExp:show('bottom', self.labNome);
        end, obj);

    obj._e_event91 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Sper = (tonumber(sheet.Peri01) or 0) + (tonumber(sheet.Peri02) or 0) + (tonumber(sheet.Peri03) or 0) + (tonumber(sheet.Peri04) or 0) + (tonumber(sheet.Peri05) or 0) + (tonumber(sheet.Peri06) or 0) + (tonumber(sheet.Peri07) or 0) + (tonumber(sheet.Peri08) or 0) + (tonumber(sheet.Peri09) or 0) + (tonumber(sheet.Peri10) or 0) + (tonumber(sheet.Peri11) or 0) + (tonumber(sheet.Peri12) or 0) + (tonumber(sheet.Peri13) or 0) + (tonumber(sheet.Peri14) or 0) + (tonumber(sheet.Peri15) or 0) + (tonumber(sheet.Peri16) or 0) + (tonumber(sheet.Peri17) or 0) + (tonumber(sheet.Peri18) or 0) + (tonumber(sheet.Peri19) or 0) + (tonumber(sheet.Peri20) or 0) + (tonumber(sheet.Peri21) or 0) + (tonumber(sheet.Peri22) or 0) + (tonumber(sheet.Peri23) or 0) + (tonumber(sheet.Peri24) or 0) + (tonumber(sheet.Peri25) or 0) + (tonumber(sheet.Peri26) or 0) + (tonumber(sheet.Peri27) or 0) + (tonumber(sheet.Peri28) or 0) + (tonumber(sheet.Peri29) or 0);
        end, obj);

    obj._e_event92 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Scir = ((tonumber(sheet.CircXP_1) or 0) + (tonumber(sheet.CircXP_2) or 0) + (tonumber(sheet.CircXP_3) or 0) + (tonumber(sheet.CircXP_4) or 0) + (tonumber(sheet.CircXP_5) or 0) + (tonumber(sheet.CircXP_6) or 0) + (tonumber(sheet.CircXP_7) or 0) + (tonumber(sheet.CircXP_8) or 0) + (tonumber(sheet.CircXP_9) or 0) + (tonumber(sheet.CircXP_10) or 0))*2;
        end, obj);

    obj._e_event93 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Svan = (tonumber(sheet.VeD_01) or 0) + (tonumber(sheet.VeD_02) or 0) +(tonumber(sheet.VeD_03) or 0) +(tonumber(sheet.VeD_04) or 0) +(tonumber(sheet.VeD_05) or 0) +(tonumber(sheet.VeD_06) or 0) +(tonumber(sheet.VeD_07) or 0) +(tonumber(sheet.VeD_08) or 0) +(tonumber(sheet.VeD_09) or 0);
        end, obj);

    obj._e_event94 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Satts = ((tonumber(sheet.FOR) or 0) + (tonumber(sheet.DES) or 0) + (tonumber(sheet.PRE) or 0) + (tonumber(sheet.TAT) or 0) + (tonumber(sheet.PER) or 0) + (tonumber(sheet.INT) or 0) + (tonumber(sheet.DET) or 0) + (tonumber(sheet.SOR) or 0)) * 4 ;
        end, obj);

    obj._e_event95 = obj.button71:addEventListener("onClick",
        function (_)
            self.rclAtaque:append(); 
        end, obj);

    obj._e_event96 = obj.button72:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_TorsoA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_TorsoB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event97 = obj.button73:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_CabecaA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_CabecaB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event98 = obj.button74:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_OutroA + sheet.FOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Força[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
            								local rolagem = Firecast.interpretarRolagem(sheet.ARMADURA_OutroB + sheet.SOR); 
            								if not rolagem.possuiAlgumDado then rolagem = Firecast.interpretarRolagem("1d10"):concatenar(rolagem); end; 
            								if mesaDoPersonagem ~= nil then mesaDoPersonagem.chat:rolarDados(rolagem,"[§B][§K10][ Atributo ] [§K14]Sorte[§K9] [§K14]+ [§K9][ Armadura ][§K14] " ..sheet.ARMADURA_nick.. " de " ..sheet.Nick_Personagem); end;
        end, obj);

    obj._e_event99 = obj.button75:addEventListener("onClick",
        function (_)
            self.PopInventario:show('bottom', self.labNome);
        end, obj);

    obj._e_event100 = obj.button77:addEventListener("onClick",
        function (_)
            self.PopCar:show('bottom', self.labNome);
        end, obj);

    obj._e_event101 = obj.button78:addEventListener("onClick",
        function (_)
            self.PopAnimal:show('bottom', self.labNome);
        end, obj);

    obj._e_event102 = obj.button79:addEventListener("onClick",
        function (_)
            self.PopNPCfrente:show('bottom', self.labNome);
        end, obj);

    obj._e_event103 = obj.button80:addEventListener("onClick",
        function (_)
            self.rclListaNPC:append();
        end, obj);

    obj._e_event104 = obj.rclListaNPC:addEventListener("onSelect",
        function (_)
            local node = self.rclListaNPC.selectedNode; 
                                     self.boxDetalhesDoItem3.node = node;                       
                                      self.boxDetalhesDoItem3.visible = (node ~= nil);
        end, obj);

    obj._e_event105 = obj.button81:addEventListener("onClick",
        function (_)
            self.Inventario.visible = true;
            			 self.FichaPrincipal.visible = false
        end, obj);

    obj._e_event106 = obj.image75:addEventListener("onClick",
        function (_)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
                                    local PontosDeBusca = (sheet.PontosDeBusca or 0) +1;
                                    if PontosDeBusca >= 0 then
                                    sheet.PontosDeBusca = PontosDeBusca;
                                                 else 
                                        showMessage("OPA! Não pode passar de 0");   
                                     end;		
                                     end;
        end, obj);

    obj._e_event107 = obj.image75:addEventListener("onMenu",
        function (_, x, y)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
                                    local PontosDeBusca = (sheet.PontosDeBusca or 0) -1;
                                    if PontosDeBusca >= 0 then
                                    sheet.PontosDeBusca = PontosDeBusca;
                                                 else 
                                        showMessage("OPA! Não pode passar de 0");   
                                     end;		
                                     end;
        end, obj);

    obj._e_event108 = obj.ItensComuns:addEventListener("onClick",
        function (_)
            local PontosDeBusca = (sheet.PontosDeBusca or 0) -1;
            					 if PontosDeBusca >= 0 then
            					sheet.PontosDeBusca = PontosDeBusca; rolarDado(sheet)
            								  else 
            						 showMessage("Não há mais nada aqui")    
            					  end;
        end, obj);

    obj._e_event109 = obj.label81:addEventListener("onClick",
        function (_)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
            				   dialogs.inputQuery("Pontos", "Insira a quantidade de pontos:", "",
            					   function (valorPreenchido)
            						   if valorPreenchido then
            							   sheet.PontosDeBusca = (sheet.PontosDeBusca or 0) + tonumber(valorPreenchido)
            						   end
            					   end
            				   )
            			   end
        end, obj);

    obj._e_event110 = obj.image76:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	dialogs.inputQuery("Carteira do jogador", "Colocar dinheiro para jogador:", "",
            	   function (valorPreenchido)
            	   sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
            end);
            	end;
        end, obj);

    obj._e_event111 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            local s = string.format("%d", math.floor(v))
            local pos = string.len(s) % 3 
            if pos == 0 then pos = 3 end
            return string.sub(s, 1, pos)
            .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            self.labSoma3.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event112 = obj.image77:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                            function (valorPreenchido)
                                sheet.Nivel = (sheet.Nivel or 0 ) + valorPreenchido; 
                            end);
                        end;
        end, obj);

    obj._e_event113 = obj.niveldoPlayer:addEventListener("onClick",
        function (_)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
                                        local Nivel = (sheet.Nivel or 0) +1;
                                        if Nivel >= 0 then
                                        sheet.Nivel = Nivel;
                                                     else 
                                            showMessage("OPA! Não pode passar de 0");   
                                         end;		
                                         end;
        end, obj);

    obj._e_event114 = obj.niveldoPlayer:addEventListener("onMenu",
        function (_, x, y)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
                                        local Nivel = (sheet.Nivel or 0) -1;
                                        if Nivel >= 0 then
                                        sheet.Nivel = Nivel;
                                                     else 
                                            showMessage("OPA! Não pode passar de 0");   
                                         end;		
                                         end;
        end, obj);

    obj._e_event115 = obj.nivelresetPlayer:addEventListener("onDblClick",
        function (_)
            if Firecast.getMesaDe(sheet).meuJogador.isMestre then
                                        sheet.Nivel = 1
                                        else
                                        showMessage("OPA! Você não tem permissões aqui");
                                        end;
        end, obj);

    obj._e_event116 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Nivel >= 1 then
            sheet.ItemNome = 'Arco'
            sheet.Iniciativa = '-2'
            sheet.DanoItem = '+4'
            sheet.Alcance = 'C'
            sheet.Cadencia = 'Único'
            sheet.Municao = '1'
            sheet.ClasseDeDureza = '2'
            sheet.Preco = '1200'
            
            sheet.ItemNome2 = 'Besta (Crossbow)'
            sheet.Iniciativa2 = '+2'
            sheet.DanoItem2 = '+6'
            sheet.Alcance2 = 'C'
            sheet.Cadencia2 = 'Único'
            sheet.Municao2 = '1'
            sheet.ClasseDeDureza2 = '3'
            
            sheet.ItemNome3 = 'Pistola Leve'
            sheet.Iniciativa3 = '+3'
            sheet.DanoItem3 = '+2'
            sheet.Alcance3 = 'C'
            sheet.Cadencia3 = 'Curto'
            sheet.Municao3 = '18'
            sheet.ClasseDeDureza3 = '2'
            
            sheet.ItemNome4 = 'Revolver Pesado'
            sheet.Iniciativa4 = '+2'
            sheet.DanoItem4 = '+4'
            sheet.Alcance4 = 'C'
            sheet.Cadencia4 = 'Curto'
            sheet.Municao4 = '6'
            sheet.ClasseDeDureza4 = '2'
            
            sheet.ItemNome5 = 'Submetralhadora'
            sheet.Iniciativa5 = '+2'
            sheet.DanoItem5 = '+4'
            sheet.Alcance5 = 'M'
            sheet.Cadencia5 = 'Totalmente automático'
            sheet.Municao5 = '30'
            sheet.ClasseDeDureza5 = '2'
            
            sheet.ItemNome6 = 'Metralhadora Leve'
            sheet.Iniciativa6 = '+2'
            sheet.DanoItem6 = '+3'
            sheet.Alcance6 = 'C'
            sheet.Cadencia6 = 'Totalmente automático'
            sheet.Municao6 = '30'
            sheet.ClasseDeDureza6 = '2'
            
            sheet.ItemNome7 = 'Rifle de Assalto Leve'
            sheet.Iniciativa7 = '+1'
            sheet.DanoItem7 = '+6'
            sheet.Alcance7 = 'L'
            sheet.Cadencia7 = 'Totalmente automático'
            sheet.Municao7 = '30'
            sheet.ClasseDeDureza7 = '3'
            
            sheet.ItemNome8 = 'Rifle de Assalto Pesado'
            sheet.Iniciativa8 = '???'
            sheet.DanoItem8 = '+7'
            sheet.Alcance8 = 'E'
            sheet.Cadencia8 = 'Totalmente automático'
            sheet.Municao8 = '30'
            sheet.ClasseDeDureza8 = '3'
            
            sheet.ItemNome9 = 'Espingarda Leve'
            sheet.Iniciativa9 = '+1'
            sheet.DanoItem9 = '+3'
            sheet.Alcance9 = 'C'
            sheet.Cadencia9 = 'Único'
            sheet.Municao9 = '5'
            sheet.ClasseDeDureza9 = '2'
            
            sheet.ItemNome10 = 'Rifle de Caça'
            sheet.Iniciativa10 = '???'
            sheet.DanoItem10 = '+7'
            sheet.Alcance10 = 'E'
            sheet.Cadencia10 = 'Único'
            sheet.Municao10 = '5'
            sheet.ClasseDeDureza10 = '3'
            
            sheet.ItemNome11 = 'Rifle de Precisão'
            sheet.Iniciativa11 = '???'
            sheet.DanoItem11 = '+8'
            sheet.Alcance11 = 'E'
            sheet.Cadencia11 = 'Único'
            sheet.Municao11 = '10'
            sheet.ClasseDeDureza11 = '3'
            
            sheet.ItemNome12 = 'Rifle de Precisão, pesado'
            sheet.Iniciativa12 = '-1'
            sheet.DanoItem12 = '+10'
            sheet.Alcance12 = 'E'
            sheet.Cadencia12 = 'Único'
            sheet.Municao12 = '5'
            sheet.ClasseDeDureza12 = '4'
            
            sheet.ItemNome13 = 'Shotgun'
            sheet.Iniciativa13 = '+1'
            sheet.DanoItem13 = '+8'
            sheet.Alcance13 = 'C'
            sheet.Cadencia13 = 'Curto'
            sheet.Municao13 = '???'
            sheet.ClasseDeDureza13 = '???'
            
            sheet.ItemNome14 = 'Espingarda de cano duplo'
            sheet.Iniciativa14 = '???'
            sheet.DanoItem14 = '+5'
            sheet.Alcance14 = 'C'
            sheet.Cadencia14 = 'Curto'
            sheet.Municao14 = '2'
            sheet.ClasseDeDureza14 = '2'
            
            sheet.ItemNome15 = 'Metralhadora Pequena'
            sheet.Iniciativa15 = '???'
            sheet.DanoItem15 = '+7'
            sheet.Alcance15 = 'L'
            sheet.Cadencia15 = 'Correia Automática Completa'
            sheet.Municao15 = '???'
            sheet.ClasseDeDureza15 = '3'
            
            sheet.ItemNome16 = 'Metralhadora Pesada'
            sheet.Iniciativa16 = '-1'
            sheet.DanoItem16 = '+10'
            sheet.Alcance16 = 'E'
            sheet.Cadencia16 = 'Automática Completa'
            sheet.Municao16 = '???'
            sheet.ClasseDeDureza16 = '4'
            
            sheet.ItemNome17 = 'Lançador de Míssil'
            sheet.Iniciativa17 = '-2'
            sheet.DanoItem17 = '+10'
            sheet.Alcance17 = 'L'
            sheet.Cadencia17 = 'Único'
            sheet.Municao17 = '1'
            sheet.ClasseDeDureza17 = '4'
            
            sheet.ItemNome18 = 'Missil de Tanque'
            sheet.Iniciativa18 = '-4'
            sheet.DanoItem18 = '+10-+10'
            sheet.Alcance18 = 'E'
            sheet.Cadencia18 = 'Único'
            sheet.Municao18 = '1'
            sheet.ClasseDeDureza18 = '5'
            
            sheet.ItemNome19 = 'Granada de Mão'
            sheet.Iniciativa19 = '???'
            sheet.DanoItem19 = '+10'
            sheet.Alcance19 = '5m'
            sheet.Cadencia19 = '???'
            sheet.Municao19 = '1'
            sheet.ClasseDeDureza19 = '4'
            
            sheet.ItemNome20 = 'Molotov'
            sheet.Iniciativa20 = '-1'
            sheet.DanoItem20 = '+6+6'
            sheet.Alcance20 = 'C'
            sheet.Cadencia20 = 'Único'
            sheet.Municao20 = '1'
            sheet.ClasseDeDureza20 = '2'
            sheet.ItemNome21 = 'Mina, Antipessoal'
            sheet.Iniciativa21 = '???'
            sheet.DanoItem21 = '+8'
            sheet.Alcance21 = '5m'
            sheet.Cadencia21 = '???'
            sheet.Municao21 = '1'
            sheet.ClasseDeDureza21 = '3' 
            sheet.ItemNome22 = 'Mina, Anti-Veículo'
            sheet.Iniciativa22 = '???'
            sheet.DanoItem22 = '+10-+10'
            sheet.Alcance22 = '5m'
            sheet.Cadencia22 = '???'
            sheet.Municao22 = '1'
            sheet.ClasseDeDureza22 = '5'
            sheet.ItemNome23 = 'Artilharia Leve'
            sheet.Iniciativa23 = '-4'
            sheet.DanoItem23 = '+10-+10'
            sheet.Alcance23 = '1m'
            sheet.Cadencia23 = 'Longo'
            sheet.Municao23 = 'Cinto'
            sheet.ClasseDeDureza23 = '4'
            sheet.ItemNome24 = 'Artilharia Pesado'
            sheet.Iniciativa24 = '-6'
            sheet.DanoItem24 = '+10+10'
            sheet.Alcance24 = '10m'
            sheet.Cadencia24 = 'Único'
            sheet.Municao24 = '???'
            sheet.ClasseDeDureza24 = '5'
            
            
            sheet.ItemNome25 = 'Caneta-Lápis'
            sheet.Iniciativa25 = "+1"
            sheet.DanoItem25 = "???"
            sheet.Golpear25 = "???"
            sheet.Aparar25 = "???"
            sheet.CD25 = "???"
            
            sheet.ItemNome26 = 'Faca'
            sheet.Iniciativa26 = "+1"
            sheet.DanoItem26 = "+1"
            sheet.Golpear26 = "2"
            sheet.Aparar26 = "2"
            sheet.CD26 = "2"
            
            sheet.ItemNome27 = 'Faca de cozinha-talhador'
            sheet.Iniciativa27 = "+2"
            sheet.DanoItem27 = "+2"
            sheet.Golpear27 = "2"
            sheet.Aparar27 = "2"
            sheet.CD27 = "2"
            
            sheet.ItemNome28 = 'Faca de combate'
            sheet.Iniciativa28 = "+2"
            sheet.DanoItem28 = "+2"
            sheet.Golpear28 = "2"
            sheet.Aparar28 = "2"
            sheet.CD28 = "2"
            
            sheet.ItemNome29 = 'Soqueiras'
            sheet.Iniciativa29 = "+1"
            sheet.DanoItem29 = "+1"
            sheet.Golpear29 = "1"
            sheet.Aparar29 = "1"
            sheet.CD29 = "2"
            
            sheet.ItemNome30 = 'Garrafa Quebrado'
            sheet.Iniciativa30 = "+1"
            sheet.DanoItem30 = "+1"
            sheet.Golpear30 = "-1"
            sheet.Aparar30 = "2"
            sheet.CD30 = "2"
            
            sheet.ItemNome31 = 'Espada'
            sheet.Iniciativa31 = "+5"
            sheet.DanoItem31 = "+5"
            sheet.Golpear31 = "+1-+0"
            sheet.Aparar31 = "2"
            sheet.CD31 = "2"
            
            sheet.ItemNome32 = 'Machado'
            sheet.Iniciativa32 = "-2"
            sheet.DanoItem32 = "+8"
            sheet.Golpear32 = "-2"
            sheet.Aparar32 = "2"
            sheet.CD32 = "2"
            
            sheet.ItemNome33 = 'Implementos de jardim'
            sheet.Iniciativa33 = "-3"
            sheet.DanoItem33 = "+3"
            sheet.Golpear33 = "-1"
            sheet.Aparar33 = "-2"
            sheet.CD33 = "2"
            
            sheet.ItemNome34 = 'Martelo'
            sheet.Iniciativa34 = "-1"
            sheet.DanoItem34 = "+1"
            sheet.Golpear34 = "1"
            sheet.Aparar34 = "1"
            sheet.CD34 = "1"
            
            sheet.ItemNome35 = 'Malho de combate'
            sheet.Iniciativa35 = "-3"
            sheet.DanoItem35 = "+9"
            sheet.Golpear35 = "-3"
            sheet.Aparar35 = "2"
            sheet.CD35 = "2"
            
            sheet.ItemNome36 = 'Taco de Baseball c Espinhos'
            sheet.Iniciativa36 = "+2"
            sheet.DanoItem36 = "+2"
            sheet.Golpear36 = "1"
            sheet.Aparar36 = "1"
            sheet.CD36 = "1"
            
            sheet.ItemNome37 = 'Pé de Cabra'
            sheet.Iniciativa37 = "-1"
            sheet.DanoItem37 = "+2"
            sheet.Golpear37 = "1"
            sheet.Aparar37 = "1"
            sheet.CD37 = "1"
            
            sheet.ItemNome38 = 'Bastão Longo'
            sheet.Iniciativa38 = "-1"
            sheet.DanoItem38 = "+5"
            sheet.Golpear38 = "-1"
            sheet.Aparar38 = "1"
            sheet.CD38 = "1"
            
            sheet.ItemNome39 = 'Lançador'
            sheet.Iniciativa39 = "+3"
            sheet.DanoItem39 = "+4"
            sheet.Golpear39 = "-1"
            sheet.Aparar39 = "1"
            sheet.CD39 = "1"
            
            sheet.ItemNome40 = 'Lança'
            sheet.Iniciativa40 = "+3"
            sheet.DanoItem40 = "+4"
            sheet.Golpear40 = "+1+1"
            sheet.Aparar40 = "2"
            sheet.CD40 = "2"
            
            sheet.ItemNome41 = 'Soco Inglês'
            sheet.Iniciativa41 = "+2"
            sheet.DanoItem41 = "+2"
            sheet.Golpear41 = "+1+1"
            sheet.Aparar41 = "2"
            sheet.CD41 = "2"
            sheet.ItemNome42 = 'Motoserra'
            sheet.DanoItem42 = '+10'
            sheet.Iniciativa42 = "-4"
            sheet.Golpear42 = "+10"
            sheet.Aparar42 = "-1"
            sheet.CD42 = "-4"
            sheet.ItemNome45 = 'Jaqueta de Couro - Anti-Perfurante'
            sheet.AbsorverAparar45 = '+3/+3'
            sheet.CD45 = 1
            sheet.PenalidadedeMovimento45 = '???'
            sheet.PenalidadeDePercepcao45 = '???'
            
            sheet.ItemNome46 = 'Armadura Esportiva'
            sheet.AbsorverAparar46 = '+6/+6'
            sheet.CD46 = 1
            sheet.PenalidadedeMovimento46 = '-1'
            sheet.PenalidadeDePercepcao46 = '???'
            
            sheet.ItemNome47 = 'Armadura de Pneus'
            sheet.AbsorverAparar47 = '+7/+7'
            sheet.CD47 = 1
            sheet.PenalidadedeMovimento47 = '-2'
            sheet.PenalidadeDePercepcao47 = '???'
            
            sheet.ItemNome48 = 'Armadura Acolchoada / Motim'
            sheet.AbsorverAparar48 = '+7/+7'
            sheet.CD48 = 2
            sheet.PenalidadedeMovimento48 = '-2'
            sheet.PenalidadeDePercepcao48 = '???'
            
            sheet.ItemNome49 = 'Chapeamento de Aço Ruim'
            sheet.AbsorverAparar49 = '+5/+5'
            sheet.CD49 = 2
            sheet.PenalidadedeMovimento49 = '-2'
            sheet.PenalidadeDePercepcao49 = '???'
            
            sheet.ItemNome50 = 'Bom Chapeamento de Aço'
            sheet.AbsorverAparar50 = '+6/+6'
            sheet.CD50 = 3
            sheet.PenalidadedeMovimento50 = '-3'
            sheet.PenalidadeDePercepcao50 = '???'
            
            sheet.ItemNome51 = 'Armadura Balística Leve'
            sheet.AbsorverAparar51 = '+5/+5'
            sheet.CD51 = 2
            sheet.PenalidadedeMovimento51 = '???'
            sheet.PenalidadeDePercepcao51 = '???'
            
            sheet.ItemNome52 = 'Armadura Balística Média'
            sheet.AbsorverAparar52 = '+7/+7'
            sheet.CD52 = 2
            sheet.PenalidadedeMovimento52 = '-1'
            sheet.PenalidadeDePercepcao52 = '???'
            
            sheet.ItemNome53 = 'Armadura Balística Pesada'
            sheet.AbsorverAparar53 = '+6/+6'
            sheet.CD53 = 3
            sheet.PenalidadedeMovimento53 = '-2'
            sheet.PenalidadeDePercepcao53 = '???'
            
            sheet.ItemNome54 = 'Excelente Armadura Balística'
            sheet.AbsorverAparar54 = '+7/+7'
            sheet.CD54 = 3
            sheet.PenalidadedeMovimento54 = '-2'
            sheet.PenalidadeDePercepcao54 = '???'
            
            sheet.ItemNome55 = 'Escudo Anti-Motim'
            sheet.AbsorverAparar55 = '+5/+5ou+2/+2'
            sheet.CD55 = 2
            sheet.PenalidadedeMovimento55 = '???'
            sheet.PenalidadeDePercepcao55 = '???'
            
            sheet.ItemNome56 = 'Escudo Balístico'
            sheet.AbsorverAparar56 = '+6/+6ou+1/+1'
            sheet.CD56 = 3
            sheet.PenalidadedeMovimento56 = '-1'
            sheet.PenalidadeDePercepcao56 = '-2'
                            end;
        end, obj);

    obj._e_event117 = obj.button82:addEventListener("onClick",
        function (_)
            self.rclNote:append();
        end, obj);

    obj._e_event118 = obj.image81:addEventListener("onClick",
        function (_)
            self.ApresentaLoja.visible = false;
                        self.LojaDeArmas.visible = true;
        end, obj);

    obj._e_event119 = obj.image82:addEventListener("onClick",
        function (_)
            self.LojaCorpoACorpo.visible = true
                        self.ApresentaLoja.visible = false;
        end, obj);

    obj._e_event120 = obj.image83:addEventListener("onClick",
        function (_)
            self.ApresentaLoja.visible = false;
                        self.LojaArmaduras.visible = true;
        end, obj);

    obj._e_event121 = obj.button83:addEventListener("onClick",
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

    obj._e_event122 = obj.button84:addEventListener("onClick",
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

    obj._e_event123 = obj.dataLink18:addEventListener("onChange",
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

    obj._e_event124 = obj.image85:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                      sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event125 = obj.image86:addEventListener("onClick",
        function (_)
            self.LojaDeArmas.visible = false;
                        self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event126 = obj.label85:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco = (sheet.Preco or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event127 = obj.image88:addEventListener("onClick",
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

    obj._e_event128 = obj.label93:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco2 = (sheet.Preco2 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event129 = obj.image91:addEventListener("onClick",
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

    obj._e_event130 = obj.label101:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco3 = (sheet.Preco3 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event131 = obj.image94:addEventListener("onClick",
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

    obj._e_event132 = obj.label109:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco4 = (sheet.Preco4 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event133 = obj.image97:addEventListener("onClick",
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

    obj._e_event134 = obj.label117:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco5 = (sheet.Preco5 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event135 = obj.image100:addEventListener("onClick",
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

    obj._e_event136 = obj.label125:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco6 = (sheet.Preco6 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event137 = obj.image103:addEventListener("onClick",
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

    obj._e_event138 = obj.label133:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco7 = (sheet.Preco7 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event139 = obj.image106:addEventListener("onClick",
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

    obj._e_event140 = obj.label141:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco8 = (sheet.Preco8 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event141 = obj.image109:addEventListener("onClick",
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

    obj._e_event142 = obj.label149:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco9 = (sheet.Preco9 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event143 = obj.image112:addEventListener("onClick",
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

    obj._e_event144 = obj.label157:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco10 = (sheet.Preco10 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event145 = obj.image115:addEventListener("onClick",
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

    obj._e_event146 = obj.label166:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco11 = (sheet.Preco11 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event147 = obj.image118:addEventListener("onClick",
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

    obj._e_event148 = obj.label174:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco12 = (sheet.Preco12 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event149 = obj.image121:addEventListener("onClick",
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

    obj._e_event150 = obj.label182:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco13 = (sheet.Preco13 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event151 = obj.image124:addEventListener("onClick",
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

    obj._e_event152 = obj.label190:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco14 = (sheet.Preco14 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event153 = obj.image127:addEventListener("onClick",
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

    obj._e_event154 = obj.label198:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco15 = (sheet.Preco15 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event155 = obj.image130:addEventListener("onClick",
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

    obj._e_event156 = obj.label206:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco16 = (sheet.Preco16 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event157 = obj.image133:addEventListener("onClick",
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

    obj._e_event158 = obj.label214:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco17 = (sheet.Preco17 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event159 = obj.image136:addEventListener("onClick",
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

    obj._e_event160 = obj.label222:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco18 = (sheet.Preco18 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event161 = obj.image139:addEventListener("onClick",
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

    obj._e_event162 = obj.label230:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco19 = (sheet.Preco19 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event163 = obj.image142:addEventListener("onClick",
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

    obj._e_event164 = obj.label238:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco20 = (sheet.Preco20 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event165 = obj.image145:addEventListener("onClick",
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

    obj._e_event166 = obj.label246:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco21 = (sheet.Preco21 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event167 = obj.image148:addEventListener("onClick",
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

    obj._e_event168 = obj.label254:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco22 = (sheet.Preco22 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event169 = obj.image151:addEventListener("onClick",
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

    obj._e_event170 = obj.label262:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco23 = (sheet.Preco23 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event171 = obj.image154:addEventListener("onClick",
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

    obj._e_event172 = obj.label270:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			dialogs.inputQuery("Carteira", "Novo valor:", "",
            			   function (valorPreenchido)
            						  sheet.Preco24 = (sheet.Preco24 or 0 ) + valorPreenchido; 
            			end);
            			end;
        end, obj);

    obj._e_event173 = obj.image157:addEventListener("onClick",
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

    obj._e_event174 = obj.button85:addEventListener("onClick",
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

    obj._e_event175 = obj.button86:addEventListener("onClick",
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

    obj._e_event176 = obj.dataLink19:addEventListener("onChange",
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

    obj._e_event177 = obj.image160:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                dialogs.inputQuery("Carteira", "Novo valor:", "",
                                   function (valorPreenchido)
                                              sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                end);
                                end;
        end, obj);

    obj._e_event178 = obj.image161:addEventListener("onClick",
        function (_)
            self.LojaCorpoACorpo.visible = false;
                    self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event179 = obj.label278:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco25 = (sheet.Preco25 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event180 = obj.Arma25:addEventListener("onClick",
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

    obj._e_event181 = obj.label285:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco26 = (sheet.Preco26 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event182 = obj.Arma26:addEventListener("onClick",
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

    obj._e_event183 = obj.label292:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco27 = (sheet.Preco27 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event184 = obj.Arma27:addEventListener("onClick",
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

    obj._e_event185 = obj.label299:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco28 = (sheet.Preco28 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event186 = obj.Arma28:addEventListener("onClick",
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

    obj._e_event187 = obj.label306:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco29 = (sheet.Preco29 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event188 = obj.Arma29:addEventListener("onClick",
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

    obj._e_event189 = obj.label313:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco30 = (sheet.Preco30 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event190 = obj.Arma30:addEventListener("onClick",
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

    obj._e_event191 = obj.label320:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco31 = (sheet.Preco31 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event192 = obj.Arma31:addEventListener("onClick",
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

    obj._e_event193 = obj.label327:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco32 = (sheet.Preco32 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event194 = obj.Arma32:addEventListener("onClick",
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

    obj._e_event195 = obj.label334:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco33 = (sheet.Preco33 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event196 = obj.Arma33:addEventListener("onClick",
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

    obj._e_event197 = obj.label341:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco34 = (sheet.Preco34 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event198 = obj.Arma34:addEventListener("onClick",
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

    obj._e_event199 = obj.label348:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco35 = (sheet.Preco35 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event200 = obj.Arma35:addEventListener("onClick",
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

    obj._e_event201 = obj.label355:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco36 = (sheet.Preco36 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event202 = obj.Arma36:addEventListener("onClick",
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

    obj._e_event203 = obj.label362:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco37 = (sheet.Preco37 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event204 = obj.Arma37:addEventListener("onClick",
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

    obj._e_event205 = obj.label369:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                      dialogs.inputQuery("Carteira", "Novo valor:", "",
                         function (valorPreenchido)
                              sheet.Preco38 = (sheet.Preco38 or 0 ) + valorPreenchido; 
                      end);
                      end;
        end, obj);

    obj._e_event206 = obj.Arma38:addEventListener("onClick",
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

    obj._e_event207 = obj.label376:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                      dialogs.inputQuery("Carteira", "Novo valor:", "",
                         function (valorPreenchido)
                              sheet.Preco39 = (sheet.Preco39 or 0 ) + valorPreenchido; 
                      end);
                      end;
        end, obj);

    obj._e_event208 = obj.Arma39:addEventListener("onClick",
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

    obj._e_event209 = obj.label383:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco40 = (sheet.Preco40 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event210 = obj.Arma40:addEventListener("onClick",
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

    obj._e_event211 = obj.label390:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco41 = (sheet.Preco41 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event212 = obj.Arma41:addEventListener("onClick",
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

    obj._e_event213 = obj.label397:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                           function (valorPreenchido)
                                sheet.Preco42 = (sheet.Preco42 or 0 ) + valorPreenchido; 
                        end);
                        end;
        end, obj);

    obj._e_event214 = obj.Arma42:addEventListener("onClick",
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

    obj._e_event215 = obj.dataLink20:addEventListener("onChange",
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

    obj._e_event216 = obj.image199:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                        dialogs.inputQuery("Carteira", "Novo valor:", "",
                                           function (valorPreenchido)
                                                      sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                        end);
                                        end;
        end, obj);

    obj._e_event217 = obj.image200:addEventListener("onClick",
        function (_)
            self.LojaArmaduras.visible = false;
                            self.ApresentaLoja.visible = true;
        end, obj);

    obj._e_event218 = obj.label404:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco45 = (sheet.Preco45 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event219 = obj.Arma45:addEventListener("onClick",
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

    obj._e_event220 = obj.label410:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco46 = (sheet.Preco46 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event221 = obj.Arma46:addEventListener("onClick",
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

    obj._e_event222 = obj.label416:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco47 = (sheet.Preco47 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event223 = obj.Arma47:addEventListener("onClick",
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

    obj._e_event224 = obj.label422:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco48 = (sheet.Preco48 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event225 = obj.Arma48:addEventListener("onClick",
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

    obj._e_event226 = obj.label428:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco49 = (sheet.Preco49 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event227 = obj.Arma49:addEventListener("onClick",
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

    obj._e_event228 = obj.label434:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco50 = (sheet.Preco50 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event229 = obj.Arma50:addEventListener("onClick",
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

    obj._e_event230 = obj.label440:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco51 = (sheet.Preco51 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event231 = obj.Arma51:addEventListener("onClick",
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

    obj._e_event232 = obj.label446:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco52 = (sheet.Preco52 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event233 = obj.Arma52:addEventListener("onClick",
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

    obj._e_event234 = obj.label452:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco53 = (sheet.Preco53 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event235 = obj.Arma53:addEventListener("onClick",
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

    obj._e_event236 = obj.label458:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco54 = (sheet.Preco54 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event237 = obj.Arma54:addEventListener("onClick",
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

    obj._e_event238 = obj.label464:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco55 = (sheet.Preco55 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event239 = obj.Arma55:addEventListener("onClick",
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

    obj._e_event240 = obj.label470:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                dialogs.inputQuery("Carteira", "Novo valor:", "",
                   function (valorPreenchido)
                        sheet.Preco56 = (sheet.Preco56 or 0 ) + valorPreenchido; 
                end);
                end;
        end, obj);

    obj._e_event241 = obj.Arma56:addEventListener("onClick",
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

    obj._e_event242 = obj.button87:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Dead%20Zone%202.0/README.md')
        end, obj);

    obj._e_event243 = obj.button88:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/ooicram/DeadZoneRPG/raw/master/Plugins/Sheets/Dead%20Zone%202.0/output/Dead%20Zone%202.0.rpk')
        end, obj);

    obj._e_event244 = obj.button89:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://dl.dropboxusercontent.com/s/znq35lnlfxt8c7k/Dead_Zone_3.0.rpk?dl=0')
        end, obj);

    obj._e_event245 = obj.button90:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/MestreWilll')
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
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

        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.label454 ~= nil then self.label454:destroy(); self.label454 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.label468 ~= nil then self.label468:destroy(); self.label468 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.image94 ~= nil then self.image94:destroy(); self.image94 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.LojaDeArmas ~= nil then self.LojaDeArmas:destroy(); self.LojaDeArmas = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.image117 ~= nil then self.image117:destroy(); self.image117 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label399 ~= nil then self.label399:destroy(); self.label399 = nil; end;
        if self.label430 ~= nil then self.label430:destroy(); self.label430 = nil; end;
        if self.CorpoACorpo35 ~= nil then self.CorpoACorpo35:destroy(); self.CorpoACorpo35 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.Arma22 ~= nil then self.Arma22:destroy(); self.Arma22 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.Arma35 ~= nil then self.Arma35:destroy(); self.Arma35 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.image135 ~= nil then self.image135:destroy(); self.image135 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.image157 ~= nil then self.image157:destroy(); self.image157 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.image211 ~= nil then self.image211:destroy(); self.image211 = nil; end;
        if self.ItensComuns ~= nil then self.ItensComuns:destroy(); self.ItensComuns = nil; end;
        if self.CorpoACorpo40 ~= nil then self.CorpoACorpo40:destroy(); self.CorpoACorpo40 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.image136 ~= nil then self.image136:destroy(); self.image136 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.DescCircunstancia4 ~= nil then self.DescCircunstancia4:destroy(); self.DescCircunstancia4 = nil; end;
        if self.image70 ~= nil then self.image70:destroy(); self.image70 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label367 ~= nil then self.label367:destroy(); self.label367 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.image201 ~= nil then self.image201:destroy(); self.image201 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.frmAnimal ~= nil then self.frmAnimal:destroy(); self.frmAnimal = nil; end;
        if self.Nivel ~= nil then self.Nivel:destroy(); self.Nivel = nil; end;
        if self.Arma56 ~= nil then self.Arma56:destroy(); self.Arma56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.image200 ~= nil then self.image200:destroy(); self.image200 = nil; end;
        if self.label417 ~= nil then self.label417:destroy(); self.label417 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.Arma45 ~= nil then self.Arma45:destroy(); self.Arma45 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.image213 ~= nil then self.image213:destroy(); self.image213 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label386 ~= nil then self.label386:destroy(); self.label386 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.CorpoACorpo34 ~= nil then self.CorpoACorpo34:destroy(); self.CorpoACorpo34 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label465 ~= nil then self.label465:destroy(); self.label465 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.image171 ~= nil then self.image171:destroy(); self.image171 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.label455 ~= nil then self.label455:destroy(); self.label455 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.naoVende ~= nil then self.naoVende:destroy(); self.naoVende = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.image107 ~= nil then self.image107:destroy(); self.image107 = nil; end;
        if self.label459 ~= nil then self.label459:destroy(); self.label459 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label444 ~= nil then self.label444:destroy(); self.label444 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label372 ~= nil then self.label372:destroy(); self.label372 = nil; end;
        if self.label378 ~= nil then self.label378:destroy(); self.label378 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.image95 ~= nil then self.image95:destroy(); self.image95 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.image198 ~= nil then self.image198:destroy(); self.image198 = nil; end;
        if self.image206 ~= nil then self.image206:destroy(); self.image206 = nil; end;
        if self.Arma7 ~= nil then self.Arma7:destroy(); self.Arma7 = nil; end;
        if self.label381 ~= nil then self.label381:destroy(); self.label381 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.testeee ~= nil then self.testeee:destroy(); self.testeee = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.image91 ~= nil then self.image91:destroy(); self.image91 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.Arma50 ~= nil then self.Arma50:destroy(); self.Arma50 = nil; end;
        if self.label401 ~= nil then self.label401:destroy(); self.label401 = nil; end;
        if self.label375 ~= nil then self.label375:destroy(); self.label375 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.image210 ~= nil then self.image210:destroy(); self.image210 = nil; end;
        if self.dinheiro ~= nil then self.dinheiro:destroy(); self.dinheiro = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.DescVanDes2 ~= nil then self.DescVanDes2:destroy(); self.DescVanDes2 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.image103 ~= nil then self.image103:destroy(); self.image103 = nil; end;
        if self.image140 ~= nil then self.image140:destroy(); self.image140 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.label382 ~= nil then self.label382:destroy(); self.label382 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label403 ~= nil then self.label403:destroy(); self.label403 = nil; end;
        if self.image123 ~= nil then self.image123:destroy(); self.image123 = nil; end;
        if self.Armadura46 ~= nil then self.Armadura46:destroy(); self.Armadura46 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.CorpoACorpo41 ~= nil then self.CorpoACorpo41:destroy(); self.CorpoACorpo41 = nil; end;
        if self.PopNPCfrente ~= nil then self.PopNPCfrente:destroy(); self.PopNPCfrente = nil; end;
        if self.label420 ~= nil then self.label420:destroy(); self.label420 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.CorpoACorpo32 ~= nil then self.CorpoACorpo32:destroy(); self.CorpoACorpo32 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.label347 ~= nil then self.label347:destroy(); self.label347 = nil; end;
        if self.image193 ~= nil then self.image193:destroy(); self.image193 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.DescCircunstancia7 ~= nil then self.DescCircunstancia7:destroy(); self.DescCircunstancia7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.label440 ~= nil then self.label440:destroy(); self.label440 = nil; end;
        if self.label484 ~= nil then self.label484:destroy(); self.label484 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.image133 ~= nil then self.image133:destroy(); self.image133 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label355 ~= nil then self.label355:destroy(); self.label355 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.Conducao2_Circunstancia ~= nil then self.Conducao2_Circunstancia:destroy(); self.Conducao2_Circunstancia = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.frmAnotacao ~= nil then self.frmAnotacao:destroy(); self.frmAnotacao = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.image161 ~= nil then self.image161:destroy(); self.image161 = nil; end;
        if self.CorpoACorpo36 ~= nil then self.CorpoACorpo36:destroy(); self.CorpoACorpo36 = nil; end;
        if self.image132 ~= nil then self.image132:destroy(); self.image132 = nil; end;
        if self.label390 ~= nil then self.label390:destroy(); self.label390 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.Arma23 ~= nil then self.Arma23:destroy(); self.Arma23 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.image183 ~= nil then self.image183:destroy(); self.image183 = nil; end;
        if self.image217 ~= nil then self.image217:destroy(); self.image217 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label482 ~= nil then self.label482:destroy(); self.label482 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label361 ~= nil then self.label361:destroy(); self.label361 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.image145 ~= nil then self.image145:destroy(); self.image145 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.image165 ~= nil then self.image165:destroy(); self.image165 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.Arma55 ~= nil then self.Arma55:destroy(); self.Arma55 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.labSoma ~= nil then self.labSoma:destroy(); self.labSoma = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label380 ~= nil then self.label380:destroy(); self.label380 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label448 ~= nil then self.label448:destroy(); self.label448 = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label336 ~= nil then self.label336:destroy(); self.label336 = nil; end;
        if self.Armadura50 ~= nil then self.Armadura50:destroy(); self.Armadura50 = nil; end;
        if self.image75 ~= nil then self.image75:destroy(); self.image75 = nil; end;
        if self.image144 ~= nil then self.image144:destroy(); self.image144 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.image170 ~= nil then self.image170:destroy(); self.image170 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.image105 ~= nil then self.image105:destroy(); self.image105 = nil; end;
        if self.DescVanDes5 ~= nil then self.DescVanDes5:destroy(); self.DescVanDes5 = nil; end;
        if self.Arma12 ~= nil then self.Arma12:destroy(); self.Arma12 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.Arma16 ~= nil then self.Arma16:destroy(); self.Arma16 = nil; end;
        if self.label469 ~= nil then self.label469:destroy(); self.label469 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.DescVanDes1 ~= nil then self.DescVanDes1:destroy(); self.DescVanDes1 = nil; end;
        if self.image209 ~= nil then self.image209:destroy(); self.image209 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.DescVanDes6 ~= nil then self.DescVanDes6:destroy(); self.DescVanDes6 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.image76 ~= nil then self.image76:destroy(); self.image76 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.image100 ~= nil then self.image100:destroy(); self.image100 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.botaoDeVenda ~= nil then self.botaoDeVenda:destroy(); self.botaoDeVenda = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.image179 ~= nil then self.image179:destroy(); self.image179 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.CorpoACorpo42 ~= nil then self.CorpoACorpo42:destroy(); self.CorpoACorpo42 = nil; end;
        if self.image208 ~= nil then self.image208:destroy(); self.image208 = nil; end;
        if self.label481 ~= nil then self.label481:destroy(); self.label481 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.mercadoNegro ~= nil then self.mercadoNegro:destroy(); self.mercadoNegro = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.Arma5 ~= nil then self.Arma5:destroy(); self.Arma5 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.image149 ~= nil then self.image149:destroy(); self.image149 = nil; end;
        if self.DescCircunstancia10 ~= nil then self.DescCircunstancia10:destroy(); self.DescCircunstancia10 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.image188 ~= nil then self.image188:destroy(); self.image188 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.labSoma4 ~= nil then self.labSoma4:destroy(); self.labSoma4 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.label439 ~= nil then self.label439:destroy(); self.label439 = nil; end;
        if self.image216 ~= nil then self.image216:destroy(); self.image216 = nil; end;
        if self.label357 ~= nil then self.label357:destroy(); self.label357 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label413 ~= nil then self.label413:destroy(); self.label413 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.label365 ~= nil then self.label365:destroy(); self.label365 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.label434 ~= nil then self.label434:destroy(); self.label434 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.Botao ~= nil then self.Botao:destroy(); self.Botao = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.image109 ~= nil then self.image109:destroy(); self.image109 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.Arma46 ~= nil then self.Arma46:destroy(); self.Arma46 = nil; end;
        if self.Arma51 ~= nil then self.Arma51:destroy(); self.Arma51 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.image205 ~= nil then self.image205:destroy(); self.image205 = nil; end;
        if self.label458 ~= nil then self.label458:destroy(); self.label458 = nil; end;
        if self.label425 ~= nil then self.label425:destroy(); self.label425 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label480 ~= nil then self.label480:destroy(); self.label480 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.image120 ~= nil then self.image120:destroy(); self.image120 = nil; end;
        if self.Arma39 ~= nil then self.Arma39:destroy(); self.Arma39 = nil; end;
        if self.image137 ~= nil then self.image137:destroy(); self.image137 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.Armadura55 ~= nil then self.Armadura55:destroy(); self.Armadura55 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label362 ~= nil then self.label362:destroy(); self.label362 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.image166 ~= nil then self.image166:destroy(); self.image166 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.DescCircunstancia9 ~= nil then self.DescCircunstancia9:destroy(); self.DescCircunstancia9 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.label474 ~= nil then self.label474:destroy(); self.label474 = nil; end;
        if self.DescCircunstancia6 ~= nil then self.DescCircunstancia6:destroy(); self.DescCircunstancia6 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.frmCAR ~= nil then self.frmCAR:destroy(); self.frmCAR = nil; end;
        if self.labSoma2 ~= nil then self.labSoma2:destroy(); self.labSoma2 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.image178 ~= nil then self.image178:destroy(); self.image178 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.image81 ~= nil then self.image81:destroy(); self.image81 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.image172 ~= nil then self.image172:destroy(); self.image172 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.image88 ~= nil then self.image88:destroy(); self.image88 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.CorpoACorpo31 ~= nil then self.CorpoACorpo31:destroy(); self.CorpoACorpo31 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image226 ~= nil then self.image226:destroy(); self.image226 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.label379 ~= nil then self.label379:destroy(); self.label379 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.PopCar ~= nil then self.PopCar:destroy(); self.PopCar = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.image152 ~= nil then self.image152:destroy(); self.image152 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.Armadura45 ~= nil then self.Armadura45:destroy(); self.Armadura45 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.image78 ~= nil then self.image78:destroy(); self.image78 = nil; end;
        if self.CorpoACorpo39 ~= nil then self.CorpoACorpo39:destroy(); self.CorpoACorpo39 = nil; end;
        if self.Arma48 ~= nil then self.Arma48:destroy(); self.Arma48 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label396 ~= nil then self.label396:destroy(); self.label396 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.Arma21 ~= nil then self.Arma21:destroy(); self.Arma21 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.image83 ~= nil then self.image83:destroy(); self.image83 = nil; end;
        if self.Arma25 ~= nil then self.Arma25:destroy(); self.Arma25 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.frmDZ_Ficha1_svg ~= nil then self.frmDZ_Ficha1_svg:destroy(); self.frmDZ_Ficha1_svg = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.frmFichaCreditos ~= nil then self.frmFichaCreditos:destroy(); self.frmFichaCreditos = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.image122 ~= nil then self.image122:destroy(); self.image122 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.image82 ~= nil then self.image82:destroy(); self.image82 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label374 ~= nil then self.label374:destroy(); self.label374 = nil; end;
        if self.boxDetalhesDoItem3 ~= nil then self.boxDetalhesDoItem3:destroy(); self.boxDetalhesDoItem3 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label457 ~= nil then self.label457:destroy(); self.label457 = nil; end;
        if self.image223 ~= nil then self.image223:destroy(); self.image223 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.image139 ~= nil then self.image139:destroy(); self.image139 = nil; end;
        if self.Arma49 ~= nil then self.Arma49:destroy(); self.Arma49 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.image129 ~= nil then self.image129:destroy(); self.image129 = nil; end;
        if self.image221 ~= nil then self.image221:destroy(); self.image221 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.image147 ~= nil then self.image147:destroy(); self.image147 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.DescCircunstancia1 ~= nil then self.DescCircunstancia1:destroy(); self.DescCircunstancia1 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label353 ~= nil then self.label353:destroy(); self.label353 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.image77 ~= nil then self.image77:destroy(); self.image77 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.image127 ~= nil then self.image127:destroy(); self.image127 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image158 ~= nil then self.image158:destroy(); self.image158 = nil; end;
        if self.Arma26 ~= nil then self.Arma26:destroy(); self.Arma26 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.Arma3 ~= nil then self.Arma3:destroy(); self.Arma3 = nil; end;
        if self.Arma8 ~= nil then self.Arma8:destroy(); self.Arma8 = nil; end;
        if self.Arma31 ~= nil then self.Arma31:destroy(); self.Arma31 = nil; end;
        if self.label356 ~= nil then self.label356:destroy(); self.label356 = nil; end;
        if self.label383 ~= nil then self.label383:destroy(); self.label383 = nil; end;
        if self.label384 ~= nil then self.label384:destroy(); self.label384 = nil; end;
        if self.image196 ~= nil then self.image196:destroy(); self.image196 = nil; end;
        if self.label412 ~= nil then self.label412:destroy(); self.label412 = nil; end;
        if self.label464 ~= nil then self.label464:destroy(); self.label464 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.image184 ~= nil then self.image184:destroy(); self.image184 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.Arma40 ~= nil then self.Arma40:destroy(); self.Arma40 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.label414 ~= nil then self.label414:destroy(); self.label414 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.image84 ~= nil then self.image84:destroy(); self.image84 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label400 ~= nil then self.label400:destroy(); self.label400 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label410 ~= nil then self.label410:destroy(); self.label410 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.Arma38 ~= nil then self.Arma38:destroy(); self.Arma38 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label385 ~= nil then self.label385:destroy(); self.label385 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label450 ~= nil then self.label450:destroy(); self.label450 = nil; end;
        if self.NPC_DescATK ~= nil then self.NPC_DescATK:destroy(); self.NPC_DescATK = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.image143 ~= nil then self.image143:destroy(); self.image143 = nil; end;
        if self.image131 ~= nil then self.image131:destroy(); self.image131 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.Arma6 ~= nil then self.Arma6:destroy(); self.Arma6 = nil; end;
        if self.frmLoja_svg ~= nil then self.frmLoja_svg:destroy(); self.frmLoja_svg = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.image116 ~= nil then self.image116:destroy(); self.image116 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.image192 ~= nil then self.image192:destroy(); self.image192 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.Arma18 ~= nil then self.Arma18:destroy(); self.Arma18 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.label447 ~= nil then self.label447:destroy(); self.label447 = nil; end;
        if self.Arma9 ~= nil then self.Arma9:destroy(); self.Arma9 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label427 ~= nil then self.label427:destroy(); self.label427 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.image104 ~= nil then self.image104:destroy(); self.image104 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.Arma19 ~= nil then self.Arma19:destroy(); self.Arma19 = nil; end;
        if self.label475 ~= nil then self.label475:destroy(); self.label475 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.DescVanDes8 ~= nil then self.DescVanDes8:destroy(); self.DescVanDes8 = nil; end;
        if self.label404 ~= nil then self.label404:destroy(); self.label404 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.PopInventario ~= nil then self.PopInventario:destroy(); self.PopInventario = nil; end;
        if self.image113 ~= nil then self.image113:destroy(); self.image113 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.image112 ~= nil then self.image112:destroy(); self.image112 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.image176 ~= nil then self.image176:destroy(); self.image176 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.Conducao2_Equipamentos ~= nil then self.Conducao2_Equipamentos:destroy(); self.Conducao2_Equipamentos = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.image102 ~= nil then self.image102:destroy(); self.image102 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.image148 ~= nil then self.image148:destroy(); self.image148 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.image74 ~= nil then self.image74:destroy(); self.image74 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.Arma34 ~= nil then self.Arma34:destroy(); self.Arma34 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.image191 ~= nil then self.image191:destroy(); self.image191 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label422 ~= nil then self.label422:destroy(); self.label422 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label466 ~= nil then self.label466:destroy(); self.label466 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.Armadura52 ~= nil then self.Armadura52:destroy(); self.Armadura52 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.image142 ~= nil then self.image142:destroy(); self.image142 = nil; end;
        if self.nivelresetPlayer ~= nil then self.nivelresetPlayer:destroy(); self.nivelresetPlayer = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.image80 ~= nil then self.image80:destroy(); self.image80 = nil; end;
        if self.image180 ~= nil then self.image180:destroy(); self.image180 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label456 ~= nil then self.label456:destroy(); self.label456 = nil; end;
        if self.Armadura49 ~= nil then self.Armadura49:destroy(); self.Armadura49 = nil; end;
        if self.image155 ~= nil then self.image155:destroy(); self.image155 = nil; end;
        if self.image126 ~= nil then self.image126:destroy(); self.image126 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.image110 ~= nil then self.image110:destroy(); self.image110 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.image151 ~= nil then self.image151:destroy(); self.image151 = nil; end;
        if self.image214 ~= nil then self.image214:destroy(); self.image214 = nil; end;
        if self.Arma29 ~= nil then self.Arma29:destroy(); self.Arma29 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.image101 ~= nil then self.image101:destroy(); self.image101 = nil; end;
        if self.image175 ~= nil then self.image175:destroy(); self.image175 = nil; end;
        if self.label428 ~= nil then self.label428:destroy(); self.label428 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.NPC_Circunstancia ~= nil then self.NPC_Circunstancia:destroy(); self.NPC_Circunstancia = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.image85 ~= nil then self.image85:destroy(); self.image85 = nil; end;
        if self.label462 ~= nil then self.label462:destroy(); self.label462 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.image225 ~= nil then self.image225:destroy(); self.image225 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.label478 ~= nil then self.label478:destroy(); self.label478 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.labSoma3 ~= nil then self.labSoma3:destroy(); self.labSoma3 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.NPC_DescDEF ~= nil then self.NPC_DescDEF:destroy(); self.NPC_DescDEF = nil; end;
        if self.Arma33 ~= nil then self.Arma33:destroy(); self.Arma33 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label359 ~= nil then self.label359:destroy(); self.label359 = nil; end;
        if self.label364 ~= nil then self.label364:destroy(); self.label364 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.DescVanDes4 ~= nil then self.DescVanDes4:destroy(); self.DescVanDes4 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.image169 ~= nil then self.image169:destroy(); self.image169 = nil; end;
        if self.image187 ~= nil then self.image187:destroy(); self.image187 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.label393 ~= nil then self.label393:destroy(); self.label393 = nil; end;
        if self.label348 ~= nil then self.label348:destroy(); self.label348 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label446 ~= nil then self.label446:destroy(); self.label446 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.image154 ~= nil then self.image154:destroy(); self.image154 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.image124 ~= nil then self.image124:destroy(); self.image124 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.Arma36 ~= nil then self.Arma36:destroy(); self.Arma36 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.DescCircunstancia8 ~= nil then self.DescCircunstancia8:destroy(); self.DescCircunstancia8 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image79 ~= nil then self.image79:destroy(); self.image79 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.image118 ~= nil then self.image118:destroy(); self.image118 = nil; end;
        if self.label445 ~= nil then self.label445:destroy(); self.label445 = nil; end;
        if self.Arma54 ~= nil then self.Arma54:destroy(); self.Arma54 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.image106 ~= nil then self.image106:destroy(); self.image106 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.image177 ~= nil then self.image177:destroy(); self.image177 = nil; end;
        if self.image195 ~= nil then self.image195:destroy(); self.image195 = nil; end;
        if self.image197 ~= nil then self.image197:destroy(); self.image197 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.image207 ~= nil then self.image207:destroy(); self.image207 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label437 ~= nil then self.label437:destroy(); self.label437 = nil; end;
        if self.Armadura54 ~= nil then self.Armadura54:destroy(); self.Armadura54 = nil; end;
        if self.Armadura56 ~= nil then self.Armadura56:destroy(); self.Armadura56 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.label366 ~= nil then self.label366:destroy(); self.label366 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.Arma37 ~= nil then self.Arma37:destroy(); self.Arma37 = nil; end;
        if self.CorpoACorpo38 ~= nil then self.CorpoACorpo38:destroy(); self.CorpoACorpo38 = nil; end;
        if self.label433 ~= nil then self.label433:destroy(); self.label433 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.label435 ~= nil then self.label435:destroy(); self.label435 = nil; end;
        if self.label409 ~= nil then self.label409:destroy(); self.label409 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.DescVanDes3 ~= nil then self.DescVanDes3:destroy(); self.DescVanDes3 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.label376 ~= nil then self.label376:destroy(); self.label376 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.image92 ~= nil then self.image92:destroy(); self.image92 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.image153 ~= nil then self.image153:destroy(); self.image153 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.Arma20 ~= nil then self.Arma20:destroy(); self.Arma20 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.label377 ~= nil then self.label377:destroy(); self.label377 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.Arma28 ~= nil then self.Arma28:destroy(); self.Arma28 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.Arma2 ~= nil then self.Arma2:destroy(); self.Arma2 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.CorpoACorpo27 ~= nil then self.CorpoACorpo27:destroy(); self.CorpoACorpo27 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.image97 ~= nil then self.image97:destroy(); self.image97 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.label418 ~= nil then self.label418:destroy(); self.label418 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.image181 ~= nil then self.image181:destroy(); self.image181 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.image125 ~= nil then self.image125:destroy(); self.image125 = nil; end;
        if self.scrollBox12 ~= nil then self.scrollBox12:destroy(); self.scrollBox12 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.image96 ~= nil then self.image96:destroy(); self.image96 = nil; end;
        if self.label358 ~= nil then self.label358:destroy(); self.label358 = nil; end;
        if self.Arma17 ~= nil then self.Arma17:destroy(); self.Arma17 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.image190 ~= nil then self.image190:destroy(); self.image190 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.image99 ~= nil then self.image99:destroy(); self.image99 = nil; end;
        if self.DescCircunstancia3 ~= nil then self.DescCircunstancia3:destroy(); self.DescCircunstancia3 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.Arma15 ~= nil then self.Arma15:destroy(); self.Arma15 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.image146 ~= nil then self.image146:destroy(); self.image146 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.CorpoACorpo28 ~= nil then self.CorpoACorpo28:destroy(); self.CorpoACorpo28 = nil; end;
        if self.label411 ~= nil then self.label411:destroy(); self.label411 = nil; end;
        if self.image108 ~= nil then self.image108:destroy(); self.image108 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.image215 ~= nil then self.image215:destroy(); self.image215 = nil; end;
        if self.image220 ~= nil then self.image220:destroy(); self.image220 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.label477 ~= nil then self.label477:destroy(); self.label477 = nil; end;
        if self.image89 ~= nil then self.image89:destroy(); self.image89 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.LojaArmaduras ~= nil then self.LojaArmaduras:destroy(); self.LojaArmaduras = nil; end;
        if self.label389 ~= nil then self.label389:destroy(); self.label389 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.image93 ~= nil then self.image93:destroy(); self.image93 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.image90 ~= nil then self.image90:destroy(); self.image90 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.Venda ~= nil then self.Venda:destroy(); self.Venda = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.image159 ~= nil then self.image159:destroy(); self.image159 = nil; end;
        if self.Arma30 ~= nil then self.Arma30:destroy(); self.Arma30 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.image134 ~= nil then self.image134:destroy(); self.image134 = nil; end;
        if self.label360 ~= nil then self.label360:destroy(); self.label360 = nil; end;
        if self.image219 ~= nil then self.image219:destroy(); self.image219 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.Arma1 ~= nil then self.Arma1:destroy(); self.Arma1 = nil; end;
        if self.label424 ~= nil then self.label424:destroy(); self.label424 = nil; end;
        if self.Arma41 ~= nil then self.Arma41:destroy(); self.Arma41 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image121 ~= nil then self.image121:destroy(); self.image121 = nil; end;
        if self.label402 ~= nil then self.label402:destroy(); self.label402 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.image189 ~= nil then self.image189:destroy(); self.image189 = nil; end;
        if self.label471 ~= nil then self.label471:destroy(); self.label471 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.image168 ~= nil then self.image168:destroy(); self.image168 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.rclListaNPC ~= nil then self.rclListaNPC:destroy(); self.rclListaNPC = nil; end;
        if self.image73 ~= nil then self.image73:destroy(); self.image73 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.label479 ~= nil then self.label479:destroy(); self.label479 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.troca ~= nil then self.troca:destroy(); self.troca = nil; end;
        if self.rclEquip ~= nil then self.rclEquip:destroy(); self.rclEquip = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.label371 ~= nil then self.label371:destroy(); self.label371 = nil; end;
        if self.label467 ~= nil then self.label467:destroy(); self.label467 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.FichaPrincipal ~= nil then self.FichaPrincipal:destroy(); self.FichaPrincipal = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label408 ~= nil then self.label408:destroy(); self.label408 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.Armadura48 ~= nil then self.Armadura48:destroy(); self.Armadura48 = nil; end;
        if self.image72 ~= nil then self.image72:destroy(); self.image72 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.image71 ~= nil then self.image71:destroy(); self.image71 = nil; end;
        if self.label436 ~= nil then self.label436:destroy(); self.label436 = nil; end;
        if self.label449 ~= nil then self.label449:destroy(); self.label449 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.LojaCorpoACorpo ~= nil then self.LojaCorpoACorpo:destroy(); self.LojaCorpoACorpo = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image119 ~= nil then self.image119:destroy(); self.image119 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.label391 ~= nil then self.label391:destroy(); self.label391 = nil; end;
        if self.labSoma5 ~= nil then self.labSoma5:destroy(); self.labSoma5 = nil; end;
        if self.label442 ~= nil then self.label442:destroy(); self.label442 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label415 ~= nil then self.label415:destroy(); self.label415 = nil; end;
        if self.label461 ~= nil then self.label461:destroy(); self.label461 = nil; end;
        if self.label394 ~= nil then self.label394:destroy(); self.label394 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.CorpoACorpo33 ~= nil then self.CorpoACorpo33:destroy(); self.CorpoACorpo33 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.image111 ~= nil then self.image111:destroy(); self.image111 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label432 ~= nil then self.label432:destroy(); self.label432 = nil; end;
        if self.image98 ~= nil then self.image98:destroy(); self.image98 = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.scrollBox13 ~= nil then self.scrollBox13:destroy(); self.scrollBox13 = nil; end;
        if self.image227 ~= nil then self.image227:destroy(); self.image227 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.Armadura47 ~= nil then self.Armadura47:destroy(); self.Armadura47 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.image156 ~= nil then self.image156:destroy(); self.image156 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.ApresentaLoja ~= nil then self.ApresentaLoja:destroy(); self.ApresentaLoja = nil; end;
        if self.CorpoACorpo37 ~= nil then self.CorpoACorpo37:destroy(); self.CorpoACorpo37 = nil; end;
        if self.image204 ~= nil then self.image204:destroy(); self.image204 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.image138 ~= nil then self.image138:destroy(); self.image138 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.image163 ~= nil then self.image163:destroy(); self.image163 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.image141 ~= nil then self.image141:destroy(); self.image141 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.Conducao_Circunstancia ~= nil then self.Conducao_Circunstancia:destroy(); self.Conducao_Circunstancia = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.image115 ~= nil then self.image115:destroy(); self.image115 = nil; end;
        if self.image164 ~= nil then self.image164:destroy(); self.image164 = nil; end;
        if self.image182 ~= nil then self.image182:destroy(); self.image182 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.CorpoACorpo ~= nil then self.CorpoACorpo:destroy(); self.CorpoACorpo = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.Arma24 ~= nil then self.Arma24:destroy(); self.Arma24 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.image150 ~= nil then self.image150:destroy(); self.image150 = nil; end;
        if self.DescVanDes9 ~= nil then self.DescVanDes9:destroy(); self.DescVanDes9 = nil; end;
        if self.label426 ~= nil then self.label426:destroy(); self.label426 = nil; end;
        if self.rclAtaque ~= nil then self.rclAtaque:destroy(); self.rclAtaque = nil; end;
        if self.Arma53 ~= nil then self.Arma53:destroy(); self.Arma53 = nil; end;
        if self.DescCircunstancia2 ~= nil then self.DescCircunstancia2:destroy(); self.DescCircunstancia2 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.CorpoACorpo29 ~= nil then self.CorpoACorpo29:destroy(); self.CorpoACorpo29 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label452 ~= nil then self.label452:destroy(); self.label452 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.image185 ~= nil then self.image185:destroy(); self.image185 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label387 ~= nil then self.label387:destroy(); self.label387 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image86 ~= nil then self.image86:destroy(); self.image86 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.NPC_Equip ~= nil then self.NPC_Equip:destroy(); self.NPC_Equip = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.image114 ~= nil then self.image114:destroy(); self.image114 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.colocarDinheiro ~= nil then self.colocarDinheiro:destroy(); self.colocarDinheiro = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label370 ~= nil then self.label370:destroy(); self.label370 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rclNote ~= nil then self.rclNote:destroy(); self.rclNote = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.image160 ~= nil then self.image160:destroy(); self.image160 = nil; end;
        if self.label398 ~= nil then self.label398:destroy(); self.label398 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label438 ~= nil then self.label438:destroy(); self.label438 = nil; end;
        if self.Armadura53 ~= nil then self.Armadura53:destroy(); self.Armadura53 = nil; end;
        if self.niveldoPlayer ~= nil then self.niveldoPlayer:destroy(); self.niveldoPlayer = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label369 ~= nil then self.label369:destroy(); self.label369 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.label460 ~= nil then self.label460:destroy(); self.label460 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.image224 ~= nil then self.image224:destroy(); self.image224 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label473 ~= nil then self.label473:destroy(); self.label473 = nil; end;
        if self.label395 ~= nil then self.label395:destroy(); self.label395 = nil; end;
        if self.CorpoACorpo26 ~= nil then self.CorpoACorpo26:destroy(); self.CorpoACorpo26 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.label416 ~= nil then self.label416:destroy(); self.label416 = nil; end;
        if self.label453 ~= nil then self.label453:destroy(); self.label453 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.Arma42 ~= nil then self.Arma42:destroy(); self.Arma42 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.image212 ~= nil then self.image212:destroy(); self.image212 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.DescVanDes7 ~= nil then self.DescVanDes7:destroy(); self.DescVanDes7 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.DescCircunstancia5 ~= nil then self.DescCircunstancia5:destroy(); self.DescCircunstancia5 = nil; end;
        if self.PopAnimal ~= nil then self.PopAnimal:destroy(); self.PopAnimal = nil; end;
        if self.image128 ~= nil then self.image128:destroy(); self.image128 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.CorpoACorpo30 ~= nil then self.CorpoACorpo30:destroy(); self.CorpoACorpo30 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.label354 ~= nil then self.label354:destroy(); self.label354 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.Arma4 ~= nil then self.Arma4:destroy(); self.Arma4 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.image173 ~= nil then self.image173:destroy(); self.image173 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label405 ~= nil then self.label405:destroy(); self.label405 = nil; end;
        if self.image203 ~= nil then self.image203:destroy(); self.image203 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.Arma47 ~= nil then self.Arma47:destroy(); self.Arma47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label463 ~= nil then self.label463:destroy(); self.label463 = nil; end;
        if self.image222 ~= nil then self.image222:destroy(); self.image222 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.image202 ~= nil then self.image202:destroy(); self.image202 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.image174 ~= nil then self.image174:destroy(); self.image174 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.PopExp ~= nil then self.PopExp:destroy(); self.PopExp = nil; end;
        if self.label441 ~= nil then self.label441:destroy(); self.label441 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label476 ~= nil then self.label476:destroy(); self.label476 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.image69 ~= nil then self.image69:destroy(); self.image69 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.frmMochila ~= nil then self.frmMochila:destroy(); self.frmMochila = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.image87 ~= nil then self.image87:destroy(); self.image87 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.Arma14 ~= nil then self.Arma14:destroy(); self.Arma14 = nil; end;
        if self.label407 ~= nil then self.label407:destroy(); self.label407 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.Arma27 ~= nil then self.Arma27:destroy(); self.Arma27 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.Arma11 ~= nil then self.Arma11:destroy(); self.Arma11 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.image162 ~= nil then self.image162:destroy(); self.image162 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.label392 ~= nil then self.label392:destroy(); self.label392 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.image194 ~= nil then self.image194:destroy(); self.image194 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.image130 ~= nil then self.image130:destroy(); self.image130 = nil; end;
        if self.label421 ~= nil then self.label421:destroy(); self.label421 = nil; end;
        if self.Arma10 ~= nil then self.Arma10:destroy(); self.Arma10 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.label443 ~= nil then self.label443:destroy(); self.label443 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.Inventario ~= nil then self.Inventario:destroy(); self.Inventario = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.image167 ~= nil then self.image167:destroy(); self.image167 = nil; end;
        if self.label373 ~= nil then self.label373:destroy(); self.label373 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.image199 ~= nil then self.image199:destroy(); self.image199 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.frmDZ_Ficha3_svg ~= nil then self.frmDZ_Ficha3_svg:destroy(); self.frmDZ_Ficha3_svg = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.label388 ~= nil then self.label388:destroy(); self.label388 = nil; end;
        if self.label451 ~= nil then self.label451:destroy(); self.label451 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.image186 ~= nil then self.image186:destroy(); self.image186 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.Conducao_Equipamentos ~= nil then self.Conducao_Equipamentos:destroy(); self.Conducao_Equipamentos = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label431 ~= nil then self.label431:destroy(); self.label431 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.Arma32 ~= nil then self.Arma32:destroy(); self.Arma32 = nil; end;
        if self.frmDZ_NPC_svg ~= nil then self.frmDZ_NPC_svg:destroy(); self.frmDZ_NPC_svg = nil; end;
        if self.Arma13 ~= nil then self.Arma13:destroy(); self.Arma13 = nil; end;
        if self.label363 ~= nil then self.label363:destroy(); self.label363 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label397 ~= nil then self.label397:destroy(); self.label397 = nil; end;
        if self.label406 ~= nil then self.label406:destroy(); self.label406 = nil; end;
        if self.label429 ~= nil then self.label429:destroy(); self.label429 = nil; end;
        if self.label470 ~= nil then self.label470:destroy(); self.label470 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.image218 ~= nil then self.image218:destroy(); self.image218 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.Armadura51 ~= nil then self.Armadura51:destroy(); self.Armadura51 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.label483 ~= nil then self.label483:destroy(); self.label483 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.label423 ~= nil then self.label423:destroy(); self.label423 = nil; end;
        if self.Arma52 ~= nil then self.Arma52:destroy(); self.Arma52 = nil; end;
        if self.label472 ~= nil then self.label472:destroy(); self.label472 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.label368 ~= nil then self.label368:destroy(); self.label368 = nil; end;
        if self.label419 ~= nil then self.label419:destroy(); self.label419 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDZ_Ficha()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDZ_Ficha();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDZ_Ficha = {
    newEditor = newfrmDZ_Ficha, 
    new = newfrmDZ_Ficha, 
    name = "frmDZ_Ficha", 
    dataType = "DeadZoneRPG2.0", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha 3.0 Dead Zone", 
    description=""};

frmDZ_Ficha = _frmDZ_Ficha;
Firecast.registrarForm(_frmDZ_Ficha);
Firecast.registrarDataType(_frmDZ_Ficha);

return _frmDZ_Ficha;
