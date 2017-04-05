//+------------------------------------------------------------------+
//|                                                      upadown.mqh |
//|                                                         cymatics |
//|                                          https://www.cymatics.cc |
//+------------------------------------------------------------------+
#property copyright "cymatics"
#property link      "https://www.cymatics.cc"
#property version   "1.00"
#property strict

#include <quant/mEA.mqh>

class upadown : public mEA
  {
private:

public:
   upadown(string magic);
   ~upadown();
   //更新参数
   virtual int update();
   virtual int openBuy();
   virtual int openSell();
   virtual int closeAll();
   virtual int modifyOrder();
   
   virtual int closeBuy();
   virtual int closeSell();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
upadown::upadown(string m):mEA(m)
  {
   Print(__FUNCTION__+": "+magic);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
upadown::~upadown()
  {
  Print(__FUNCSIG__);
  }
//+------------------------------------------------------------------+

int upadown::update()
{
   Print(__FUNCTION__+": "+magic+"Ask:"+Ask);
   return 0;
}

int upadown::openBuy()
{
   Print(__FUNCTION__);
   return 0;
}


int upadown::openSell()
{
   Print(__FUNCTION__);
   return 0;
}

int upadown::closeAll()
{
   Print(__FUNCTION__);
   return 0;
}

int upadown::closeBuy()
{
   Print(__FUNCTION__);
   return 0;
}


int upadown::closeSell()
{
   Print(__FUNCTION__);
   return 0;
}


int upadown::modifyOrder()
{
   Print(__FUNCTION__);
   return 0;
}
