META
{
  Parser = PFX;
};

instance mfx_stextmagicbolt_init(c_particlefx) {
    ppsvalue = 60.0;
    ppsscalekeys_s = "1 2 1 2";
    ppsislooping = 1;
    ppsissmooth = 1;
    ppsfps = 1.0;
    shptype_s = "SPHERE";
    shpfor_s = "object";
    shpoffsetvec_s = "0 0 0";
    shpdistribtype_s = "RAND";
    shpisvolume = 1;
    shpdim_s = "6";
    shpscalekeys_s = "1";
    shpscaleislooping = 1;
    shpscaleissmooth = 1;
    shpscalefps = 2.0;
    dirmode_s = "NONE";
    dirfor_s = "object";
    dirmodetargetfor_s = "object";
    dirmodetargetpos_s = "0 0 0";
    dirangleheadvar = 180.0;
    dirangleelevvar = 180.0;
    velavg = 0.003;
    velvar = 0.001;
    lsppartavg = 1000.0;
    lsppartvar = 50.0;
    flygravity_s = "0 0 0";
    visname_s = "DESTROYUNDEAD2.TGA";
    visorientation_s = "VELO3D";
    vistexisquadpoly = 1;
    vistexanifps = 10.0;
    vistexaniislooping = 1;
    vistexcolorstart_s = "0 213 255";
    vistexcolorend_s = "145 17 250";
    vissizestart_s = "4 5";
    vissizeendscale = 2.0;
    visalphafunc_s = "ADD";
    visalphastart = 255.0;
    visalphaend = 60.0;
    useemittersfor = 1;
};

instance mfx_stextmagicbolt_cast(c_particlefx) {
    ppsvalue = 60.0;
    ppsscalekeys_s = "5";
    ppsislooping = 1;
    ppsissmooth = 1;
    ppsfps = 2.0;
    shptype_s = "SPHERE";
    shpfor_s = "object";
    shpoffsetvec_s = "0 0 0";
    shpdistribtype_s = "RAND";
    shpdistribwalkspeed = 0.1;
    shpisvolume = 1;
    shpdim_s = "8";
    shpscalekeys_s = "1";
    shpscaleislooping = 1;
    shpscaleissmooth = 1;
    shpscalefps = 2.0;
    dirmode_s = "RAND";
    dirfor_s = "object";
    dirmodetargetfor_s = "object";
    dirmodetargetpos_s = "0 0 0";
    dirangleheadvar = 180.0;
    dirangleelevvar = 180.0;
    velavg = 0.01;
    velvar = 0.03;
    lsppartavg = 300.0;
    flygravity_s = "0 0 0";
    visname_s = "DESTROYUNDEAD2.TGA";
    visorientation_s = "VELO";
    vistexisquadpoly = 1;
    vistexanifps = 18.0;
    vistexaniislooping = 1;
    vistexcolorstart_s = "0 213 255";
    vistexcolorend_s = "145 17 250";
    vissizestart_s =  "4 4";
    vissizeendscale = 4.0;
    visalphafunc_s = "ADD";
    visalphastart = 255.0;
    visalphaend = 30.0;
    useemittersfor = 1;
};

instance mfx_stextmagicbolt_collide(c_particlefx) {
    ppsvalue = 10.0;
    ppsfps = 10.0;
    shptype_s = "SPHERE";
    shpfor_s = "object";
    shpoffsetvec_s = "0 0 0";
    shpdistribtype_s = "RAND";
    shpisvolume = 1;
    shpdim_s = "8";
    shpscalekeys_s = "1";
    shpscaleislooping = 1;
    shpscaleissmooth = 1;
    shpscalefps = 2.0;
    dirmode_s = "TARGET";
    dirfor_s = "object";
    dirmodetargetfor_s = "object";
    dirmodetargetpos_s = "0 0 0";
    dirangleheadvar = 180.0;
    dirangleelevvar = 180.0;
    velavg = 0.08;
    velvar = 0.02;
    lsppartavg = 500.0;
    flygravity_s = "0 0 0";
    visname_s = "DESTROYUNDEAD2.TGA";
    visorientation_s = "VELO";
    vistexisquadpoly = 1;
    vistexanifps = 18.0;
    vistexaniislooping = 1;
    vistexcolorstart_s = "24 44 233";
    vistexcolorend_s = "255 128 128";
    vissizestart_s = "5 5";
    vissizeendscale = 5.0;
    visalphafunc_s = "ADD";
    visalphastart = 255.0;
};

instance weak_glimmer_stextgreen(item_glimmer_proto) 
{
    visname_s = "MFX_LIGHT_SINGLERAY.TGA";
    vistexcolorstart_s = "0 0 0";
    vistexcolorend_s = "0 255 0";
    vissizeendscale = 3.0;
};

instance weak_glimmer_stextorange(item_glimmer_proto) 
{
    visname_s = "MFX_LIGHT_SINGLERAY.TGA";
    vistexcolorstart_s = "0 0 0";
    vistexcolorend_s = "250 180 0";
    vissizeendscale = 3.0;
};

instance weak_glimmer_stextviolet(item_glimmer_proto) 
{
    visname_s = "MFX_LIGHT_SINGLERAY.TGA";
    vistexcolorstart_s = "0 0 0";
    vistexcolorend_s = "160 0 250";
    vissizeendscale = 3.0;
};

instance weak_glimmer_stextcyan(item_glimmer_proto) 
{
    visname_s = "MFX_LIGHT_SINGLERAY.TGA";
    vistexcolorstart_s = "0 0 0";
    vistexcolorend_s = "240 240 0";
    vissizeendscale = 3.0;
};