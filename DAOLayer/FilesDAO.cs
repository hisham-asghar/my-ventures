using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using DBLayer;

namespace DAOLayer
{
    public static class FilesDAO
    {
        public static bool Save(File model)
        {
            using (var db = new Model())
            {
                var updateFlag = model.FileId > 0;
                if (updateFlag)
                {
                    var dfile = db.Files.FirstOrDefault(p => p.FileId == model.FileId);
                    if (dfile == null)
                    {
                        db.Files.Add(model);
                    }
                    else
                    {
                        dfile.FileName = model.FileName;
                        dfile.Description = model.Description;
                        dfile.mimeType = model.mimeType;
                        dfile.FileTypeId = model.FileTypeId;
                        dfile.FileTypeName = model.FileTypeName;
                        dfile.onModified = DateTime.Now;
                    }
                }
                else
                {
                    db.Files.Add(model);
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
                
        }

        public static File Get(int id, int typeId)
        {
            using (var db = new Model())
            {
                return db.Files.FirstOrDefault(f => f.FileId == id && f.FileTypeId == typeId);
            }
        }

        public static List<File> GetAll(int typeId)
        {
            using (var db = new Model())
            {
                return db.Files.Where(f => f.FileTypeId == typeId).ToList();
            }
        }
    }
}
