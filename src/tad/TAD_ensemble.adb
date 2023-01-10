pragma Ada_2012;
package body TAD_ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
      ensemble : Type_Ensemble;
   begin
      for I in 1..9 loop
         ensemble(I):=false;
      end loop;
      return ensemble;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      return e=construireEnsemble;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
   is
   begin
      return e(v);
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
      cpt : Integer;
   begin
      cpt := 0;
      for i of e loop
         if i then
            cpt := cpt +1;
         end if;
      end loop;
      return cpt;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v) then
         raise APPARTIENT_ENSEMBLE;
      end if;
      e(v) := True;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if not e(v) then
         raise NON_APPARTIENT_ENSEMBLE;
      end if;
      e(v) := False;
   end retirerChiffre;

end TAD_ensemble;
