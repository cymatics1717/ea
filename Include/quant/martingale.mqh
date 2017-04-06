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
   virtual int sig4openBuy();
   virtual int sig4openSell();
   virtual int sig4closeAll();
   virtual int sig4modifyOrder();

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
  
int martingale::sig4openBuy()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::sig4openSell()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::sig4closeAll()
  {
  Print(__FUNCTION__);
  return 0;
  }

int martingale::sig4modifyOrder()
  {
  Print(__FUNCTION__);
  return 0;
  }
