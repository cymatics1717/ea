//+------------------------------------------------------------------+
//|                                                          eEA.mqh |
//|                                                         cymatics |
//|                                          https://www.cymatics.cc |
//+------------------------------------------------------------------+
#property copyright "cymatics"
#property link      "https://www.cymatics.cc"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
class mEA{

public:
   string magic;
   
   mEA(string magic);
   virtual ~mEA();
   virtual int update();
   virtual int openBuy();
   virtual int openSell();
   virtual int closeAll();
   virtual int modifyOrder();
   
   virtual int closeBuy();
   virtual int closeSell();

};

mEA::mEA(string m){
   magic = m;
   Print(__FUNCTION__+": "+magic);
}
mEA::~mEA(){
   Print(__FUNCTION__);
}

int mEA::openBuy(){
   Print(__FUNCTION__);
   return 0;
}

int mEA::openSell(){
   Print(__FUNCTION__);
   return 0;
}

int mEA::closeAll(){
   Print(__FUNCTION__);
   return 0;
}

int mEA::closeBuy(){
   Print(__FUNCTION__);
   return 0;
}

int mEA::closeSell(){
   Print(__FUNCTION__);
   return 0;
}

int mEA::update(){
   Print(__FUNCTION__+": "+magic);
   return 0;
}


int mEA::modifyOrder(){
   Print(__FUNCTION__);
   return 0;
}
