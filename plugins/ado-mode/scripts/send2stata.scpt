FasdUAS 1.101.10   ��   ��    k             l      ��  ��    ( " version 2.1.2 - January 24, 2016      � 	 	 D   v e r s i o n   2 . 1 . 2   -   J a n u a r y   2 4 ,   2 0 1 6     
  
 l      ��  ��    , & sends contents of clipboard to Stata      �   L   s e n d s   c o n t e n t s   o f   c l i p b o a r d   t o   S t a t a        l      ��  ��    U O allows running from command window, as a temporary do-file or via a menu item      �   �   a l l o w s   r u n n i n g   f r o m   c o m m a n d   w i n d o w ,   a s   a   t e m p o r a r y   d o - f i l e   o r   v i a   a   m e n u   i t e m        l      ��  ��    N H applescript bug: single bar in front of "include" causes compile error      �   �   a p p l e s c r i p t   b u g :   s i n g l e   b a r   i n   f r o n t   o f   " i n c l u d e "   c a u s e s   c o m p i l e   e r r o r        l      ��  ��    W Q args are: { "command" | "menu" | "dofile" || "include" } [ name-of-tmp-dofile ]      �   �   a r g s   a r e :   {   " c o m m a n d "   |   " m e n u "   |   " d o f i l e "   | |   " i n c l u d e "   }   [   n a m e - o f - t m p - d o f i l e   ]        i        !   I     �� "��
�� .aevtoappnull  �   � **** " o      ���� 0 args  ��   ! k    � # #  $ % $ l     �� & '��   &  - initializations    ' � ( ( " -   i n i t i a l i z a t i o n s %  ) * ) q       + + �� ,�� 0 numargs numArgs , �� -�� 0 pasteme pasteMe - �� .�� 0 dothis doThis . ������ 0 	tmpdofile 	tmpDoFile��   *  / 0 / q       1 1 �� 2�� 0 howmanystatas howManyStatas 2 �� 3�� 0 	thestatas 	theStatas 3 �� 4�� 0 thestataname theStataName 4 ������ "0 thestataversion theStataVersion��   0  5 6 5 q       7 7 �� 8�� 0 	olddelims 	oldDelims 8 ������ 0 theosxversion theOSXVersion��   6  9 : 9 q       ; ; ������ $0 defaulttmpdofile defaultTmpDoFile��   :  < = < r      > ? > m      @ @ � A A  f e e d S t a t a . d o ? o      ���� $0 defaulttmpdofile defaultTmpDoFile =  B C B q     D D ������ 0 uiok UIOK��   C  E F E l   �� G H��   G . ( first check that UI scripting will work    H � I I P   f i r s t   c h e c k   t h a t   U I   s c r i p t i n g   w i l l   w o r k F  J K J O     L M L Z     N O�� P N 1    ��
�� 
uien O r     Q R Q m    ��
�� boovtrue R o      ���� 0 uiok UIOK��   P r     S T S m    ��
�� boovfals T o      ���� 0 uiok UIOK M m     U U�                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   K  V�� V l  � W X Y W Z   � Z [�� \ Z H     ] ] o    ���� 0 uiok UIOK [ O    k ^ _ ^ k   # j ` `  a b a r   # , c d c c   # * e f e l  # ( g���� g n  # ( h i h I   $ (�������� 0 getosxversion getOSXversion��  ��   i  f   # $��  ��   f m   ( )��
�� 
long d o      ���� 0 theosxversion theOSXVersion b  j�� j Z   - j k l�� m k B   - 0 n o n o   - .���� 0 theosxversion theOSXVersion o m   . /���� 	 l k   3 K p p  q r q I  3 8������
�� .miscactvnull��� ��� null��  ��   r  s t s r   9 A u v u 4   9 =�� w
�� 
xppb w m   ; < x x � y y H c o m . a p p l e . p r e f e r e n c e . u n i v e r s a l a c c e s s v 1   = @��
�� 
xpcp t  z�� z I  B K�� { |
�� .sysodlogaskr        TEXT { m   B C } } � ~ ~ � W h e n   S y s t e m   P r e f e r e n c e s   o p e n s ,   b e   s u r e   t h a t   ' E n a b l e   a c c e s s   f o r   a s s i s t i v e   d e v i c e s '   i s   c h e c k e d ,   t h e n   t r y   a g a i n . | �� ��
�� 
btns  J   D G � �  ��� � m   D E � � � � �  O K��  ��  ��  ��   m k   N j � �  � � � I  N S������
�� .miscactvnull��� ��� null��  ��   �  � � � r   T \ � � � 4   T X�� �
�� 
xppb � m   V W � � � � � : c o m . a p p l e . p r e f e r e n c e . s e c u r i t y � 1   X [��
�� 
xpcp �  ��� � I  ] j�� � �
�� .sysodlogaskr        TEXT � m   ] ` � � � � �j W h e n   t h e   S e c u r i t y   &   P r i v a c y   p r e f e r e n c e   p a n e   o p e n s ,   s e l e c t   t h e   P r i v a c y   t a b ,   t h e n   s e l e c t   t h e   A c c e s s i b i l i t y   i t e m   a n d   b e   s u r e   y o u r   v e r s i o n   o f   E m a c s   i s   c h e c k e d .   W h e n   f i n i s h e d ,   t r y   a g a i n . � �� ���
�� 
btns � J   a f � �  ��� � m   a d � � � � �  O K��  ��  ��  ��   _ m      � ��                                                                                  sprf  alis    ~  Macintosh HD               �ԛFH+  ���System Preferences.app                                         �����N�        ����  	                Applications    ��*�      ���    ���  1Macintosh HD:Applications: System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��   \ k   n� � �  � � � l  n n�� � ���   � ' ! check proper number of arguments    � � � � B   c h e c k   p r o p e r   n u m b e r   o f   a r g u m e n t s �  � � � r   n u � � � l  n s ����� � n   n s � � � 1   o s��
�� 
leng � o   n o���� 0 args  ��  ��   � o      ���� 0 numargs numArgs �  � � � Q   v � � � � � k   y � � �  � � � r   y � � � � n   y  � � � 4   z �� �
�� 
cobj � m   } ~����  � o   y z���� 0 args   � o      ���� 0 dothis doThis �  � � � Z   � � � ����� � H   � � � � E   � � � � � J   � � � �  � � � m   � � � � � � �  c o m m a n d �  � � � m   � � � � � � �  m e n u �  � � � m   � � � � � � �  d o f i l e �  ��� � m   � � � � � � �  i n c l u d e��   � o   � ����� 0 dothis doThis � n  � � � � � I   � ��������� 0 badfirstarg badFirstArg��  ��   �  f   � ���  ��   �  ��� � Z   � � � ��� � � ?   � � � � � o   � ����� 0 numargs numArgs � m   � �����  � k   � � � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 args   � o      ���� 0 	tmpdofile 	tmpDoFile �  ��� � Z   � � � ����� � =   � � � � � o   � ����� 0 	tmpdofile 	tmpDoFile � m   � � � � � � �   � r   � � � � � o   � ����� $0 defaulttmpdofile defaultTmpDoFile � o      ���� 0 	tmpdofile 	tmpDoFile��  ��  ��  ��   � r   � � � � � o   � ����� $0 defaulttmpdofile defaultTmpDoFile � o      ���� 0 	tmpdofile 	tmpDoFile��   � R      ������
�� .ascrerr ****      � ****��  ��   � l  � � � � � � n  � � � � � I   � ��������� 0 badfirstarg badFirstArg��  ��   �  f   � � �   no arguments    � � � �    n o   a r g u m e n t s �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � U O grab clipboard, strip totally blank lines, to check if there is anything to do    � � � � �   g r a b   c l i p b o a r d ,   s t r i p   t o t a l l y   b l a n k   l i n e s ,   t o   c h e c k   i f   t h e r e   i s   a n y t h i n g   t o   d o �  � � � l  � ��� � ���   � 9 3   Aside: perhaps this should be on the emacs side?    � � � � f       A s i d e :   p e r h a p s   t h i s   s h o u l d   b e   o n   t h e   e m a c s   s i d e ? �  � � � l  � ��� � ���   � X R   for now it will stay here... could be wrong behavior, plus it is simpler to do     � � � � �       f o r   n o w   i t   w i l l   s t a y   h e r e . . .   c o u l d   b e   w r o n g   b e h a v i o r ,   p l u s   i t   i s   s i m p l e r   t o   d o   �  � � � l  � ��� � ���   �       in Applescript (!)    � �   .           i n   A p p l e s c r i p t   ( ! ) �  r   � � n  � � I   � ������� "0 stripblanklines stripBlankLines �� I  � �������
�� .JonsgClp****    ��� null��  ��  ��  ��    f   � � o      ���� 0 pasteme pasteMe 	
	 Z   ����� =   � � o   � ����� 0 pasteme pasteMe m   � � �   O   � � I  � ���
�� .sysodlogaskr        TEXT m   � � � , N o t h i n g   t o   s e n d   S t a t a ! ����
�� 
btns J   � � � m   � � �  C a n c e l�  ��   m   � ��                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��  
  l �~�}�|�~  �}  �|     l �{!"�{  ! \ V in the best of worlds, it would be possible to allow looping through the instances of   " �## �   i n   t h e   b e s t   o f   w o r l d s ,   i t   w o u l d   b e   p o s s i b l e   t o   a l l o w   l o o p i n g   t h r o u g h   t h e   i n s t a n c e s   o f  $%$ l �z&'�z  & 5 /   Stata to send the same code to each instance   ' �(( ^       S t a t a   t o   s e n d   t h e   s a m e   c o d e   t o   e a c h   i n s t a n c e% )*) O  +,+ r  -.- l /�y�x/ 6 010 2  �w
�w 
prcs1 E  232 1  �v
�v 
pnam3 m  44 �55 
 S t a t a�y  �x  . o      �u�u 0 	thestatas 	theStatas, m  66�                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  * 787 l �t�s�r�t  �s  �r  8 9:9 r  %;<; l #=�q�p= I #�o>�n
�o .corecnte****       ****> o  �m�m 0 	thestatas 	theStatas�n  �q  �p  < o      �l�l 0 howmanystatas howManyStatas: ?@? Z  &{AB�kCA = &)DED o  &'�j�j 0 howmanystatas howManyStatasE m  '(�i�i  B O  ,FFGF k  2EHH IJI I 27�h�g�f
�h .sysobeepnull��� ��� long�g  �f  J K�eK I 8E�dLM
�d .sysodlogaskr        TEXTL m  8;NN �OO " N o   S t a t a   r u n n i n g !M �cP�b
�c 
btnsP J  <AQQ R�aR m  <?SS �TT  C a n c e l�a  �b  �e  G m  ,/UU�                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �k  C k  I{VV WXW Z  IiYZ�`�_Y ?  IL[\[ o  IJ�^�^ 0 howmanystatas howManyStatas\ m  JK�]�] Z k  Oe]] ^_^ O  Oc`a` I Ub�\bc
�\ .sysodlogaskr        TEXTb m  UXdd �ee @ n o t h i n g   f o r   m u l t i p l e   s t a t a ' s   y e tc �[f�Z
�[ 
btnsf J  Y^gg h�Yh m  Y\ii �jj  C a n c e l�Y  �Z  a m  ORkk�                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  _ lml l dd�Xno�X  n : 4 Stata can use the same name for different processes   o �pp h   S t a t a   c a n   u s e   t h e   s a m e   n a m e   f o r   d i f f e r e n t   p r o c e s s e sm qrq l dd�Wst�W  s J D so... the it is impossible to cycle through Stata processes by name   t �uu �   s o . . .   t h e   i t   i s   i m p o s s i b l e   t o   c y c l e   t h r o u g h   S t a t a   p r o c e s s e s   b y   n a m er v�Vv l  dd�Uwx�U  w � � tell application "System Events"					set theStatas to (the file of every process whose name contains "Stata")				 end tell				repeat with aStata in theStatas				end repeat
				   x �yyj   t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 	 	 	 	 s e t   t h e S t a t a s   t o   ( t h e   f i l e   o f   e v e r y   p r o c e s s   w h o s e   n a m e   c o n t a i n s   " S t a t a " )  	 	 	 	   e n d   t e l l  	 	 	 	 r e p e a t   w i t h   a S t a t a   i n   t h e S t a t a s  	 	 	 	 e n d   r e p e a t 
 	 	 	 	�V  �`  �_  X z{z l jj�T|}�T  | : 4 know there is exactly one instance of Stata running   } �~~ h   k n o w   t h e r e   i s   e x a c t l y   o n e   i n s t a n c e   o f   S t a t a   r u n n i n g{ � l jj�S���S  �   can finally get to work   � ��� 0   c a n   f i n a l l y   g e t   t o   w o r k� ��R� O  j{��� r  nz��� l nx��Q�P� l nx��O�N� n  nx��� 1  tx�M
�M 
pnam� l nt��L�K� n  nt��� 4 ot�J�
�J 
cobj� m  rs�I�I � o  no�H�H 0 	thestatas 	theStatas�L  �K  �O  �N  �Q  �P  � o      �G�G 0 thestataname theStataName� m  jk���                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �R  @ ��� l ||�F�E�D�F  �E  �D  � ��� l ||�C���C  � $  Stata *must* be made active		   � ��� <   S t a t a   * m u s t *   b e   m a d e   a c t i v e 	 	� ��� O  |���� k  ���� ��� r  ����� l ����B�A� n  ����� 1  ���@
�@ 
bnid� l ����?�>� 4  ���=�
�= 
prcs� o  ���<�< 0 thestataname theStataName�?  �>  �B  �A  � o      �;�; "0 thestataversion theStataVersion� ��� r  ����� n ����� 1  ���:
�: 
txdl� 1  ���9
�9 
ascr� o      �8�8 0 theolddelims theOldDelims� ��� r  ����� J  ���� ��7� m  ���� ���  c o m . s t a t a . s t a t a�7  � n     ��� 1  ���6
�6 
txdl� 1  ���5
�5 
ascr� ��� r  ����� l ����4�3� n  ����� 4 ���2�
�2 
citm� m  ���1�1��� o  ���0�0 "0 thestataversion theStataVersion�4  �3  � o      �/�/ "0 thestataversion theStataVersion� ��� r  ����� o  ���.�. 0 theolddelims theOldDelims� n     ��� 1  ���-
�- 
txdl� 1  ���,
�, 
ascr� ��+� r  ����� m  ���*
�* boovtrue� n      ��� 1  ���)
�) 
pisf� 4  ���(�
�( 
prcs� l ����'�&� o  ���%�% 0 thestataname theStataName�'  �&  �+  � m  |}���                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� l ���$�#�"�$  �#  �"  � ��!� Z  ����� �� = ����� o  ���� 0 dothis doThis� m  ���� ���  c o m m a n d� Z  ������� @  ����� o  ���� "0 thestataversion theStataVersion� m  ���� � n ����� I  ������  0 dostatacommand doStataCommand� ��� o  ���� 0 thestataname theStataName� ��� o  ���� 0 pasteme pasteMe�  �  �  f  ���  � n ����� I  ������ 0 pastetmpstata pasteTmpStata� ��� o  ���� 0 thestataname theStataName� ��� o  ���� 0 pasteme pasteMe�  �  �  f  ���   � n ����� I  ������ 0 dotmpdofile doTmpDofile� ��� o  ���� 0 thestataname theStataName� ��� o  ���� 0 	tmpdofile 	tmpDoFile� ��� o  ���� 0 dothis doThis�  �  �  f  ���!   X ' !- from test of UI being turned on    Y ��� B -   f r o m   t e s t   o f   U I   b e i n g   t u r n e d   o n��    ��� l     ��
�	�  �
  �	  � ��� i    ��� I      ���� 0 badfirstarg badFirstArg�  �  � O     ��� I   ���
� .sysodlogaskr        TEXT� m    �� ��� \ T h e   f i r s t   a r g u m e n t   m u s t   b e   " c o m m a n d "   o r   " m e n u "� ���
� 
btns� J    	�� ��� m       �  C a n c e l�  �  � m     �                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �  l     �� ���  �   ��    i     I      ��	���� 0 dotmpdofile doTmpDofile	 

 o      ���� 0 	stataname 	stataName  o      ���� 0 	tmpdofile 	tmpDoFile �� o      ���� 0 dowhat doWhat��  ��   k       l     ����   K E if multiple instances ever work, be sure this gets written just once    � �   i f   m u l t i p l e   i n s t a n c e s   e v e r   w o r k ,   b e   s u r e   t h i s   g e t s   w r i t t e n   j u s t   o n c e  q       ���� 
0 tmpdir   ������ "0 stupidapplefile stupidAppleFile��    l     ����   X R need to change this, because it changes the working directory in Stata on the Mac    � �   n e e d   t o   c h a n g e   t h i s ,   b e c a u s e   i t   c h a n g e s   t h e   w o r k i n g   d i r e c t o r y   i n   S t a t a   o n   t h e   M a c  r      !  I    ��"��
�� .sysoexecTEXT���     TEXT" m     ## �$$ 8 g e t c o n f   D A R W I N _ U S E R _ T E M P _ D I R��  ! o      ���� 
0 tmpdir   %&% r    '(' l   )����) b    *+* o    	���� 
0 tmpdir  + o   	 
���� 0 	tmpdofile 	tmpDoFile��  ��  ( o      ���� 0 	tmpdofile 	tmpDoFile& ,-, l   ��./��  . < 6 need applescript-style file name to write to the file   / �00 l   n e e d   a p p l e s c r i p t - s t y l e   f i l e   n a m e   t o   w r i t e   t o   t h e   f i l e- 121 r    343 4    ��5
�� 
psxf5 o    ���� 0 	tmpdofile 	tmpDoFile4 o      ���� "0 stupidapplefile stupidAppleFile2 676 Q    a89:8 k    A;; <=< I   ��>?
�� .rdwropenshor       file> o    ���� "0 stupidapplefile stupidAppleFile? ��@��
�� 
perm@ m    ��
�� boovtrue��  = ABA I    '��CD
�� .rdwrseofnull���     ****C o     !���� "0 stupidapplefile stupidAppleFileD ��E��
�� 
set2E m   " #����  ��  B FGF I  ( 3��HI
�� .rdwrwritnull���     ****H l  ( -J����J I  ( -������
�� .JonsgClp****    ��� null��  ��  ��  ��  I ��K��
�� 
refnK o   . /���� "0 stupidapplefile stupidAppleFile��  G LML I  4 ;��NO
�� .rdwrwritnull���     ****N o   4 5��
�� 
ret O ��P��
�� 
refnP o   6 7���� "0 stupidapplefile stupidAppleFile��  M Q��Q I  < A��R��
�� .rdwrclosnull���     ****R o   < =���� "0 stupidapplefile stupidAppleFile��  ��  9 R      ������
�� .ascrerr ****      � ****��  ��  : k   I aSS TUT I  I N��V��
�� .rdwrclosnull���     ****V o   I J���� "0 stupidapplefile stupidAppleFile��  U W��W O   O aXYX I  S `��Z[
�� .sysodlogaskr        TEXTZ m   S T\\ �]] L H a d   t r o u b l e   w i t h   t h e   t e m p o r a r y   d o - f i l e[ ��^��
�� 
btns^ J   W \__ `��` m   W Zaa �bb  C a n c e l��  ��  Y m   O Pcc�                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  7 ded l  b b��fg��  f #  applescript really is a pita   g �hh :   a p p l e s c r i p t   r e a l l y   i s   a   p i t ae iji O   b qklk I  k p������
�� .miscactvnull��� ��� null��  ��  l 4   b h��m
�� 
cappm o   f g���� 0 	stataname 	stataNamej n��n Z   r op��qo =   r wrsr o   r s���� 0 dowhat doWhats m   s vtt �uu  m e n up Q   z �vwxv I   } ���y���� 0 	doviamenu 	doViaMenuy z��z o   ~ ���� 0 	stataname 	stataName��  ��  w R      ������
�� .ascrerr ****      � ****��  ��  x k   � �{{ |}| I   � ���~���� "0 createmenuitems createMenuItems~ � o   � ����� 0 	stataname 	stataName� ���� o   � ����� 0 	tmpdofile 	tmpDoFile��  ��  } ��� l  � �������  � 8 2 need to be sure the menu item exists on first try   � ��� d   n e e d   t o   b e   s u r e   t h e   m e n u   i t e m   e x i s t s   o n   f i r s t   t r y� ��� I  � ������
�� .sysodelanull��� ��� nmbr� m   � ����� ��  � ���� Q   � ����� I   � �������� 0 	doviamenu 	doViaMenu� ���� o   � ����� 0 	stataname 	stataName��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � O   � ���� I  � �����
�� .sysodlogaskr        TEXT� m   � ��� ��� v S o m e t h i n g   w e n t   w r o n g . . .   i s   y o u r   s t a t a   v e r s i o n   s e t   p r o p e r l y ?� �����
�� 
btns� J   � ��� ���� m   � ��� ���  C a n c e l��  ��  � m   � ����                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��  q l  � ���� Z   � ������ =   � ���� o   � ����� 0 dowhat doWhat� m   � ��� ���  i n c l u d e� Q   � ����� n  � ���� I   � �������� 0 pastetmpstata pasteTmpStata� ��� o   � ����� 0 	stataname 	stataName� ���� b   � ���� m   � ��� ���  i n c l u d e  � o   � ����� 0 	tmpdofile 	tmpDoFile��  ��  �  f   � �� R      ������
�� .ascrerr ****      � ****��  ��  � O   � ���� I  � �����
�� .sysodlogaskr        TEXT� m   � ��� ��� \ H a d   t r o u b l e   r u n n i n g   v i a   t e m p o r a r y   i n c l u d e   f i l e� �����
�� 
btns� J   � ��� ���� m   � ��� ���  C a n c e l��  ��  � m   � ����                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  � l  � ���� Q   � ���� k   ��� ��� l  � �������  � = 7 'open' changes directory as an unavoidable side-effect   � ��� n   ' o p e n '   c h a n g e s   d i r e c t o r y   a s   a n   u n a v o i d a b l e   s i d e - e f f e c t� ��� l  � �������  �   open stupidAppleFile   � ��� *   o p e n   s t u p i d A p p l e F i l e� ���� n  ���� I   �������� 0 pastetmpstata pasteTmpStata� ��� o   � ����� 0 	stataname 	stataName� ���� b   � ��� m   � ��� ���  d o  � o   � ����� 0 	tmpdofile 	tmpDoFile��  ��  �  f   � ���  � R      ������
�� .ascrerr ****      � ****��  ��  � O   ��� I ����
�� .sysodlogaskr        TEXT� m  �� ��� R H a d   t r o u b l e   r u n n i n g   v i a   t e m p o r a r y   d o - f i l e� �����
�� 
btns� J  �� ��� m  �� ���  C a n c e l�  ��  � m  ���                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �   doing via dofile   � ��� "   d o i n g   v i a   d o f i l e� I C doing via dofile or include--- needs fixing for multiple instances   � ��� �   d o i n g   v i a   d o f i l e   o r   i n c l u d e - - -   n e e d s   f i x i n g   f o r   m u l t i p l e   i n s t a n c e s��   ��� l     �~�}�|�~  �}  �|  � ��� i    ��� I      �{��z�{ 0 	doviamenu 	doViaMenu� ��y� o      �x�x 0 	stataname 	stataName�y  �z  � O     /��� Z    .���w�v� 1    �u
�u 
uien� O    *��� I   )�t��s
�t .prcsclicnull��� ��� uiel� n    %��� 4   " %�r�
�r 
menI� m   # $�� ���  r u n   t m p   f i l e� n    "��� 4    "�q�
�q 
menE� m     !�p�p � n       4    �o
�o 
menI m     � & A p p l e s c r i p t   h e l p e r s n     4    �n
�n 
menE m    �m�m  n    	 4    �l

�l 
mbri
 m     �  U s e r	 4    �k
�k 
mbar m    �j�j �s  � 4    �i
�i 
pcap o    �h�h 0 	stataname 	stataName�w  �v  � m     �                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �  l     �g�f�e�g  �f  �e    i     I      �d�c�d "0 createmenuitems createMenuItems  o      �b�b 0 	stataname 	stataName �a o      �`�` 0 	tmpdofile 	tmpDoFile�a  �c   O     G Z    F�_�^ 1    �]
�] 
uien O    B k    A   !"! l   �\#$�\  # * $ get the command window to the front   $ �%% H   g e t   t h e   c o m m a n d   w i n d o w   t o   t h e   f r o n t" &'& I   #�[(�Z
�[ .prcsclicnull��� ��� uiel( n   )*) 4    �Y+
�Y 
menI+ m    ,, �--  C o m m a n d* n    ./. 4    �X0
�X 
menE0 m    11 �22  W i n d o w/ n   343 4    �W5
�W 
mbri5 m    66 �77  W i n d o w4 4    �V8
�V 
mbar8 m    �U�U �Z  ' 9:9 I  $ +�T;�S
�T .prcskprsnull���     ctxt; b   $ '<=< m   $ %>> �?? r w i n d o w   m e n u   a p p e n d   s u b m e n u   " s t U s e r "   " A p p l e s c r i p t   h e l p e r s "= o   % &�R
�R 
ret �S  : @A@ I  , 7�QB�P
�Q .prcskprsnull���     ctxtB b   , 3CDC b   , 1EFE b   , /GHG m   , -II �JJ � w i n d o w   m e n u   a p p e n d   i t e m   " A p p l e s c r i p t   h e l p e r s "   " r u n   t m p   f i l e "   " d o  H o   - .�O�O 0 	tmpdofile 	tmpDoFileF m   / 0KK �LL  "D o   1 2�N
�N 
ret �P  A M�MM I  8 A�LN�K
�L .prcskprsnull���     ctxtN b   8 =OPO m   8 ;QQ �RR & w i n d o w   m e n u   r e f r e s hP o   ; <�J
�J 
ret �K  �M   4    �IS
�I 
pcapS o    �H�H 0 	stataname 	stataName�_  �^   m     TT�                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   UVU l     �G�F�E�G  �F  �E  V WXW i    YZY I      �D[�C�D  0 dostatacommand doStataCommand[ \]\ o      �B�B 0 	stataname 	stataName] ^�A^ o      �@�@ 0 
thecommand 
theCommand�A  �C  Z Q     *_`a_ w    bcb O    ded k    ff ghg l   �?ij�?  i  		activate   j �kk  	 a c t i v a t eh l�>l I   �=mn
�= .STscDoCanull���     ctxtm o    �<�< 0 
thecommand 
theCommandn �;o�:�; 0 addtoreview addToReviewo m    �9
�9 boovtrue�:  �>  e 4    	�8p
�8 
cappp o    �7�7 0 	stataname 	stataNamec�                                                                                  S5x8  alis    \  Macintosh HD               �ԛFH+  .'�StataMP.app                                                    .N�9�n        ����  	                Stata     ��*�      �9i�    .'����  -Macintosh HD:Applications: Stata: StataMP.app     S t a t a M P . a p p    M a c i n t o s h   H D  Applications/Stata/StataMP.app  / ��  ` R      �6�5�4
�6 .ascrerr ****      � ****�5  �4  a O    *qrq I    )�3st
�3 .sysodlogaskr        TEXTs m     !uu �vv l H a d   t r o u b l e   p a s s i n g   c o m m a n d ( s )   t o   S t a t a   c o m m a n d   w i n d o wt �2w�1
�2 
btnsw J   " %xx y�0y m   " #zz �{{  C a n c e l�0  �1  r m    ||�                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  X }~} l     �/�.�-�/  �.  �-  ~ � l     �,�+�*�,  �+  �*  � ��� i    ��� I      �)��(�) 0 pastetmpstata pasteTmpStata� ��� o      �'�' 0 	stataname 	stataName� ��&� o      �%�% 0 pasteme pasteMe�&  �(  � k     ��� ��� q      �� �$�#�$ 0 oldclipboard oldClipBoard�#  � ��� r     ��� I    �"�!� 
�" .JonsgClp****    ��� null�!  �   � o      �� 0 oldclipboard oldClipBoard� ��� Q    ����� k    h�� ��� I   ���
� .JonspClpnull���     ****� l   ���� c    ��� o    �� 0 pasteme pasteMe� m    �
� 
ctxt�  �  �  � ��� O    h��� Z    g����� 1    �
� 
uien� O    c��� k   % b�� ��� I  % 6���
� .prcsclicnull��� ��� uiel� n  % 2��� 4   / 2��
� 
menI� m   0 1�� ���  C o m m a n d� n   % /��� 4   , /��
� 
menE� m   - .�� ���  W i n d o w� n  % ,��� 4   ) ,��
� 
mbri� m   * +�� ���  W i n d o w� 4   % )��
� 
mbar� m   ' (�� �  � ��� I  7 <���
� .sysodelanull��� ��� nmbr� m   7 8�� ?ə������  � ��� I  = T���

� .prcsclicnull��� ��� uiel� n  = P��� 4   K P�	�
�	 
menI� l 	 L O���� m   L O�� ��� 
 P a s t e�  �  � n   = K��� 4   F K��
� 
menE� m   G J�� ���  E d i t� n  = F��� 4   A F��
� 
mbri� m   B E�� ���  E d i t� 4   = A��
� 
mbar� m   ? @�� �
  � ��� l  U U����  � > 8 added delay when seeing odd behavior on machine at work   � ��� p   a d d e d   d e l a y   w h e n   s e e i n g   o d d   b e h a v i o r   o n   m a c h i n e   a t   w o r k� ��� l  U U����  � U O it seems that a delay of under 0.2 seconds makes things weird on fast machines   � ��� �   i t   s e e m s   t h a t   a   d e l a y   o f   u n d e r   0 . 2   s e c o n d s   m a k e s   t h i n g s   w e i r d   o n   f a s t   m a c h i n e s� ��� I  U Z� ���
�  .sysodelanull��� ��� nmbr� m   U V�� ?ə�������  � ���� I  [ b�����
�� .prcskprsnull���     ctxt� o   [ ^��
�� 
ret ��  ��  � 4    "���
�� 
pcap� o     !���� 0 	stataname 	stataName�  �  � m    ���                                                                                  sevs  alis    �  Macintosh HD               �ԛFH+  ���System Events.app                                              ����SU        ����  	                CoreServices    ��*�      ����    ���������  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �  � R      ������
�� .ascrerr ****      � ****��  ��  � k   p ��� ��� I  p u�����
�� .JonspClpnull���     ****� o   p q���� 0 oldclipboard oldClipBoard��  � ���� O   v ���� I  | �����
�� .sysodlogaskr        TEXT� m   | �� ��� V H a d   t r o u b l e   p a s t i n g   t o   S t a t a   c o m m a n d   w i n d o w� �����
�� 
btns� J   � ��� ���� m   � ��� ���  C a n c e l��  ��  � m   v y���                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  � ���� I  � ������
�� .JonspClpnull���     ****� o   � ����� 0 oldclipboard oldClipBoard��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� "0 stripblanklines stripBlankLines� ���� o      ���� 0 thetext theText��  ��  � k     i��    q       ���� 0 theparas theParas ���� 0 thepara thePara ���� 0 achar aChar ���� 0 thecleanstuff theCleanStuff ������ 0 eraseme  ��    r     	
	 l    ���� n      2   ��
�� 
cpar o     ���� 0 thetext theText��  ��  
 o      ���� 0 theparas theParas  r    
 J    ����   o      ���� 0 thecleanstuff theCleanStuff  X    ^�� k    Y  r     m    ��
�� boovtrue o      ���� 0 eraseme    X    I�� Z   1 D ���� H   1 8!! E  1 7"#" J   1 5$$ %&% m   1 2'' �((   & )��) m   2 3** �++  	��  # o   5 6���� 0 achar aChar  k   ; @,, -.- r   ; >/0/ m   ; <��
�� boovfals0 o      ���� 0 eraseme  . 1��1  S   ? @��  ��  ��  �� 0 achar aChar n   " %232 2   # %��
�� 
cha 3 o   " #���� 0 thepara thePara 4��4 Z   J Y56����5 H   J L77 o   J K���� 0 eraseme  6 r   O U898 l  O R:����: c   O R;<; o   O P���� 0 thepara thePara< m   P Q��
�� 
TEXT��  ��  9 l     =����= n      >?>  ;   S T? o   R S���� 0 thecleanstuff theCleanStuff��  ��  ��  ��  ��  �� 0 thepara thePara o    ���� 0 theparas theParas @A@ r   _ dBCB o   _ `��
�� 
ret C l     D����D 1   ` c��
�� 
txdl��  ��  A E��E L   e iFF l  e hG����G c   e hHIH o   e f���� 0 thecleanstuff theCleanStuffI m   f g��
�� 
TEXT��  ��  ��  � JKJ l     ��������  ��  ��  K L��L i     #MNM I      �������� 0 getosxversion getOSXversion��  ��  N k     OO PQP q      RR ������ $0 thefullosversion theFullOSVersion��  Q STS r     UVU m     WW �XX  .V l     Y����Y 1    ��
�� 
txdl��  ��  T Z[Z O    \]\ r   
 ^_^ l  
 `����` 1   
 ��
�� 
vers��  ��  _ o      ���� $0 thefullosversion theFullOSVersion] m    aa�                                                                                  MACS  alis    t  Macintosh HD               �ԛFH+  ���
Finder.app                                                     �����|h        ����  	                CoreServices    ��*�      ���    ���������  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  [ b��b L    cc n    ded 4    ��f
�� 
citmf m    ���� e o    ���� $0 thefullosversion theFullOSVersion��  ��       ��ghijklmnopq������������������  g ������������������������������������
�� .aevtoappnull  �   � ****�� 0 badfirstarg badFirstArg�� 0 dotmpdofile doTmpDofile�� 0 	doviamenu 	doViaMenu�� "0 createmenuitems createMenuItems��  0 dostatacommand doStataCommand�� 0 pastetmpstata pasteTmpStata�� "0 stripblanklines stripBlankLines�� 0 getosxversion getOSXversion�� 0 theolddelims theOldDelims��  ��  ��  ��  ��  ��  ��  ��  h �� !���rs�~
�� .aevtoappnull  �   � ****�� 0 args  �  r �}�|�{�z�y�x�w�v�u�t�s�r�q�} 0 args  �| 0 numargs numArgs�{ 0 pasteme pasteMe�z 0 dothis doThis�y 0 	tmpdofile 	tmpDoFile�x 0 howmanystatas howManyStatas�w 0 	thestatas 	theStatas�v 0 thestataname theStataName�u "0 thestataversion theStataVersion�t 0 	olddelims 	oldDelims�s 0 theosxversion theOSXVersion�r $0 defaulttmpdofile defaultTmpDoFile�q 0 uiok UIOKs 9 @ U�p ��o�n�m�l�k x�j }�i ��h � � ��g�f � � � ��e�d ��c�b�a�`�_t�^4�]�\NSdi�[�Z�Y�X��W�V��U�T�S�R
�p 
uien�o 0 getosxversion getOSXversion
�n 
long�m 	
�l .miscactvnull��� ��� null
�k 
xppb
�j 
xpcp
�i 
btns
�h .sysodlogaskr        TEXT
�g 
leng
�f 
cobj�e �d 0 badfirstarg badFirstArg�c  �b  
�a .JonsgClp****    ��� null�` "0 stripblanklines stripBlankLines
�_ 
prcst  
�^ 
pnam
�] .corecnte****       ****
�\ .sysobeepnull��� ��� long
�[ 
bnid
�Z 
ascr
�Y 
txdl�X 0 theolddelims theOldDelims
�W 
citm
�V 
pisf�U �T  0 dostatacommand doStataCommand�S 0 pastetmpstata pasteTmpStata�R 0 dotmpdofile doTmpDofile�~��E�O� *�,E eE�Y fE�UO� Q� I)j+ �&E�O�� *j O*��/*�,FO���kvl Y *j O*��/*�,FOa �a kvl UY��a ,E�O R�a k/E�Oa a a a a v� 
)j+ Y hO�k �a l/E�O�a   �E�Y hY �E�W X  )j+ O)*j k+ E�O�a   a   a !�a "kvl UY hO� *a #-a $[a %,\Za &@1E�UO�j 'E�O�j  a   *j (Oa )�a *kvl UY 4�k a   a +�a ,kvl UOPY hO� �a k/a %,E�UO� J*a #�/a -,E�O_ .a /,E` 0Oa 1kv_ .a /,FO�a 2i/E�O_ 0_ .a /,FOe*a #�/a 3,FUO�a 4  �a 5 )��l+ 6Y 	)��l+ 7Y 
)���m+ 8i �Q��P�Ouv�N�Q 0 badfirstarg badFirstArg�P  �O  u  v ��M �L
�M 
btns
�L .sysodlogaskr        TEXT�N � ���kvl Uj �K�J�Iwx�H�K 0 dotmpdofile doTmpDofile�J �Gy�G y  �F�E�D�F 0 	stataname 	stataName�E 0 	tmpdofile 	tmpDoFile�D 0 dowhat doWhat�I  w �C�B�A�@�?�C 0 	stataname 	stataName�B 0 	tmpdofile 	tmpDoFile�A 0 dowhat doWhat�@ 
0 tmpdir  �? "0 stupidapplefile stupidAppleFilex ##�>�=�<�;�:�9�8�7�6�5�4�3�2c\�1a�0�/�.t�-�,�+�����*�����
�> .sysoexecTEXT���     TEXT
�= 
psxf
�< 
perm
�; .rdwropenshor       file
�: 
set2
�9 .rdwrseofnull���     ****
�8 .JonsgClp****    ��� null
�7 
refn
�6 .rdwrwritnull���     ****
�5 
ret 
�4 .rdwrclosnull���     ****�3  �2  
�1 
btns
�0 .sysodlogaskr        TEXT
�/ 
capp
�. .miscactvnull��� ��� null�- 0 	doviamenu 	doViaMenu�, "0 createmenuitems createMenuItems
�+ .sysodelanull��� ��� nmbr�* 0 pastetmpstata pasteTmpStata�H!�j E�O��%E�O*�/E�O .��el O��jl O*j �l 	O��l 	O�j W X  �j O� �a a kvl UO*a �/ *j UO�a   I *�k+ W :X  *��l+ Okj O *�k+ W X  � a a a kvl UY a�a   / )�a �%l+ W X  � a a a kvl UY , )�a  �%l+ W X  � a !a a "kvl Uk �)��(�'z{�&�) 0 	doviamenu 	doViaMenu�( �%|�% |  �$�$ 0 	stataname 	stataName�'  z �#�# 0 	stataname 	stataName{ �"�!� �����
�" 
uien
�! 
pcap
�  
mbar
� 
mbri
� 
menE
� 
menI
� .prcsclicnull��� ��� uiel�& 0� ,*�,E $*�/ *�k/��/�k/��/�k/��/j 
UY hUl ���}~�� "0 createmenuitems createMenuItems� ��   ��� 0 	stataname 	stataName� 0 	tmpdofile 	tmpDoFile�  } ��� 0 	stataname 	stataName� 0 	tmpdofile 	tmpDoFile~ T����6�1�,�>��
IKQ
� 
uien
� 
pcap
� 
mbar
� 
mbri
� 
menE
� 
menI
� .prcsclicnull��� ��� uiel
� 
ret 
�
 .prcskprsnull���     ctxt� H� D*�,E <*�/ 1*�k/��/��/��/j 
O��%j O�%�%�%j Oa �%j UY hUm �	Z������	  0 dostatacommand doStataCommand� ��� �  ��� 0 	stataname 	stataName� 0 
thecommand 
theCommand�  � ��� 0 	stataname 	stataName� 0 
thecommand 
theCommand� c� ��������|u��z��
�  
capp�� 0 addtoreview addToReview
�� .STscDoCanull���     ctxt��  ��  
�� 
btns
�� .sysodlogaskr        TEXT� + �Z*�/ 	��el UW X  � ���kvl 
Un ������������� 0 pastetmpstata pasteTmpStata�� ����� �  ������ 0 	stataname 	stataName�� 0 pasteme pasteMe��  � �������� 0 	stataname 	stataName�� 0 pasteme pasteMe�� 0 oldclipboard oldClipBoard� ���������������������������������������������
�� .JonsgClp****    ��� null
�� 
ctxt
�� .JonspClpnull���     ****
�� 
uien
�� 
pcap
�� 
mbar
�� 
mbri
�� 
menE
�� 
menI
�� .prcsclicnull��� ��� uiel
�� .sysodelanull��� ��� nmbr
�� 
ret 
�� .prcskprsnull���     ctxt��  ��  
�� 
btns
�� .sysodlogaskr        TEXT�� �*j  E�O b��&j O� R*�,E J*�/ ?*�k/��/��/��/j O�j O*�k/�a /�a /�a /j O�j O_ j UY hUW #X  �j Oa  a a a kvl UO�j o ������������� "0 stripblanklines stripBlankLines�� ����� �  ���� 0 thetext theText��  � �������������� 0 thetext theText�� 0 theparas theParas�� 0 thepara thePara�� 0 achar aChar�� 0 thecleanstuff theCleanStuff�� 0 eraseme  � 
����������'*������
�� 
cpar
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
cha 
�� 
TEXT
�� 
ret 
�� 
txdl�� j��-E�OjvE�O R�[��l kh eE�O )��-[��l kh ��lv� 
fE�OY h[OY��O� ��&�6FY h[OY��O�*�,FO��&p ��N���������� 0 getosxversion getOSXversion��  ��  � ���� $0 thefullosversion theFullOSVersion� W��a����
�� 
txdl
�� 
vers
�� 
citm�� �*�,FO� *�,E�UO��l/Eq ���  ��  ��  ��  ��  ��  ��  ��  ��   ascr  ��ޭ