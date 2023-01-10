with TAD_Coordonnee; use TAD_Coordonnee;

package TAD_Pile is

   PILE_PLEINE : exception;
   PILE_VIDE   : exception;

   TAILLE_MAX : constant Integer := 81;
   type TabCoordonnees is private;

   type Pile is private;

   -- construit une pile vide
   -- retourne une pile de type Pile
   function construirePile return Pile;

-- empile un �l�ment e de type Integer dans une pile p et retourne cette pile
-- l�ve l'exception PILE_PLEINE si la pile est pleine
   function empile (p : in Pile; e : in Type_Coordonnee) return Pile;

   -- d�pile le dernier �l�ment de la pile p et retourne la pile
   -- n�cessite estVide(p) = False
   -- l�ve l'exception PILE_VIDE si la pile est vide
   function depile (p : in Pile) return Pile;

   -- retourne VRAI si la pile p est vide
   -- retourne FAUX sinon
   function estVide (p : in Pile) return Boolean;

   -- retourne le dernier �l�ment de type Integer de la pile p
   -- n�cessite estVide(p) = False
   -- l�ve l'exception PILE_VIDE si la pile est vide
   function dernier (p : in Pile) return Type_Coordonnee;

private
   type TabCoordonnees is array (1 .. TAILLE_MAX) of Type_Coordonnee;

   type Pile is record
      tab        : TabCoordonnees;
      nbElements : Integer;
   end record;
end TAD_Pile;
