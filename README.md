# HDLbits

### 紀錄條件
- 看到一些比較特殊的寫法(不知道的)會記錄下來。

### 小筆記

## latch
- 參考: https://ithelp.ithome.com.tw/articles/10273468
- 在循序邏輯中（clock觸發），不完整的 if-else 並不會生成 latch，因為 register 具有儲存前態的功能，並只有在正負緣才會改變值。
- 使變數等於自己時或是判斷元素有自己時，因為會用到變數的前態而自動生成 latch 來幫你儲存。  # 組合邏輯
  - 如果輸出沒有非常及時，可以延後一個 clk 將值鎖在 register 內。
- always 觸發條件不完整: 等號右邊的所有變數或判斷元素都應蓋列入 alway 敏感列表中。
