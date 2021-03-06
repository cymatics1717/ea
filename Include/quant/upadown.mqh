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
   int tag;
public:
   upadown(string magic);
   ~upadown();
   
   virtual int update();
   virtual int sig4openBuy();
   virtual int sig4openSell();
   virtual int sig4closeAll();
   virtual int sig4modifyOrder();
   
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
upadown::upadown(string m):mEA(m)
  {
   Print(__FUNCTION__+": "+magic);
   tag = 1;
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

int upadown::sig4openBuy()
{
   Print(__FUNCTION__);
   if(OrdersTotal() == 10) tag = 0; 
   return tag;
}


int upadown::sig4openSell()
{
   Print(__FUNCTION__);
   if(OrdersTotal() == 10) tag = 0; 
   return tag;
}

int upadown::sig4closeAll()
{
   Print(__FUNCTION__);
   if(OrdersTotal() == 0) tag = 1; 
   return 1-tag;
}

int upadown::sig4modifyOrder()
{
   Print(__FUNCTION__);
   return 0;
}
