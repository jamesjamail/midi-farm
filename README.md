# MIDI Generation with Magenta MusicVAE

This guide will help you set up and generate MIDI files using the Magenta MusicVAE model.

## Getting Started

### 1. Create an Environment File
Create .env file based on .env.example

### 2. Download Checkpoint Files

The music_vae README has download links:

https://github.com/magenta/magenta/blob/main/magenta/models/music_vae/README.md

### 3. Deploy the App
Run `./deploy.sh`

### 4. Generate MIDI
From inside the container, run the following command:

```
python magenta/models/music_vae/music_vae_generate.py \
--config=hierdec-trio_16bar \
--checkpoint_file=/magenta-data/music_vae/checkpoints/hierdec-trio_16bar.ckpt \
--mode=sample \
--num_outputs=5 \
--output_dir=/magenta/output
```

The `/output` directory now contains your generated midi files