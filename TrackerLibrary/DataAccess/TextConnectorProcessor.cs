using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackerLibrary.Models;

namespace TrackerLibrary.DataAccess.TextHelpers
{
    public static class TextConnectorProcessor
    {
        public static string FullFilePath(this string fileName)
        {
            return $"{ ConfigurationManager.AppSettings["filePath"] }\\{ fileName}";
        }

        public static List<string> LoadFile(this string file)
        {
            if (!File.Exists(file))
            {
                return new List<string>();
            }
            return File.ReadAllLines(file).ToList();
        }

        public static List<PrizeModel> ConvertToPrizeModels(this List<string> lines)
        {
            List<PrizeModel> output = new List<PrizeModel>();
           
            foreach (string line in lines)
            {
                string[] cols = line.Split(',');
                
                PrizeModel p = new PrizeModel();
                p.Id = int.Parse(cols[0]);
                p.PlaceNumber = int.Parse(cols[1]);
                p.PlaceName = cols[2];
                p.PrizeAmount = decimal.Parse(cols[3]);
                p.PrizePercentage = double.Parse(cols[4]);
                output.Add(p);
            }

            return output;
        }

        public static void SaveToPrizeFile(this List<PrizeModel> models, string fileName)
        {
            List<string> lines = new List<string>();
            foreach (PrizeModel p in models)
            {
                lines.Add($"{ p.Id },{ p.PlaceNumber },{ p.PlaceName },{ p.PrizeAmount },{ p.PrizePercentage }");
            }

            File.WriteAllLines(fileName.FullFilePath(), lines);
        }

        public static List<PersonModel> ConvertToPersonModels(this List<string> lines)
        {
            List<PersonModel> output = new List<PersonModel>();

            foreach (string line in lines)
            {
                string[] cols = line.Split(',');

                PersonModel p = new PersonModel();
                p.Id = int.Parse(cols[0]);
                p.FirstName = cols[1];
                p.LastName = cols[2];
                p.EmailAddress = cols[3];
                p.CellphoneNumber = cols[4];
                output.Add(p);
            }

            return output;
        }

        public static void SaveToPersonFile(this List<PersonModel> models, string fileName)
        {
            List<string> lines = new List<string>();
            foreach (PersonModel p in models)
            {
                lines.Add($"{ p.Id },{ p.FirstName },{ p.LastName },{ p.EmailAddress },{ p.CellphoneNumber }");
            }

            File.WriteAllLines(fileName.FullFilePath(), lines);
        }

        public static List<TeamModel> ConvertToTeamModels(this List<string> lines, string peopleFileName)
        {
            List<TeamModel> output = new List<TeamModel>();
            List<PersonModel> people = peopleFileName.FullFilePath().LoadFile().ConvertToPersonModels();

            foreach (string line in lines)
            {
                string[] cols = line.Split(',');

                TeamModel t = new TeamModel();
                t.Id = int.Parse(cols[0]);
                t.TeamName = cols[1];

                string[] memberIds = cols[2].Split('|');
                
                // TODO - Handle errors when a team with no members is created.
                foreach (string id in memberIds)
                {
                    t.TeamMembers.Add(people.Where(x => x.Id == int.Parse(id)).First());
                }

                output.Add(t);
            }

            return output;
        }

        public static void SaveToTeamFile(this List<TeamModel> models, string fileName)
        {
            List<string> lines = new List<string>();
            
            foreach (TeamModel t in models)
            {
                //string memberIds = t.GetTeamMemberIds();
                //lines.Add($"{ t.Id },{ t.TeamName },{ memberIds }");
                lines.Add($"{ t.Id },{ t.TeamName },{ t.GetTeamMemberIds() }");
            }
            File.WriteAllLines(fileName.FullFilePath(), lines);
        }

        private static string GetTeamMemberIds(this TeamModel t)
        {
            int[] idsArray = new int[t.TeamMembers.Count];
            List<int> teamMembers = new List<int>();
            for (int i = 0; i < t.TeamMembers.Count; i++)
            {
                idsArray[i] = t.TeamMembers[i].Id;
            }
            return string.Join("|", idsArray);
        }

        public static List<TournamentModel> ConvertToTournamentModels(this List<string> lines, string prizesFileName, string teamsFileName, string peopleFileName)
        {
            List<TournamentModel> output = new List<TournamentModel>();
            List<PrizeModel> prizes = prizesFileName.FullFilePath().LoadFile().ConvertToPrizeModels();
            List<TeamModel> teams = teamsFileName.FullFilePath().LoadFile().ConvertToTeamModels(peopleFileName);
            foreach (string line in lines)
            {
                string[] cols = line.Split(',');

                TournamentModel t = new TournamentModel();
                t.Id = int.Parse(cols[0]);
                t.TournamentName = cols[1];
                t.EntryFee = decimal.Parse(cols[2]);
                t.Active = int.Parse(cols[3]);

                string[] prizeIds = cols[4].Split('|');
                string[] teamIds = cols[5].Split('|');

                // TODO - Handle errors when a tournament with no prize is created.
                foreach (string id in prizeIds)
                {
                    t.Prizes.Add(prizes.Where(x => x.Id == int.Parse(id)).First());
                }
                
                // TODO - Handle errors when a tournament with no prize is created.
                foreach (string id in teamIds)
                {
                    t.EnteredTeams.Add(teams.Where(x => x.Id == int.Parse(id)).First());
                }

                // TODO - Capture rounds information
                output.Add(t);
            }

            return output;
        }

        public static void SaveToTournamentFile(this List<TournamentModel> models, string fileName)
        {
            List<string> lines = new List<string>();

            foreach (TournamentModel t in models)
            {
                lines.Add($"{ t.Id },{ t.TournamentName },{ t.EntryFee },{ t.Active },{ t.GetPrizeIds() },{ t.GetTeamIds() },{ ConvertRoundListToString(t.Rounds) }");
            }
            File.WriteAllLines(fileName.FullFilePath(), lines);
        }

        private static string GetPrizeIds(this TournamentModel t)
        {
            int[] idsArray = new int[t.Prizes.Count];
            List<int> prizes = new List<int>();
            for (int i = 0; i < t.Prizes.Count; i++)
            {
                idsArray[i] = t.Prizes[i].Id;
            }
            return string.Join("|", idsArray);
        }

        private static string GetTeamIds(this TournamentModel t)
        {
            int[] idsArray = new int[t.EnteredTeams.Count];
            List<int> teams = new List<int>();
            for (int i = 0; i < t.EnteredTeams.Count; i++)
            {
                idsArray[i] = t.EnteredTeams[i].Id;
            }
            return string.Join("|", idsArray);
        }

        //private static string GetRoundIds(this TournamentModel t)
        //{
        //    // (Rounds - id^id^id|id^id^id|id^id^id)
        //    int[] idsArray = new int[t.Rounds.Count];
        //    List<int> rounds = new List<int>();
        //    for (int i = 0; i < t.Rounds.Count; i++)
        //    {

        //    }

        //}

        private static string ConvertRoundListToString(List<List<MatchupModel>> rounds)
        {
            string output = "";

            if (rounds.Count == 0)
            {
                return "";
            }

            foreach (List<MatchupModel> r in rounds)
            {
                output += $"{ ConvertMatchupListToString(r)}|";
            }

            output = output.Substring(0, output.Length - 1);

            return output;
        }

        private static string ConvertMatchupListToString(List<MatchupModel> matchups)
        {
            string output = "";

            if (matchups.Count == 0)
            {
                return "";
            }

            foreach (MatchupModel matchup in matchups)
            {
                output += $"{ matchup.Id }^";
            }

            output = output.Substring(0, output.Length - 1);
            
            return output;
        }
    }
}
