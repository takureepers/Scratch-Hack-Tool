@ECHO OFF
title Scratch�\�z�V�X�e��
color 2

start README.txt

:INPUT_START
ECHO +-------------------------------------------------------+
ECHO  �쐬��̃p�X����͂��Ă��������B
ECHO +-------------------------------------------------------+
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
:INPUT_CONF
ECHO +-------------------------------------------------------+
ECHO  ���͂���������[%INPUT_STR%]�ł�낵���ł����H (2GB�قǂ̋󂫗e�ʂ��K�v�ƂȂ�܂��B)
ECHO �iY / N�j
ECHO +-------------------------------------------------------+
SET CONF_SELECT=
SET /P CONF_SELECT=
 
IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :INPUT_START
 
:INPUT_END
cd %INPUT_STR%
ECHO +-------------------------------------------------------+
ECHO  ���s���Ă��܂�...
ECHO +-------------------------------------------------------+
git clone --depth 1 https://github.com/llk/scratch-vm.git
git clone --depth 1 https://github.com/llk/scratch-gui.git
ECHO +-------------------------------------------------------+
ECHO  �C���X�g�[�������B�\�z���܂�....
ECHO +-------------------------------------------------------+
cd scratch-vm
npm install
npm link
cd ../scratch-gui
npm install
npm link scratch-vm
ECHO +-------------------------------------------------------+
ECHO  �ŏI�i�K�ł��B�r���h���Ă��܂�...
ECHO +-------------------------------------------------------+
npm start
ECHO +-------------------------------------------------------+
ECHO  ���ׂĂ��I�����܂����Blocalhost:8601���J���܂��B
ECHO +-------------------------------------------------------+
start https://localhost:8601
pause
stop