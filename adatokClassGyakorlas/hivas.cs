using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace adatokClassGyakorlas
{
    internal class hivas
    {
        public int[] kezdIdo= new int[3];
        public int[] vegIdo = new int[3];
        public hivas(string sor)
        {
            string[] vag = sor.Split(' ');
            kezdIdo[0] = Convert.ToInt32(vag[0]);
            kezdIdo[1] = Convert.ToInt32(vag[1]);
            kezdIdo[2] = Convert.ToInt32(vag[2]);
            vegIdo[0] = Convert.ToInt32(vag[0]);
            vegIdo[1] = Convert.ToInt32(vag[1]);
            vegIdo[2] = Convert.ToInt32(vag[2]);
        }

        /// <summary>
        /// Ez a kezdési idő adja vissza másodpercben
        /// Újabb sor </br>
        /// </summary>
        /// <returns></returns>
        public int IdoMasodpercKezd()
        {
            return kezdIdo[0]+60*60 + kezdIdo[1]*60 + kezdIdo[2];
        }
        public int IdoMasodpercVeg()
        {
            return vegIdo[0] + 60 * 60 + vegIdo[1] * 60 + vegIdo[2];
        }
    }
}
