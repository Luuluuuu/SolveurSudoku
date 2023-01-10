pragma Ada_2012;
package body TAD_Pile is

   --------------------
   -- construirePile --
   --------------------

   function construirePile return Pile is
      p : Pile;
   begin
      p.nbElements := 0;
      return p;
   end construirePile;

   ------------
   -- empile --
   ------------

   function empile (p : in Pile; e : in Type_Coordonnee) return Pile is
      p1 : Pile;
   begin
      if p.nbElements = TAILLE_MAX then
         raise PILE_PLEINE;
      end if;
      p1.nbElements              := p.nbElements + 1;
      p1.tab (1 .. p.nbElements) := p.tab (1 .. p.nbElements);
      p1.tab (p1.nbElements)     := e;
      return p1;
   end empile;

   ------------
   -- depile --
   ------------

   function depile (p : in Pile) return Pile is
      p1 : Pile;
   begin
      if estVide (p) then
         raise PILE_VIDE;
      end if;
      p1.nbElements               := p.nbElements - 1;
      p1.tab (1 .. p1.nbElements) := p.tab (1 .. p1.nbElements);
      return p1;
   end depile;

   -------------
   -- estVide --
   -------------

   function estVide (p : in Pile) return Boolean is
   begin
      if p.nbElements = 0 then
         return True;
      else
         return False;
      end if;
   end estVide;

   -------------
   -- dernier --
   -------------

   function dernier (p : in Pile) return Type_Coordonnee is
   begin
      if estVide (p) then
         raise PILE_VIDE;
      end if;
      return p.tab (p.nbElements);
   end dernier;

end TAD_Pile;
