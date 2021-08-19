use image::io::Reader;
use image::DynamicImage;
use rustler::Atom;
use rustler::Env;
use rustler::{Error, NifResult};

fn load_image<'a>(env: Env<'a>, path: &str) -> NifResult<DynamicImage> {
    let not_found_atom = Atom::from_str(env, "not_found")?;
    let decode_atom = Atom::from_str(env, "decode_failure")?;

    Reader::open(path)
        .map_err(|_e| Error::Term(Box::new(not_found_atom)))?
        .decode()
        .map_err(|_e| Error::Term(Box::new(decode_atom)))
}

#[rustler::nif]
fn compare_files<'a>(env: Env<'a>, path_a: String, path_b: String) -> NifResult<(Atom, bool)> {
    let ok_atom = Atom::from_str(env, "ok")?;

    let image_a = load_image(env, &path_a)?;
    let image_b = load_image(env, &path_b)?;

    let hash_a = blockhash::blockhash144(&image_a);
    let hash_b = blockhash::blockhash144(&image_b);

    Ok((ok_atom, hash_a == hash_b))
}

rustler::init!("Elixir.ExBlockhash.Native", [compare_files]);
