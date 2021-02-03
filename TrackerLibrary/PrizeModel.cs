using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary
{
    /// <summary>
    /// Represents a teams place and prize for the tournament.
    /// </summary>
    public class PrizeModel
    {
        /// <summary>
        /// A numerical representation of a teams place.
        /// </summary>
        public int PlaceNumber { get; set; }
        /// <summary>
        /// A string representation of a teams place.
        /// </summary>
        public string PlaceName { get; set; }
        /// <summary>
        /// The amount of prize money for this place in the tournament.
        /// </summary>
        public decimal PrizeAmount { get; set; }
        /// <summary>
        /// The percentage of prize money for this place in the tournament.
        /// </summary>
        public double PrizePercentage { get; set; }
    }
}
