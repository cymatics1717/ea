//+------------------------------------------------------------------+
//|                                                         test.mq4 |
//|                                                         cymatics |
//|                                          https://www.cymatics.cc |
//+------------------------------------------------------------------+
#property copyright "cymatics"
#property link      "https://www.cymatics.cc"
#property version   "1.00"
#property strict

#include <stderror.mqh> 
#include <stdlib.mqh> 

#include <quant/martingale.mqh>
#include <quant/upadown.mqh>

#define N 3
mEA *ea[N]={NULL,};

int OnInit()
{
   ea[0] = new martingale("马丁策略1");
   ea[1] = new upadown("上上下下");
   ea[2] = new martingale("马丁策略2");
   
  //EventSetTimer(5);
  
  return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
   for(int i=0;i<N;++i){
      delete ea[i];
   }
   EventKillTimer();
}

void OnTick()
{   
  if(!IsDemo()) return;
  
   if(!IsConnected()) {
      Print("No connection");
      return;
    }
   if(!IsExpertEnabled()) {
      Print("Expert Advisors are not Enabled.");
      return;
   }
   
   if(IsTradeContextBusy()) {
      Print("Trade context is busy. Please wait"); 
      return;
   }
   if(!IsTradeAllowed()) {
      Print("Trade is not allowed");
      return;
   }
   if(AccountFreeMargin()<=0) {
      Print("No more money.");
      return;
   }
  
   //if(!IsTesting()) return ;
  
   if(Bars<100) {
      Print("bars less than 100");
      return;
   }

   int i =1;
   if(ea[i]){
         ea[i].update();
         ea[i].openBuy();
         ea[i].openBuy();
         ea[i].modifyOrder();
         ea[i].closeAll();
   }

   ShowError();
 }


void OnTimer()
  {
   //Print(__FUNCSIG__+"   "+TimeCurrent());    
  }

double OnTester()
  {
   double ret=0.0;
   return(ret);
  }

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//Print(__FUNCSIG__); 
  PrintFormat("%s: id=%d lparam=%ld dparam=%lf sparam=%s\n", __FUNCSIG__,id,lparam,dparam,sparam);
  Print("We have no money. Free Margin = ",AccountFreeMargin());
     
  }

void ShowError()
  {
   int err=GetLastError();
   if(err!=ERR_NO_ERROR) Print("Error: ",ErrorDescription(err)); 
   
  }