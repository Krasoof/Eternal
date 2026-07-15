META
{
  Parser = SFX;
};

// Quest voice lines (Piper TTS drafts) played via snd_play("STEXT_VOICE_*").
// WAV files live in _Work\Data\Sound\SFX\ - remember to copy them to prod
// together with the scripts. Same META-injection pattern as ParticleFX.d.
// M* = Mistrz Zakonu (darkman), B* = Kasztelan/boss roars (slowed darkman).

instance stext_voice_m1(C_SFX_DEF) { file = "STEXT_VOICE_M1.WAV"; };
instance stext_voice_m2(C_SFX_DEF) { file = "STEXT_VOICE_M2.WAV"; };
instance stext_voice_m3(C_SFX_DEF) { file = "STEXT_VOICE_M3.WAV"; };
instance stext_voice_m4(C_SFX_DEF) { file = "STEXT_VOICE_M4.WAV"; };
instance stext_voice_m5(C_SFX_DEF) { file = "STEXT_VOICE_M5.WAV"; };
instance stext_voice_m6(C_SFX_DEF) { file = "STEXT_VOICE_M6.WAV"; };
instance stext_voice_b1(C_SFX_DEF) { file = "STEXT_VOICE_B1.WAV"; };
instance stext_voice_b2(C_SFX_DEF) { file = "STEXT_VOICE_B2.WAV"; };
