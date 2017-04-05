//+------------------------------------------------------------------+
//|                                                   martingale.mqh |
//|                                                         cymatics |
//|                                          https://www.cymatics.cc |
//+------------------------------------------------------------------+
#property copyright "cymatics"
#property link      "https://www.cymatics.cc"
#property version   "1.00"
#property strict

#include <quant/mEA.mqh>

class martingale : public mEA
  {
private:

public:
   martingale(string magic);
   ~martingale();
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
martingale::martingale(string m):mEA(m)
  {
   Print(__FUNCTION__+": "+magic);
  }

martingale::~martingale()
  {
  Print(__FUNCTION__);
  }

int martingale::update()
  {
  Print(__FUNCTION__+": "+magic);
  return 0;
  }
  
int martingale::openBuy()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::openSell()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::closeAll()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::closeBuy()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::closeSell()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::modifyOrder()
  {
  Print(__FUNCTION__);
  return 0;
  }
