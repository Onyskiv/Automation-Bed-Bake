/ *      
 [ I N F O ]    
  
 N A M E   =   A u t o m a t i o n   B e d   B a k e  
 V E R S I O N   =   1 . 1 . 2  
 A U T H O R   =   M a s t a M a n  
 D E V   =    
 H E L P   =   h e l p . h t m l  
  
 [ 1 . 0 . 0 ]  
  
 *   I n i t i a l   r e l e a s e   =  
  
 [ 1 . 0 . 1 ]  
  
 *   C h a n g e d :   t r i m R i g h t   " _ l o w "   ( r e m o v e d   n u m b e r s ) =  
  
 [ 1 . 1 . 0 ]  
  
 *   C h a n g e d :   A d d e d   l o g i c   w i t h   m a t e r i a l s   u s a g e =  
  
 [ 1 . 1 . 1 ]  
  
 +   A d d e d :   V - R a y   R e n d e r   T i m e   o p i t o n =  
  
 [ 1 . 1 . 2 ]  
  
 *   C h a n g e d :   R e n d e r   o t h e r   _ l o w   p a r t s  
  
 [ A B O U T ]  
  
 T h i s   s c r i p t   a u t o m a t e   r e n d e r i n g   t o   t e x t u r e   b e d s =  
  
 [ S C R I P T ]  
 * /  
  
 t r y ( c l o s e R o l l o u t F l o a t e r   f A u t o m a t i o n B e d B a k e )   c a t c h ( )  
 g l o b a l   f A u t o m a t i o n B e d B a k e   =   n e w R o l l o u t F l o a t e r   " A u t o m a t i o n   B e d   B a k e "   2 8 0   7 5 0  
  
 r o l l o u t   _ r S t e p A B B 0     " M a i n "   (  
 	  
 	 f n   p i c k M a t e r i a l F i l t e r   o b j   =   o b j . m a t e r i a l   ! =   u n d e f i n e d    
 	  
         g r o u p   " S c e n e s "   (  
                 l i s t b o x   l b x S c e n e s L i s t   " "   h e i g h t :   7  
                 b u t t o n   b t n A d d S c e n e   " A d d "   w i d t h :   9 0   a c r o s s :   2  
                 b u t t o n   b t n R e m o v e S c e n e " R e m o v e "   w i d t h :   9 0  
         )  
 	  
 	 g r o u p   " M a t e r i a l s "   (  
 	 	 l a b e l   l b l 1   " T h i s   m a t e r i a l   w i l l   b e   a p p l i e d   t o   t h e   o b j e c t   w i t h \ n m a t e r i a l   n a m e d   \ " r e p l a c e - m a t e r i a l \ " "   a l i g n :   # l e f t     h e i g h t :   3 0  
 	 	 l i s t b o x   l b x M a t e r i a l s L i s t   h e i g h t :   7  
 	 	 p i c k b u t t o n   b t n P i c k M a t e r i a l   " P i c k "   w i d t h :   9 0   a c r o s s :   2   f i l t e r :   p i c k M a t e r i a l F i l t e r  
 	 	 b u t t o n   b t n R e m o v e M a t e r i a l   " R e m o v e "   w i d t h :   9 0  
 	 	 p r o g r e s s b a r   h r   " "   h e i g h t :   2  
 	 	 l a b e l   l b l 2   " F o r   t h i s   m a t e r i a l ,   a l l   t e x t u r e s   w i t h \ n n a m e   \ " r e p l a c e - t e x t u r e . j p g \ "   w i l l   b e   r e p l a c e d \ n w i t h   t e x t u r e s   f r o m   t h e   f o l d e r   b e l o w "   a l i g n :   # l e f t     h e i g h t :   4 0  
 	 	 e d i t t e x t   e d t R e p l a c e T e x t u r e P a t h   " "   r e a d o n l y :   t r u e   h e i g h t :   2 2  
 	 	 b u t t o n   b t n S e l e c t M a t T e x F o l d e r P a t h   " S e l e c t   P a t h "  
 	 )  
          
 	 g r o u p   " B a k e & & R e n d e r   S e t t i n g s "   (  
 	 	 s p i n n e r   s p n V r a y R e n d e r T i m e   " V - R a y   R e n d e r   T i m e :   "   r a n g e :   [ 0 ,   1 0 0 0 0 . 0 ,   2 . 0 ]   t y p e :   # f l o a t   a l i g n :   # l e f t   f i e l d W i d t h :   4 0  
 	 	 s p i n n e r   s p n P a d d i n g   " P a d d i n g :                                       "   r a n g e :   [ 0 ,   1 0 0 ,   4 ]   t y p e :   # i n t e g e r   a l i g n :   # l e f t   f i e l d W i d t h :   4 0  
 	 	 d r o p d o w n l i s t   d d l T e x t u r e s R e s   " T e x t u r e s   S i z e :   "   i t e m s :   # ( " 2 0 4 8 x 2 0 4 8 " ,   " 1 0 2 4 x 1 0 2 4 " ,   " 5 1 2 x 5 1 2 " ,   " 2 5 6 x 2 5 6 " ,   " 1 2 8 x 1 2 8 " ,   " 1 6 x 1 6 " )  
 	 )  
  
         g r o u p   " S a v e   B a k e d   T e x t u r e s   T o "   (  
                 c h e c k b o x   c b x U s e S e p a r a t e F o l d e r s   " U s e   s e p a r a t e   f o l d e r s "   c h e c k e d :   t r u e  
                 e d i t t e x t   e d t B a t c h R e n d e r P a t h   " "   r e a d o n l y :   t r u e   a c r o s s :   2   a l i g n :   # l e f t   f i e l d w i d t h :   1 9 5   h e i g h t :   2 2  
                 b u t t o n   b t n S e t B a t c h R e n d e r P a t h   " . . . "   w i d t h :   3 5   h e i g h t :   2 3   a l i g n :   # r i g h t   o f f s e t :   [ 0 ,   - 1 ]  
                  
                 b u t t o n   b t n S t a r t R e n d e r   " S t a r t   B a k e   T e x t u r e s "   h e i g h t :   3 5   w i d t h :   2 4 0   o f f s e t :   [ 0 ,   1 0 ]  
         )  
  
         g l o b a l   i n i V a u l t S e t t i n g s A B B   =   " "  
         g l o b a l   i n i L o g A B B   =   " "  
  
         f n   g e t S c e n e s   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " S C E N E S "  
         f n   a d d S c e n e s   m   =   f o r   i   i n   m   d o   s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " S C E N E S "   i   " "  
          
         f n   g e t O p e n M o d e l s   =   (  
                 f   =   # ( )  
                  
                 m o d e l s D i a l o g   =   d o t N e t O b j e c t   " S y s t e m . W i n d o w s . F o r m s . O p e n F i l e D i a l o g "    
                 m o d e l s D i a l o g . t i t l e   =   " S e l e c t   M o d e l s "  
                 m o d e l s D i a l o g . M u l t i s e l e c t   =   t r u e  
                 m o d e l s D i a l o g . F i l t e r   =   " 3 D   S t u d i o   M a x   ( * . m a x ) | * . m a x "  
                 m o d e l s D i a l o g . F i l t e r I n d e x   =   1  
                  
                 r e s u l t   =   m o d e l s D i a l o g . s h o w D i a l o g ( )    
                 r e s u l t . T o S t r i n g ( )    
                 r e s u l t . E q u a l s   r e s u l t . O K    
                 r e s u l t . E q u a l s   r e s u l t . C a n c e l    
                  
                 f   =   m o d e l s D i a l o g . f i l e N a m e s    
                    
                 r e t u r n   f  
         )  
  
         f n   u p d a t e L i s t   =   (  
                 m   =   g e t S c e n e s ( )  
                  
                 l b x S c e n e s L i s t . i t e m s   =   f o r   i   i n   m   c o l l e c t   g e t F i l e n a m e F i l e   i  
         )  
  
 	 f n   g e t M a t L i s t K e y   s h o w E r r o r :   f a l s e   =   (  
 	 	 s e l   =   l b x M a t e r i a l s L i s t . s e l e c t e d  
 	 	 i d   =   l b x M a t e r i a l s L i s t . s e l e c t i o n  
 	 	  
 	 	 i f ( i d   = =   0 )   d o   (  
 	 	 	 i f ( s h o w E r r o r )   d o   m e s s a g e B o x   " P l e a s e   s e l e c t   M a t e r i a l   f r o m   l i s t ! "   t i t l e :   " W a r n i n g ! " 	  
 	 	 	 r e t u r n   u n d e f i n e d  
 	 	 )  
 	 	  
 	 	 r e t u r n   s u b s t i t u t e S t r i n g   s e l   " [ E m p t y   P a t h ]   "   " "  
 	 )  
 	  
 	 f n   g e t M a t e r i a l s S e t u p   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "  
 	  
 	 f n   i m p l o d e   a   t a g :   " ,   "   =   (  
 	 	 r e t   =   " "  
 	 	 f o r   i   i n   1   t o   a . c o u n t   d o   r e t   + =   a [ i ]   +   ( i f ( i   = =   a . c o u n t )   t h e n   " "   e l s e   t a g )  
 	 	 r e t u r n   r e t  
 	 )  
 	  
 	 f n   g e t M a t e r i a l s A n d P a t h s   s h o w E r r o r :   f a l s e   =   (  
 	 	 m m   =   g e t M a t e r i a l s S e t u p ( )  
 	 	  
 	 	 o   =   o b j e c t s   a s   a r r a y  
 	 	 r e s   =   # ( )  
 	 	  
 	 	 f o r   i   i n   m m   d o   (  
 	 	 	 f o r   i i   i n   o   w h e r e   i i . m a t e r i a l   ! =   u n d e f i n e d   a n d   ( m a t c h P a t t e r n   i i . m a t e r i a l . n a m e   p a t t e r n :   ( i   +   " * " ) )   d o   (  
 	 	 	 	 p   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   i  
 	 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h  
 	 	 	 	 a p p e n d I f U n i q u e   r e s   # ( i i . m a t e r i a l ,   i ,   i i ,   p )  
 	 	 	 	 e x i t  
 	 	 	 )  
 	 	 )  
 	 	 m s g   =   " "  
  
 	 	 i f ( m m . c o u n t   ! =   r e s . c o u n t )   d o   (  
 	 	 	 f o u n d N a m e s   =   f o r   i   i n   r e s   c o l l e c t   i [ 2 ]  
 	 	 	 n o t F o u n d N a m e s   =   f o r   i   i n   m m   w h e r e   ( a p p e n d I f U n i q u e   f o u n d N a m e s   i )   c o l l e c t   i  
 	 	 	 i f ( n o t F o u n d N a m e s . c o u n t   >   0 )   d o   (  
 	 	 	 	 m s g   =   " N e x t   m a t e r i a l s   n o t   f o u n d :   "  
 	 	 	 	 m s g   + =   i m p l o d e   n o t F o u n d N a m e s  
 	 	 	 	 m s g   + =   " ! "  
 	 	 	 	  
 	 	 	 	 r e t u r n   # ( u n d e f i n e d ,   m s g )  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 n o t F o u n d P a t h s   =   f o r   i   i n   r e s   w h e r e   ( n o t   d o e s F i l e E x i s t   i [ 4 ] )   o r   i [ 4 ]   = =   " "   c o l l e c t   i [ 2 ]  
 	 	 i f ( n o t F o u n d P a t h s . c o u n t   >   0 )   d o   (  
 	 	 	 m s g   =   " P l e a s e   c h o o s e   T e x t u r e s   p a t h   f o r   n e x t   m a t e r i a l s :   "  
 	 	 	 m s g   + =   i m p l o d e   n o t F o u n d P a t h s  
 	 	 	 m s g   + =   " ! "  
 	 	 	  
 	 	 	 r e t u r n   # ( u n d e f i n e d ,   m s g )  
 	 	 )  
 	 	  
 	 	 r e t u r n   # ( r e s ,   m s g )  
 	 )  
 	  
 	 f n   u p d a t e M a t L i s t   =   (  
 	 	 m m   =   g e t M a t e r i a l s S e t u p ( )  
 	  
 	 	 r e s   =   # ( )  
 	 	 f o r   i   i n   m m   d o   (  
 	 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   i  
 	 	 	 i f ( v   = =   " "   o r   n o t   d o e s F i l e E x i s t   v )   t h e n   (  
 	 	 	 	 p r i n t   v  
 	 	 	 	 a p p e n d   r e s   ( " [ E m p t y   P a t h ]   "   +   i )  
 	 	 	 )   e l s e   (  
 	 	 	 	 a p p e n d   r e s   i  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 l b x M a t e r i a l s L i s t . i t e m s   =   r e s  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   f a l s e  
 	 	 i f ( n   ! =   u n d e f i n e d )   d o   (  
 	 	 	 p   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   n  
 	 	 	 e d t R e p l a c e T e x t u r e P a t h . t e x t   =   p  
 	 	 )  
 	 )  
 	 	  
 	 o n   b t n P i c k M a t e r i a l   p i c k e d   o b j   d o   (  
 	 	 i f ( o b j   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 n   =   o b j . m a t e r i a l . n a m e  
 	 	  
 	 	 m m   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   n  
 	 	 i f ( m m   ! =   " " )   d o   r e t u r n   u p d a t e M a t L i s t ( )  
 	 	  
 	 	 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   n   " "  
 	 	  
 	 	 u p d a t e M a t L i s t ( )  
 	 )  
 	  
 	 o n   b t n R e m o v e M a t e r i a l   p r e s s e d   d o   (  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   t r u e  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 - - q   =   q u e r y B o x   ( " D o   y o u   r e a l l y   w a n t   t o   d e l e t e   M a t e r i a l   \ " "   +   n   +   " \ "   f r o m   l i s t ? " )   t i t l e :   " C o n f i r m ? "  
 	 	 - - i f ( n o t   q )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 d e l I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   n  
 	 	 e d t R e p l a c e T e x t u r e P a t h . t e x t   =   " "  
 	 	  
 	 	 u p d a t e M a t L i s t ( )  
 	 )  
 	  
 	 o n   b t n S e l e c t M a t T e x F o l d e r P a t h   p r e s s e d   d o   (  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   t r u e  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s : " J P E G   ( * . j p g ) | * . j p g "  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
  
                 p   =   g e t F i l e N a m e P a t h   f  
 	 	  
 	 	 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " M A T E R I A L S "   n   p  
 	 	    
 	 	 u p d a t e M a t L i s t ( )      
 	 )  
 	  
 	 o n   s p n P a d d i n g   c h a n g e d   v   d o   (  
 	 	 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " P A D D I N G "   ( v   a s   s t r i n g )  
 	 )  
 	  
 	 o n   s p n V r a y R e n d e r T i m e   c h a n g e d   v   d o   (  
 	 	 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " R E N D E R _ T I M E "   ( v   a s   s t r i n g )  
 	 )  
 	  
 	 o n   l b x M a t e r i a l s L i s t   s e l e c t e d   v   d o   (  
 	 	 u p d a t e M a t L i s t ( )      
 	 )  
 	  
 	 f n   l o a d P a d d i n g   =   (  
 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " P A D D I N G "  
 	 	 i f ( v   = =   " " )   d o   v   =   4  
 	 	 s p n P a d d i n g . v a l u e   =   v   a s   i n t e g e r  
         ) 	  
 	  
 	 f n   l o a d R e n d e r T i m e   =   (  
 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " R E N D E R _ T I M E "  
 	 	 i f ( v   = =   " " )   d o   v   =   2 . 0  
 	 	 s p n V r a y R e n d e r T i m e . v a l u e   =   v   a s   f l o a t  
         )  
          
 	 f n   l o a d R e n d e r T e x t u r e s S i z e   =   (  
 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " S I Z E "  
 	 	 i f ( v   = =   " " )   d o   v   =   1  
 	 	 d d l T e x t u r e s R e s . s e l e c t i o n   =   v   a s   i n t e g e r  
         )  
  
         f n   l o a d R e n d e r S e t t i n g s   =   (  
                 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " R E N D E R _ T O "  
                 e d t B a t c h R e n d e r P a t h . t e x t   =   " "  
                 i f ( v   ! =   " " )   d o   (  
                         e d t B a t c h R e n d e r P a t h . t e x t   =   v  
                 )  
  
                 v   =   g e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " U S E _ S E P A R A T E _ F O L D E R S "  
                 i f ( v   = =   " 1 " )   t h e n   (  
                         c b x U s e S e p a r a t e F o l d e r s . c h e c k e d   =   t r u e  
                 )   e l s e   i f   ( v   = =   " 0 " )   t h e n   (  
 	 	 	 c b x U s e S e p a r a t e F o l d e r s . c h e c k e d   =   f a l s e  
 	 	 )  
         )  
 	  
 	 f n   g e t T e x t u r e s S i z e   =   (  
 	 	 s   =   d d l T e x t u r e s R e s . s e l e c t e d  
 	 	 r e t u r n   f o r   i   i n   ( f i l t e r S t r i n g   s   " x " )   c o l l e c t   i   a s   i n t e g e r  
 	 )  
 	  
 	 f n   g e t T e x t u r e s   p   i g n o r e :   " r e p l a c e - t e x t u r e "   =   (  
 	 	 t e x   =   # ( )  
 	 	  
 	 	 t y p e s   =   # ( " . j p g " ,   " . p n g " ,   " . t i f f " ,   " . g i f " ,   " . b m p " ,   " . t g a " )  
 	 	 f o r   i   i n   t y p e s   d o   j o i n   t e x   ( g e t F i l e s   ( p   +   @ " \ * "   +   i ) )  
 	 	  
 	 	 o u t   =   f o r   i   i n   t e x   w h e r e   ( g e t F i l e n a m e F i l e   i )   ! =   i g n o r e   c o l l e c t   i  
 	 	 	  
 	 	 r e t u r n   o u t  
 	 )  
 	  
 	 f n   g e t O b j e c t s     =   (  
 	 	 o   =   # ( )  
 	 	 f o r   i   i n   ( o b j e c t s   a s   a r r a y )   d o   (  
 	 	 	 n   =   t r i m R i g h t   i . n a m e   " 0 1 2 3 4 5 6 7 8 9 "  
 	 	 	 i f ( m a t c h P a t t e r n   n   p a t t e r n :   " * _ l o w " )   d o   a p p e n d   o   i  
 	 	 )  
 	 	  
 	 	 r e t u r n   o  
 	 )  
 	  
 	 o n   d d l T e x t u r e s R e s   s e l e c t e d     v   d o   (  
 	 	 v   =   v   a s   s t r i n g  
 	 	 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " S I Z E "   v  
 	 )  
          
         o n   c b x U s e S e p a r a t e F o l d e r s   c h a n g e d   v   d o   (  
                 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " U S E _ S E P A R A T E _ F O L D E R S "     ( i f ( v )   t h e n   " 1 "   e l s e   " 0 " )  
         )  
          
         o n   b t n S e t B a t c h R e n d e r P a t h   p r e s s e d   d o   (  
                 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s : " J P E G   ( * . j p g ) | * . j p g "  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 p   =   g e t F i l e N a m e P a t h   f  
                                  
                 s e t I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " R E N D E R "   " R E N D E R _ T O "   p  
                  
                 l o a d R e n d e r S e t t i n g s ( )  
         )  
          
         o n   b t n A d d S c e n e   p r e s s e d   d o   (  
                 f   =   g e t O p e n M o d e l s ( )  
                                  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                                  
                 a d d S c e n e s   f  
                                  
                 u p d a t e L i s t ( )  
         )  
          
         o n   b t n R e m o v e S c e n e   p r e s s e d   d o   (  
                 i d   =   l b x S c e n e s L i s t . s e l e c t i o n  
                  
                 i f ( i d   = =   0 )   d o   r e t u r n   f a l s e  
                  
                 m   =   g e t S c e n e s ( )  
                  
                 d e l I n i S e t t i n g   i n i V a u l t S e t t i n g s A B B   " S C E N E S "   m [ i d ]  
                                  
                 u p d a t e L i s t ( )  
         )  
  
         o n   _ r S t e p A B B 0   o p e n   d o   (  
                 i n i V a u l t S e t t i n g s A B B   =   g e t T h i s S c r i p t F i l e n a m e ( )   +   " . i n i "  
                  
                 u p d a t e L i s t ( )  
 	 	 u p d a t e M a t L i s t ( )  
 	 	 l o a d R e n d e r T e x t u r e s S i z e ( )  
                 l o a d R e n d e r S e t t i n g s ( )  
 	 	 l o a d P a d d i n g ( )  
 	 	 l o a d R e n d e r T i m e ( )  
         )  
 	  
 	 f n   g e t B i t m a p s T o R e p l a c e   m   n :   " r e p l a c e - t e x t u r e "   =   (  
 	 	 o   =   # ( )  
 	 	 f o r   b   i n   g e t C l a s s I n s t a n c e s   B i t m a p t e x t u r e     t a r g e t : m   d o   (  
 	 	 	 i f ( b . f i l e n a m e   = =   u n d e f i n e d )   d o   c o n t i n u e  
 	 	 	 f   =   g e t F i l e n a m e F i l e     b . f i l e n a m e 	 	 	  
 	 	 	 i f ( f   = =   n )   d o   a p p e n d   o   b  
 	 	 )  
 	 	 r e t u r n   o  
 	 )  
 	  
 	 f n   i s V r a y   =   (  
 	 	 r   =   r e n d e r e r s . c u r r e n t   a s   s t r i n g  
 	 	 i f   m a t c h p a t t e r n   r   p a t t e r n : " * V _ R a y _ * "   d o   r e t u r n   t r u e  
 	 	 r e t u r n   f a l s e  
 	 )  
 	  
 	 f n   t o F i x e d   v   p :   2   =   (  
 	 	 a   =   v   *   ( 1 0 ^ p )  
 	 	 b   =   a   a s   i n t e g e r  
 	 	 a   =   b   a s   f l o a t   /   ( 1 0 ^ p )  
 	 	 r e t u r n   a  
 	 )  
 	  
 	 f n   t o T i m e   v   =   (  
 	 	 v   =   t o F i x e d   v  
 	 	  
 	 	 h   =   0  
 	 	 s   =   ( ( v   -   ( ( v   a s   i n t e g e r )   a s   f l o a t ) )   *   6 0 . 0 )   a s   i n t e g e r  
 	 	 m   =   v   a s   i n t e g e r  
 	 	 i f ( m   > =   6 0 )   d o   (  
 	 	 	 h   =   t o F i x e d   ( m   /   6 0 . 0 )  
 	 	 	 m   =   ( m   -   ( ( h   a s   i n t e g e r )   *   6 0 ) )   a s   i n t e g e r  
 	 	 	 h   =   h   a s   i n t e g e r  
 	 	 )  
 	 	  
 	 	 i f ( h   >   0 )   t h e n   ( h   =   ( h   a s   s t r i n g )   +   "   h r s     " )   e l s e   h   =   " "  
 	 	 i f ( m   >   0 )   t h e n   ( m   =   ( m   a s   s t r i n g )   +   "   m i n     " )   e l s e   m   =   " " 	 	  
 	 	 s   =   ( s   a s   s t r i n g )   +   "   s e c "  
 	 	 r e t u r n   h   +   m   +   s  
 	 )  
 	  
 	 f n   b a k e   s i z e :   # ( 2 0 4 8 ,   2 0 4 8 )   =   (  
 	 	 s t a r t   =   t i m e S t a m p ( )  
 	 	 r e n d e r   r e n d e r t y p e :   # b a k e S e l e c t e d   v f b :   o f f   p r o g r e s s B a r :   t r u e   o u t p u t S i z e :   [ s i z e [ 1 ] ,   s i z e [ 2 ] ]  
 	 	 e n d   =   t i m e S t a m p ( )  
 	 	  
 	 	 r e t u r n   t o F i x e d   ( ( ( e n d   -   s t a r t )   /   1 0 0 0 . 0 )   /   6 0 . 0 )  
 	 )  
 	  
 	 f n   l o g g i n g   m   n a m e :   u n d e f i n e d   =   (  
 	 	 t   =   ( l o c a l T i m e   a s   s t r i n g )   +   "   ( "   +   ( t i m e S t a m p ( )   a s   s t r i n g )   +   " ) "  
 	 	 p r i n t   m  
 	 	 f   =   i n i L o g A B B  
 	 	 i f ( n a m e   ! =   u n d e f i n e d )   d o   (  
 	 	 	 f   =   ( g e t F i l e N a m e P a t h   f )   +   n a m e   +   " . i n i "  
 	 	 )  
 	 	 s e t I n i S e t t i n g   f   " L O G "   t   ( "   >   "   +   m )  
 	 )  
 	  
 	 f n   g e t R e p l a c e M a t e r i a l   =   ( 	  
 	 	 f o r   i   i n   S c e n e M a t e r i a l s   w h e r e   ( m a t c h P a t t e r n   i . n a m e   p a t t e r n :   " r e p l a c e - m a t e r i a l * " )   d o   r e t u r n   i  
 	 	 r e t u r n   u n d e f i n e d  
 	 )  
  
 	 f n   g e t O b j e c t s W i t h R e p l a c e M a t e r i a l   =   (  
 	 	 r e s   =   # ( )  
 	 	 m   =   g e t R e p l a c e M a t e r i a l ( )  
 	 	 i f ( m   = =   u n d e f i n e d )   d o   r e t u r n   # ( )  
 	 	 f o r   i i   i n   r e f s . d e p e n d e n t s   m   w h e r e   s u p e r C l a s s O f   i i   = =   G e o m e t r y C l a s s   a n d   ( m a t c h P a t t e r n   i i . n a m e   p a t t e r n :   ( " * _ l o w * " ) )   d o   a p p e n d I f U n i q u e   r e s   i i 	 	  
 	 	 r e t u r n   r e s  
 	 )  
 	  
 	 f n   g e t L o w P o l y P a i r   a   =   (  
 	 	 r e s   =   # ( )  
 	 	 n a m e s   =   f o r   i   i n   a   c o l l e c t   t r i m R i g h t   ( t r i m R i g h t   i . n a m e   " 0 1 2 3 4 5 6 7 8 9 " )   " _ h i g h "  
 	 	 	  
 	 	 o   =   o b j e c t s   a s   a r r a y  
 	 	 f o r   i   i n   o   d o   (  
 	 	 	 f o r   i i   i n   n a m e s   w h e r e   ( m a t c h P a t t e r n   i . n a m e   p a t t e r n :   ( i i   +   " _ l o w * " ) )   d o   (  
 	 	 	 	 a p p e n d   r e s   i  
 	 	 	 	 e x i t  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 r e t u r n   r e s  
 	 )  
 	  
 	 o n   b t n S t a r t R e n d e r   p r e s s e d   d o   (  
 	 	 b a k e d T e x L i s t   =   # ( )  
 	 	  
 	 	 _ R E N D E R   =   t r u e  
 	 	 c l e a r L i s t e n e r ( )  
 	 	 t o t a l T i m e   =   0  
 	 	 l o g F i l e N a m e   =   s u b s t i t u t e S t r i n g   ( s u b s t i t u t e S t r i n g   ( t r i m R i g h t   l o c a l T i m e   "   A P M " )   " / "   " - " )   " : "   " . "  
 	 	  
 	 	 s c e n e s   =   g e t S c e n e s ( )  
 	 	 s i z e   =   g e t T e x t u r e s S i z e ( )  
 	 	 	  
 	 	 i f ( s c e n e s . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   a d d   s c e n e s   t o   l i s t ! "   t i t l e :   " W a r n i n g ! "  
 	 	 f o r   s s   i n   s c e n e s   w h e r e   ( n o t   d o e s F i l e E x i s t   s s )   d o   r e t u r n   m e s s a g e B o x   ( " N o t   f o u n d   s c e n e ! \ n "   +   s s )   t i t l e :   " W a r n i n g ! "  
 	 	 i f ( e d t B a t c h R e n d e r P a t h . t e x t . c o u n t   = =   0   o r   n o t   d o e s F i l e E x i s t   e d t B a t c h R e n d e r P a t h . t e x t )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s e t   o u t p u t   T e x t u r e s   P a t h   f o r   s a v e ! "   t i t l e :   " W a r n i n g ! "  
 	  
 	 	 i n i L o g A B B   =   e d t B a t c h R e n d e r P a t h . t e x t   +   " l o g . i n i "  
 	 	  
 	 	 t r y ( s e t V R a y S i l e n t M o d e ( ) )   c a t c h ( )  
 	 	 J P E G . i j p e g i o . s e t Q u a l i t y   1 0 0  
 	 	 P N G I O . s e t T y p e   # t r u e 2 4  
 	 	 P N G I O . s e t A l p h a   t r u e  
 	 	 P N G I O . s e t I n t e r l a c e d   f a l s e  
 	 	 	  
 	 	 f o r   s   i n   s c e n e s   w h e r e   ( d o e s F i l e E x i s t   s )   d o 	 (  
 	 	 	 l o a d M a x F i l e   s   u s e F i l e U n i t s :   t r u e   q u i e t :   t r u e  
 	 	 	  
 	 	 	 l o g g i n g   ( " I n f o   - - >   O p e n   s c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	  
 	 	 	 i f ( n o t   i s V r a y ( ) )   d o   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   N o t   a s s i g n e d   r e n d e r   V - R a y   f o r   s c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 ) 	 	 	  
 	 	 	  
 	 	 	 - -   S e t   r e n d e r   s e t t i n g s  
 	 	 	 v r   =   r e n d e r e r s . c u r r e n t  
 	 	 	 v r . p r o g r e s s i v e _ m a x _ r e n d e r _ t i m e   =   s p n V r a y R e n d e r T i m e . v a l u e  
 	 	 	  
 	 	 	 l a s t R e p l a c e M a t e r i a l   =   u n d e f i n e d  
 	 	 	 l a s t R e p l a c e M a t e r i a l   =   g e t R e p l a c e M a t e r i a l ( )  
 	 	 	 m o d e l s   =   g e t O b j e c t s W i t h R e p l a c e M a t e r i a l ( )  
 	 	 	 - - m o d e l s   =   g e t L o w P o l y P a i r   o b j s W i t h R e p l a c e  
 	 	 	 e x i s t M o d e l s   =   m o d e l s  
 	 	 	 n o t U s e d M o d e l s   =   f o r   i   i n   g e t O b j e c t s ( )   w h e r e   ( a p p e n d I f U n i q u e   e x i s t M o d e l s   i )   c o l l e c t   i  
 	 	  
 	 	 	 i f ( m o d e l s . c o u n t   = =   0 )   d o   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   M o d e l s   w i t h   m a t e r i a l   n a m e   \ " r e p l a c e - m a t e r i a l \ "   n o t   f o u n d   i n :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 t m p   =   g e t M a t e r i a l s A n d P a t h s ( )  
 	 	 	 i f ( t m p [ 1 ]   = =   u n d e f i n e d )   d o   r e t u r n   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   S c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s )   +   " .   "   +   t m p [ 2 ] )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h  
 	 	 	 m a t s A n d P a t h s   =   t m p [ 1 ]  
 	 	 	  
 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h 	 	 	  
 	 	 	 f o r   i   i n   m a t s A n d P a t h s   d o   (  
 	 	 	 	 t a r g e t M a t e r i a l   =   i [ 1 ]  
 	 	 	 	 t a r g e t N a m e   =   i [ 2 ]  
 	 	 	 	 t a r g e t O b j   =   i [ 3 ]  
 	 	 	 	 t a r g e t P a t h   =   i [ 4 ]  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 p   =   t a r g e t P a t h 	 	 	 	  
 	 	 	 	 t e x t u r e s   =   g e t T e x t u r e s   p  
 	 	 	 	 b b   =   g e t B i t m a p s T o R e p l a c e   t a r g e t M a t e r i a l  
 	 	 	 	  
 	 	 	 	 - -   D i r e c t l y   r e p l a c e   m a t e r i a l  
 	 	 	 	 r e p l a c e I n s t a n c e s   l a s t R e p l a c e M a t e r i a l   t a r g e t M a t e r i a l  
 	 	 	 	 l a s t R e p l a c e M a t e r i a l   =   t a r g e t M a t e r i a l  
 	 	 	 	 	  
 	 	 	 	 i f ( t e x t u r e s . c o u n t   = =   0 )   d o   (  
 	 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   T e x t u r e s   i n   f o l d e r   n o t   f o u n d :   "   +     p )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 )  
 	 	 	 	    
 	 	 	 	 i f ( b b . c o u n t   = =   0 )   d o   (  
 	 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   N o t   f o u n d   t e x t u r e s   t o   r e p l a c e   f o r   m a t e r i a l :   "   +     t a r g e t N a m e )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 )  
 	 	 	 	  
 	 	 	 	 / *  
 	 	 	 	 i f ( b b . c o u n t   = =   0 )   d o   (  
 	 	 	 	 	 q   =   q u e r y B o x   ( " N o t   f o u n d   t e x t u r e s   t o   r e p l a c e   f o r   "   +   c b x M a t B o x [ i ] . c a p t i o n   +   " ! \ n D o   y o u   w a n t   t o   c o n t i n u e   r e n d e r   a n y w a y   w i t h   d e f a u l t   s e t t i n g s ? " )   t i t l e :   " C o n f i r m ? "  
 	 	 	 	 	 i f ( n o t   q )   d o   r e t u r n   f a l s e  
 	 	 	 	 	 s e l e c t   m o d e l s  
 	 	 	 	 	 b a k e   s i z e :   s i z e  
 	 	 	 	 	 c o n t i n u e  
 	 	 	 	 ) * /  
 	 	 	 	  
 	 	 	 	 f o r   t   i n   t e x t u r e s   d o   (  
 	 	 	 	 	 f o r   b   i n   b b   d o   b . f i l e n a m e   =   t  
 	 	 	 	 	 t o S e l e c t   =   # ( )  
 	 	 	 	 	  
 	 	 	 	 	 f o r   m   i n   m o d e l s   w h e r e   ( i s V a l i d N o d e   m )   d o   ( 	 	 	 	 	 	  
 	 	 	 	 	 	 b a k e T e x   =   m . I N o d e B a k e P r o p e r t i e s  
 	 	 	 	 	 	 e l e m e n t s N u m   =   b a k e T e x . n u m B a k e E l e m e n t s ( )  
 	 	 	 	 	 	 i f ( e l e m e n t s N u m   ! =   0 )   t h e n   (  
 	 	 	 	 	 	 	 i f ( n o t   a p p e n d I f U n i q u e   t o S e l e c t   m )   d o   c o n t i n u e  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 m a x N a m e   =   g e t F i l e n a m e F i l e   m a x F i l e N a m e  
 	 	 	 	 	 	 	 p a r t N a m e   =   t r i m R i g h t   ( t r i m R i g h t   m . n a m e   " 0 1 2 3 4 5 6 7 8 9 " )   " _ l o w "  
 	 	 	 	 	 	 	 t e x N a m e   =   g e t F i l e n a m e F i l e     t  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 s e p a r a t e F o l d e r   =   " "  
 	 	 	 	 	 	 	 i f ( c b x U s e S e p a r a t e F o l d e r s . c h e c k e d )   d o   (  
 	 	 	 	 	 	 	 	 s e p a r a t e F o l d e r   =   m a x N a m e +   @ " \ "   +   p a r t N a m e   +   @ " \ "  
 	 	 	 	 	 	 	 	 m a k e D i r   ( e d t B a t c h R e n d e r P a t h . t e x t   +   s e p a r a t e F o l d e r )   a l l :   t r u e  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 r e n d N a m e   =   m a x N a m e   +   " _ "   +   p a r t N a m e   +   " _ "   +   t e x N a m e   +   " . p n g " 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 o u t F i l e N a m e   =   e d t B a t c h R e n d e r P a t h . t e x t   +   s e p a r a t e F o l d e r   +   r e n d N a m e  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 b a k e T e x . n D i l a t i o n s   =   s p n P a d d i n g . v a l u e  
 	 	 	 	 	 	 	 b e 1   =   b a k e T e x . g e t B a k e E l e m e n t   1  
 	 	 	 	 	 	 	 b e 1 . f i l e T y p e   =   o u t F i l e N a m e  
 	 	 	 	 	 	 	 b e 1 . f i l e N a m e   =   f i l e n a m e F r o m P a t h   b e 1 . f i l e T y p e  
 	 	 	 	 	 	 	 b e 1 . o u t p u t S z X   =   s i z e [ 1 ]  
 	 	 	 	 	 	 	 b e 1 . o u t p u t S z Y   =   s i z e [ 2 ]  
 	 	 	 	 	 	 )   e l s e   (  
 	 	 	 	 	 	 	 l o g g i n g   ( " W a r n i n g   - - >   N o t   f o u n d   E l e m e n t   -   V r a y C o m p l e t e M a p   f o r   m o d e l :   "   +     m . n a m e )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 	 )  
 	 	 	 	 	 	  
 	 	 	 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 f o r   s e l   i n   t o S e l e c t   d o   (  
 	 	 	 	 	 	 c l e a r S e l e c t i o n ( )  
 	 	 	 	 	 	 s e l e c t   s e l  
 	 	 	 	 	 	 m i n u t e s   =   b a k e   s i z e :   s i z e  
 	 	 	 	 	 	 t o t a l T i m e   + =   m i n u t e s  
 	 	 	 	 	 	 l o g g i n g   ( " B a k e d   - - >   S c e n e :   "   +   ( g e t F i l e N a m e F i l e   s )   +   "   |   M o d e l :   " +   s e l . n a m e   +   "   |   M a t e r i a l :   "   +   t a r g e t N a m e   +   "   |   T e x t u r e :   "   +   ( f i l e n a m e F r o m P a t h   t )   +   "   |   R e n d e r   t i m e :   "   +   ( t o T i m e   m i n u t e s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 	 i f   ( k e y b o a r d . e s c P r e s s e d )   d o   (  
 	 	 	 	 	 	 	 l o g g i n g   ( " T o t a l   t i m e :   "   +   ( t o T i m e   t o t a l T i m e ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 	 	 _ R E N D E R   =   f a l s e  
 	 	 	 	 	 	 	 r e t u r n   f a l s e  
 	 	 	 	 	 	 ) 	  
 	 	 	 	 	 )  
 	 	 	 	 	 	  
 	 	 	 	 	 i f   ( k e y b o a r d . e s c P r e s s e d )   d o   (  
 	 	 	 	 	 	 _ R E N D E R   =   f a l s e  
 	 	 	 	 	 	 r e t u r n   f a l s e  
 	 	 	 	 	 ) 	 	  
 	 	 	 	 )  
  
 	 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 	 )  
 	 	 	  
 	 	 	 f o r   s e l   i n   n o t U s e d M o d e l s   d o   (  
 	 	 	 	 b a k e T e x   =   s e l . I N o d e B a k e P r o p e r t i e s  
 	 	 	 	 e l e m e n t s N u m   =   b a k e T e x . n u m B a k e E l e m e n t s ( )  
 	 	 	 	 i f ( e l e m e n t s N u m   ! =   0 )   t h e n   (  
 	 	 	 	 	 m a x N a m e   =   g e t F i l e n a m e F i l e   m a x F i l e N a m e  
 	 	 	 	 	 p a r t N a m e   =   t r i m R i g h t   ( t r i m R i g h t   s e l . n a m e   " 0 1 2 3 4 5 6 7 8 9 " )   " _ l o w "  
 	 	 	 	 	 s e p a r a t e F o l d e r   =   " "  
 	 	 	 	 	 i f ( c b x U s e S e p a r a t e F o l d e r s . c h e c k e d )   d o   (  
 	 	 	 	 	 	 s e p a r a t e F o l d e r   =   m a x N a m e +   @ " \ "   +   p a r t N a m e   +   @ " \ "  
 	 	 	 	 	 	 m a k e D i r   ( e d t B a t c h R e n d e r P a t h . t e x t   +   s e p a r a t e F o l d e r )   a l l :   t r u e  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 r e n d N a m e   =   m a x N a m e   +   " _ "   +   p a r t N a m e   +   " . p n g "  
 	 	 	 	 	 o u t F i l e N a m e   =   e d t B a t c h R e n d e r P a t h . t e x t   +   s e p a r a t e F o l d e r   +   r e n d N a m e  
 	 	 	 	 	  
 	 	 	 	 	 b a k e T e x . n D i l a t i o n s   =   s p n P a d d i n g . v a l u e  
 	 	 	 	 	 b e 1   =   b a k e T e x . g e t B a k e E l e m e n t   1  
 	 	 	 	 	 b e 1 . f i l e T y p e   =   o u t F i l e N a m e  
 	 	 	 	 	 b e 1 . f i l e N a m e   =   f i l e n a m e F r o m P a t h   b e 1 . f i l e T y p e  
 	 	 	 	 	 b e 1 . o u t p u t S z X   =   s i z e [ 1 ]  
 	 	 	 	 	 b e 1 . o u t p u t S z Y   =   s i z e [ 2 ]  
 	 	 	 	 )  
 	 	 	 	  
 	 	 	 	 c l e a r S e l e c t i o n ( )  
 	 	 	 	 s e l e c t   s e l  
 	 	 	 	 m i n u t e s   =   b a k e   s i z e :   s i z e  
 	 	 	 	 t o t a l T i m e   + =   m i n u t e s  
 	 	 	 	 l o g g i n g   ( " B a k e d   - - >   S c e n e :   "   +   ( g e t F i l e N a m e F i l e   s )   +   "   |   M o d e l :   " +   s e l . n a m e   +   "   |   M a t e r i a l :   "   +   ( s e l . m a t e r i a l . n a m e   a s   s t r i n g )   +   "   |   T e x t u r e :   d e f a u l t   |   R e n d e r   t i m e :   "   +   ( t o T i m e   m i n u t e s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	  
 	 	 	 	 i f   ( k e y b o a r d . e s c P r e s s e d )   d o   (  
 	 	 	 	 	 l o g g i n g   ( " T o t a l   t i m e :   "   +   ( t o T i m e   t o t a l T i m e ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 _ R E N D E R   =   f a l s e  
 	 	 	 	 	 r e t u r n   f a l s e  
 	 	 	 	 ) 	  
 	 	 	 )  
 	 	 	  
 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 )  
 	 	  
 	 	 l o g g i n g   ( " T o t a l   t i m e :   "   +   ( t o T i m e   t o t a l T i m e ) )   n a m e :   l o g F i l e N a m e  
 	 )  
 )  
  
 r o l l o u t   _ r A b o u t A B B   " A b o u t "    
 (  
         l a b e l   l b l N a m e   " "    
         l a b e l   l b l V e r   " "    
          
         l a b e l   l b l A u t h o r   " "   h e i g h t :   3 0  
         l a b e l   l b l C o p y   " "     h e i g h t :   3 0  
         b u t t o n   b t n H e l p   " H e l p "   e n a b l e d :   f a l s e  
          
         f n   g e t S c r i p t I n f o   s   r e l e a s e I n f o :   " "   =     (  
                 i f ( r e l e a s e I n f o   ! =   " " )   d o  
                 (  
                         r   =   g e t I N I S e t t i n g   s   r e l e a s e I n f o  
                         r e t u r n   r  
                 )  
                  
                 v   =   g e t I N I S e t t i n g   s   " I N F O "   " V E R S I O N "  
                 a   =   g e t I N I S e t t i n g   s   " I N F O "   " A U T H O R "  
                 n   =   g e t I N I S e t t i n g   s   " I N F O "   " N A M E "  
                 o   =   g e t I N I S e t t i n g   s   " A B O U T "  
                 c   =   g e t I N I S e t t i n g   s   " I N F O "   " D E V "  
                 h   =   g e t I N I S e t t i n g   s   " I N F O "   " H E L P "  
                  
                 r   =   f o r   i   i n   ( g e t I N I S e t t i n g   s )   w h e r e   ( i   ! =   " A B O U T "   a n d   i   ! =   " S C R I P T "   a n d   i   ! =   " C O P Y " )   c o l l e c t   i  
                  
                 r e t u r n   # ( n ,   a ,   v ,   o ,   r ,   c ,   h )  
         )  
          
         f n   g e t H e l p   r u n :   f a l s e   =  
         (  
                 s   =   g e t T h i s S c r i p t F i l e n a m e ( )  
                 i   =   g e t S c r i p t I n f o   s  
                 s z H e l p   =   ( g e t F i l e n a m e P a t h   s )   +   i [ 7 ]  
                 i f ( d o e s F i l e E x i s t   s z H e l p )   d o   b t n H e l p . e n a b l e d   =   t r u e  
                          
                 i f ( r u n )   d o   S h e l l L a u n c h   s z H e l p   " "  
         )  
 	  
         o n   b t n H e l p   p r e s s e d   d o   g e t H e l p   r u n :   t r u e  
                  
         o n   _ r A b o u t A B B   o p e n   d o  
         (  
                 i   =   g e t S c r i p t I n f o   ( g e t T h i s S c r i p t F i l e n a m e ( ) )  
                          
                 l b l N a m e . c a p t i o n   =   i [ 1 ]  
                 l b l A u t h o r . c a p t i o n   =   i [ 2 ]  
                 l b l V e r . c a p t i o n   =   i [ 3 ]  
                 l b l C o p y . c a p t i o n   =   i [ 6 ]  
                  
                 g e t H e l p ( )  
         )  
 )  
  
 a d d R o l l o u t   _ r S t e p A B B 0   f A u t o m a t i o n B e d B a k e   r o l l e d U p : f a l s e  
 a d d R o l l o u t   _ r A b o u t A B B   f A u t o m a t i o n B e d B a k e   r o l l e d U p : t r u e   