using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using web_api.Models;

namespace web_api.Controllers
{
    public class UBICACIONsController : ApiController
    {
        private TecEntities db = new TecEntities();

        // GET: api/UBICACIONs
        public IQueryable<UBICACION> GetUBICACION()
        {
            return db.UBICACION;
        }

        // GET: api/UBICACIONs/5
        [ResponseType(typeof(UBICACION))]
        public async Task<IHttpActionResult> GetUBICACION(int id)
        {
            UBICACION uBICACION = await db.UBICACION.FindAsync(id);
            if (uBICACION == null)
            {
                return NotFound();
            }

            return Ok(uBICACION);
        }

        // PUT: api/UBICACIONs/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutUBICACION(int id, UBICACION uBICACION)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != uBICACION.Id)
            {
                return BadRequest();
            }

            db.Entry(uBICACION).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UBICACIONExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/UBICACIONs
        [ResponseType(typeof(UBICACION))]
        public async Task<IHttpActionResult> PostUBICACION(UBICACION uBICACION)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.UBICACION.Add(uBICACION);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = uBICACION.Id }, uBICACION);
        }

        // DELETE: api/UBICACIONs/5
        [ResponseType(typeof(UBICACION))]
        public async Task<IHttpActionResult> DeleteUBICACION(int id)
        {
            UBICACION uBICACION = await db.UBICACION.FindAsync(id);
            if (uBICACION == null)
            {
                return NotFound();
            }

            db.UBICACION.Remove(uBICACION);
            await db.SaveChangesAsync();

            return Ok(uBICACION);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UBICACIONExists(int id)
        {
            return db.UBICACION.Count(e => e.Id == id) > 0;
        }
    }
}