pragma Ada_2012;
package body TAD_Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
      coords : Type_Coordonnee;
   begin
      coords.ligne := ligne;
      coords.colonne := colonne;
      return coords;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      return c.ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      return c.colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
   begin
      if c.ligne <= 3 then
         if c.colonne <= 3 then
            return 1;
         elsif c.colonne <= 6 then
            return 2;
         else
            return 3;
         end if;
      elsif c.ligne <= 6 then
         if c.colonne <= 3 then
            return 4;
         elsif c.colonne <= 6 then
            return 5;
         else
            return 6;
         end if;
      else
         if c.colonne <= 3 then
            return 7;
         elsif c.colonne <= 6 then
            return 8;
         else
            return 9;
         end if;
      end if;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
      coords : Type_Coordonnee;
   begin
      case numCarre is
         when 1 =>
            coords.ligne := 1;
            coords.colonne := 1;
         when 2 =>
            coords.ligne := 1;
            coords.colonne := 4;
         when 3 =>
            coords.ligne := 1;
            coords.colonne := 7;
         when 4 =>
            coords.ligne := 4;
            coords.colonne := 1;
         when 5 =>
            coords.ligne := 4;
            coords.colonne := 4;
         when 6 =>
            coords.ligne := 4;
            coords.colonne := 7;
         when 7 =>
            coords.ligne := 7;
            coords.colonne := 1;
         when 8 =>
            coords.ligne := 7;
            coords.colonne := 4;
         when 9 =>
            coords.ligne := 7;
            coords.colonne := 7;
         when others =>
            null;
      end case;
      return coords;

   end obtenirCoordonneeCarre;

end TAD_Coordonnee;
