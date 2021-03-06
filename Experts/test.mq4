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

string comments = "multiple EAs";
int EAMagic = 314;
extern int idx = 0;

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
   if(checkStatus()>0) return;

   if(ea[idx]){
      ea[idx].update();
      //买入信号
      if(ea[idx].sig4openBuy())  openBuy();
      //卖出信号
      if(ea[idx].sig4openSell()) openSell();
      //修改信号，修改止盈止损
      if(ea[idx].sig4modifyOrder()) modifyOrder();
      //关仓信号
      if(ea[idx].sig4closeAll()){
         for(int cnt=OrdersTotal()-1;cnt>=0;--cnt)
         {
            if(!OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES)) continue;
            if(OrderType()<=OP_SELL &&  OrderSymbol()==Symbol()){
               closeOrder();
            }
         }
      } 
   }
}

int checkStatus(){
   
   if(!IsDemo()) 
      return 1;
   if(!IsConnected()) {
      Print("No connection");
      return 2;
    }
   if(!IsExpertEnabled()) {
      Print("Expert Advisors are not Enabled.");
      return 3;
   }
   
   if(IsTradeContextBusy()) {
      Print("Trade context is busy. Please wait"); 
      return 4;
   }
   if(!IsTradeAllowed()) {
      Print("Trade is not allowed");
      return 5;
   }
   if(AccountFreeMargin()<=0) {
      Print("No more money.");
      return 6;
   }
   //if(!IsTesting()) return ;
   
   if(Bars<100) {
      Print("bars less than 100");
      return 7;
   }

   return 0;
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
  //PrintFormat("%s: id=%d lparam=%ld dparam=%lf sparam=%s\n", __FUNCSIG__,id,lparam,dparam,sparam);   
  }

void showError()
  {
   int err=GetLastError();
   if(err!=ERR_NO_ERROR) Print("Error: ",ErrorDescription(err)); 
   
  }
    
void openBuy()
{
   double Lots = 0.01;
   double TakeProfit = 50;
   int ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,3,0,Ask+TakeProfit*Point,comments+"Buy",EAMagic,0,Green);
   if(ticket>0)
     {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES))
         Print("BUY order opened : ",OrderOpenPrice());
     }
   else
      showError();
}

void openSell()
{
   double Lots = 0.01;
   double TakeProfit = 50;
   int ticket=OrderSend(Symbol(),OP_SELL,Lots,Bid,3,0,Bid-TakeProfit*Point,comments+"Sell",EAMagic,0,Red);
   if(ticket>0)
     {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES))
         Print("SELL order opened : ",OrderOpenPrice());
     }
   else
      showError();
}

void modifyOrder()
{
   double TrailingStop  = 30;
   if(!OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*TrailingStop,OrderTakeProfit(),0,Green)) showError();
}

void closeOrder()
{
   if(OrderType()==OP_BUY)
      if(!OrderClose(OrderTicket(),OrderLots(),Bid,3,Violet)) showError();
   if(OrderType()==OP_SELL)
      if(!OrderClose(OrderTicket(),OrderLots(),Ask,3,Violet)) showError();
}

