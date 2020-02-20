unit acVars;

interface

uses
     JsonDataObjects,

     //
     Classes,Graphics;


var
     //
     gjoModules     : TJsonObject;      //�������ӵ�ģ��
     gjoProject     : TJsonObject;      //��ǰ����

     //----------------------------��������-------------------------------------------------------//
     gsMainDir      : string;      //ϵͳ�ĳ�ʼ����Ŀ¼


     //----------------------------�����---------------------------------------------------------//
     giCurCodeType  : Integer;
     //grBlocks       : TWWBlocks;   //���г��������
     giOldBlockID   : Integer=-1;  //�����ϴεĳ��������

     //----------------------------�༭������-----------------------------------------------------//
     giTabStops     : Integer=5;   //����������
     giRightMargin  : Integer=80;  //�����ұ߽���ʾλ��

     //----------------------------����ͼ����-----------------------------------------------------//
     giColor_Line   : TColor;      //����ͼ���ߺ���ɫ
     giColor_If     : TColor;      //�жϿ����ɫ
     giColor_Fill   : TColor;      //��������ɫ
     giColor_Try    : TColor;      //Try�����ɫ
     giColor_Select : TColor;      //ѡ��ʱ����ɫ
     giColor_Font   : TColor;      //������ɫ
     giColor_Flow   : TColor=clGreen;   //��̬���̵���ɫ
     giFontName     : String='Small Fonts';  //��������
     giFontSize     : Byte=6;      //�����С,Ĭ��Ϊ6
     giBaseWidth    : Integer=60;  //������Ŀ��ȵ�һ��(Ϊ�˱��ڻ�ͼ����)
     giBaseHeight   : Integer=20;  //������ĸ߶�
     giSpaceH       : Integer=10;  //������
     giSpaceV       : Integer=20;  //������
     giImgWidth     : Integer=200; //����ͼ��ԭʼ���͸�,��Ҫ��������ͼ����
     giImgHeight    : Integer=200;

     //grConfig       : TWWConfig;   //��������ͼ������
     //grOption       : TGenOption;

     //
     giMaxWidth     : Integer=4000;//ͼƬ�����ȣ����ڽ���ڴ治�������
     giMaxHeight    : Integer=8000;//ͼƬ���߶�

     gbRegistered   : Boolean=True;

const
     gsName         : string = 'AutoCode - Python';
     gsHomePage     : String = 'http://www.web0000.com';
     gsOrderPage    : String = 'http://www.shareit.com/product.html?productid=300544745';
     gsWebSite      : String = 'http://www.web0000.com';
     gsMail         : String = 'fenglinyushu@163.com';

implementation

end.