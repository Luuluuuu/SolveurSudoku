pragma Ada_2012;
with ada.text_io,affichage;
use ada.text_io,affichage;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      g:Type_Grille;
   begin
      for i in 1..9 loop
         for j in 1..9 loop
            g(i,j):= 0;
         end loop;
      end loop;
      return g;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      return g(obtenirLigne(c),obtenirColonne(c)) = 0;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if caseVide(g,c) then
         raise OBTENIR_CHIFFRE_NUL;
      end if;
      return g(obtenirLigne(c),obtenirColonne(c));
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      c:Type_Coordonnee;
      compteur:Integer;
   begin
      compteur := 0;
      for i in 1..9 loop
         for j in 1..9 loop
            c:=construireCoordonnees(i,j);
            if not caseVide(g,c) then
               compteur:=compteur+1;
            end if;
         end loop;
      end loop;
      return compteur;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer; cpt : in out Integer)
   is
   begin
      if not caseVide(g,c) then
         raise FIXER_CHIFFRE_NON_NUL;
      end if;
      g(obtenirLigne(c),obtenirColonne(c)):=v;
      cpt := cpt + 1;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------


   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if g(obtenirLigne(c),obtenirColonne(c)) =0 then
         raise VIDER_CASE_VIDE;
      end if;
      g(obtenirLigne(c),obtenirColonne(c)):=0;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      return nombreChiffres(g)=81;
   end estRemplie;


   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      ens:Type_Ensemble;
      c:Type_Coordonnee;
   begin
      ens:=construireEnsemble;
      for i in 1..9 loop
         c:=construireCoordonnees(numLigne,i);
         if not caseVide(g,c) then
            ajouterChiffre(ens,obtenirChiffre(g,c));
         end if;
      end loop;
      return ens;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
      ens:Type_Ensemble;
      c:Type_Coordonnee;
   begin
      ens:=construireEnsemble;
      for i in 1..9 loop
           c:=construireCoordonnees(i,numColonne);
         if not caseVide(g,c) then
            ajouterChiffre(ens,obtenirChiffre(g,c));
         end if;
      end loop;
      return ens;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      coords:Type_Coordonnee;
      ensCarre:Type_Ensemble;
      c : Type_Coordonnee;
   begin
      ensCarre:=construireEnsemble;
      coords:= obtenirCoordonneeCarre(numCarre);
      for i in 1..3 loop
         for j in 1..3 loop
            c := construireCoordonnees(obtenirLigne(coords)+i-1,obtenirColonne(coords)+j-1);
            if not caseVide(g,c) then
               ajouterChiffre(ensCarre,obtenirChiffre(g,c));
            end if;
         end loop;
      end loop;
      return ensCarre;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
