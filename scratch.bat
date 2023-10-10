@ECHO OFF
title Scratch構築システム
color 2

start README.txt

:INPUT_START
ECHO +-------------------------------------------------------+
ECHO  作成先のパスを入力してください。
ECHO +-------------------------------------------------------+
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
:INPUT_CONF
ECHO +-------------------------------------------------------+
ECHO  入力した文字は[%INPUT_STR%]でよろしいですか？ (2GBほどの空き容量が必要となります。)
ECHO （Y / N）
ECHO +-------------------------------------------------------+
SET CONF_SELECT=
SET /P CONF_SELECT=
 
IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :INPUT_START
 
:INPUT_END
cd %INPUT_STR%
ECHO +-------------------------------------------------------+
ECHO  実行しています...
ECHO +-------------------------------------------------------+
git clone --depth 1 https://github.com/llk/scratch-vm.git
git clone --depth 1 https://github.com/llk/scratch-gui.git
ECHO +-------------------------------------------------------+
ECHO  インストール完了。構築します....
ECHO +-------------------------------------------------------+
cd scratch-vm
npm install
npm link
cd ../scratch-gui
npm install
npm link scratch-vm
ECHO +-------------------------------------------------------+
ECHO  最終段階です。ビルドしています...
ECHO +-------------------------------------------------------+
npm start
ECHO +-------------------------------------------------------+
ECHO  すべてが終了しました。localhost:8601を開いてください。
ECHO +-------------------------------------------------------+
