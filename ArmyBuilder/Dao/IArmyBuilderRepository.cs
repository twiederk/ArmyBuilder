using ArmyBuilder.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArmyBuilder.Dao
{
    public interface IArmyBuilderRepository
    {
        public List<ArmyList> ArmyLists();
    }
}
