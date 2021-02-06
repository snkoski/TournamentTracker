using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary.Models
{
    /// <summary>
    /// Represents a team in the tournament.
    /// </summary>
    public class TeamModel
    {
        /// <summary>
        /// A list of persons on a team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();
        /// <summary>
        /// The team name.
        /// </summary>
        public string TeamName { get; set; }
    }
}
