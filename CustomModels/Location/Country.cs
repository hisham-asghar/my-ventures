﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels.Location
{
    public class Country
    {
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public List<City> cities { get; set; }
    }
}
