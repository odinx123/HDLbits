# HDLbits

### 紀錄條件
- 看到一些比較特殊的寫法(不知道的)會記錄下來。
- quartus如果要有sdo檔案: Assignments/settings/More EDA Netlist Writer Settings/Generate functional simulation netlist -> off  <font color="red">旁邊的run gate-level simulation不要打勾</font>

<br>

### 小筆記

#### latch
- 參考: https://ithelp.ithome.com.tw/articles/10273468
- 在循序邏輯中（clock觸發），不完整的 if-else 並不會生成 latch，因為 register 具有儲存前態的功能，並只有在正負緣才會改變值。
- 使變數等於自己時或是判斷元素有自己時，因為會用到變數的前態而自動生成 latch 來幫你儲存。  **# 組合邏輯**
  - 如果輸出沒有非常及時，可以延後一個 clk 將值鎖在 register 內。
- always 觸發條件不完整: 等號右邊的所有變數或判斷元素都應蓋列入 alway 敏感列表中。

<br>

#### 撰寫可綜合電路應該要保持的幾項原則
- 參考: https://ithelp.ithome.com.tw/articles/10274534
- 所有的初始化動作都應該靠 reset 或是 reset_n 來達成，所以宣告 reg 時也不會先給初始值，那是沒有必要的。
- 整體電路應該為同步式設計，意思是 always 內的觸發信號應當只有 clk 以及 reset 信號。
- 對同一個變數不可同時使用 blocking 及 non-blocking。
  - 組合邏輯用 blocking，而循序邏輯用 non-blocking，依照此原則也不會誤用~
- 不該在程式內使用 delay 語句（ex: #100）。
- 同一個變數不可由兩個不同的 always 來賦值。 **# 要注意**
- 同一個變數不應該由多個不同的 clk 來做觸發【也就是敏感列表變數】。

<br>

#### dff時序
- 參考: https://blog.csdn.net/qq_24916381/article/details/100529409
![image](https://github.com/odinx123/HDLbits/assets/68193880/ee9d5aa6-a478-40e7-84e6-ec9823d8923a)
- 當clk為上升沿那一時刻，d的值還是低電平，因此q的值為低電平； 並且下降沿不會引起q值的變化，因此q值每個週期都是低電平。
