param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $ImageSearch,

    [Parameter(Mandatory=$false)]
    [String]
    $ImageSearchSize = '2mp'
)

$Files = Get-Content $FileList
$List = [System.Collections.Generic.List[String]]@()

foreach ($F in $Files) {


    $FinalSearchTerm = [IO.Path]::GetFileName($F)


    # R2R ##########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Update.Incl.Patched.and.Keygen-R2R'),          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Patched.and.Keygen.REPACK-R2R'),          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Inck.Patched.and.Keygen.REPACK-R2R'),          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Patched.and.Keygen.READ.NFO-R2R'),        ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX.Incl.Patched.and.Keygen-R2R'),         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MAC.LIN.Incl.Keygen-R2R'),                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX.LIN.Incl.Keygen-R2R'),                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen.REPACK-R2R'),                      ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen.READ.NFO-R2R'),                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Patched.and.Keygen-R2R'),                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Patched.and.Keygen.PROPER-R2R'),          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Cracked.and.Keygen-R2R'),                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Cracked.and.Keygen.PROPER-R2R'),          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen.PROPER-R2R'),                      ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FIXED.KEYGEN.ONLY-R2R'),                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WORKING.READ.NFO-R2R'),                        ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MAC.Incl.Keygen-R2R'),                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX.Incl.Keygen-R2R'),                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen.HAPPY.NEW.YEAR-R2R'),              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.HAPPY.NEW.YEAR-R2R'),                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Emulator-R2R'),                           ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Linux.Incl.Keygen-R2R'),                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen-R2R'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.READ.NFO-R2R'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX-R2R'),                                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged-R2R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.REPACK-R2R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PEPACK-R2R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.UNLOCKED-R2R'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FIXED-R2R'),                                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.HYBRID-R2R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER-R2R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FREE-R2R'),                                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-R2R'),                                         ''


    # RET ###########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX.LINUX.Regged-RET'),                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen-RET'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.READ.NFO-RET'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.REPACK-RET'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged-RET'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-RET'),                                         ''


    # VR ###########################################################


    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE.Rev2-V.R'),                                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE-V.R.Rev2'),                                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE-V.R.Rev'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.CE-V.R'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Win-V.R'),                                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE-VR'),                                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE-V.R'),                                      ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.CE'),                                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-V.R'),                                         ''

    # MORIA ########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-MORiA'),                                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MAC-MORiA'),                               ''

    # MOCHA ########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.(Incl.Pre.Downloaded.Library)-MOCHA'),         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.(Beta).WiN-MOCHA'),                            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('_WiN_PROPER_[MOCHA]'),                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.REPACK-MOCHA'),                            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.PROPER-MOCHA'),                            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.iNTERNAL-MOCHA'),                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.iNTERNAL-MOCHA'),                              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Fixed.WiN.(MOCHA)'),                           ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.FiXED-MOCHA'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Offline.(MOCHA)'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.MAC.REGGED-MOCHA'),                        ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.VST3-MOCHA'),                              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.MAC-MOCHA'),                               ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.[MOCHA]'),                                 ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.(MOCHA).FIXX'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('WiN [MOCHA]'),                                  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-MOCHA'),                                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN MOCHA'),                                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-TCD'),                                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.(MOCHA)'),                                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.MOCHA'),                                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-MOCHA'),                                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.[MOCHA]'),                                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('[MOCHA]'),                                      ''


    # ASSIGN #######################################################


    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen.200TH.RELEASE-ASSiGN'),            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.Keygen-ASSiGN'),                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER-ASSiGN'),                               ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x86.x64-ASSiGN'),                              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-ASSiGN'),                                      ''

    # SYNTHiC4TE ###################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.OSX.LiNUX.RETAiL.MERRY.XMAS-SYNTHiC4TE'),  ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.OSX.LiNUX.RETAiL-SYNTHiC4TE'),             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX.RETAiL-SYNTHiC4TE'),                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.OSX-SYNTHiC4TE'),                          ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x64.RETAiL-SYNTHiC4TE'),                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.RETAiL-SYNTHiC4TE'),                           ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-SYNTHiC4TE'),                                  ''


    # JustFun598 ###################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.REPACK-ReadNOTE-JustFun598'),              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.REPACK-JustFun598'),                       ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-JustFun598'),                              ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-JustFun598'),                                  ''

    # FLARE ########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Patched.WiN.REPACK.HAPPY.1ST.BiRTHDAY-FLARE'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Cracked.WiN.HAPPY.1ST.BiRTHDAY-FLARE'),        ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Patched.WiN.FiXED.READ.NFO-FLARE'),            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Patched.WiN.FiXED-FLARE'),                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Cracked.WiN-FLARE'),                           ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.WiN-FLARE'),                            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.PROPER-FLARE'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.PROPER.READ.NFO-FLARE'),                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.REPACK-FLARE'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.RETAiL.WiN-FLARE'),                            ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged-FLARE'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-FLARE'),                                   ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-FLARE'),                                       ''

    # demberto ######################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.REPACK.WiN-demberto'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.STANDALONE.VST2.VST3.WiN-demberto'),           ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.STANDALONE.WiN-demberto'),                     ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.WiN-demberto'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-demberto'),                                ''

    # AudioUTOPiA ###################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.READ.NFO-AudioUTOPiA'),                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.READ.NFO-AudioUTOPiA'),                        ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.VST-AudioUTOPiA'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-AudioUTOPiA'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.AudioUTOPiA'),                             ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-AudioUTOPiA'),                                 ''

    # ZEUS ##########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail.WIN.OSX-ZEUS'),                         ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX-ZEUS'),                                ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.OSX-ZEUS'),                                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-ZEUS'),                                    ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-ZEUS'),                                        ''

    # TeamCubeadooby ################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-PROPER+AAX-TeamCubeadooby'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-TeamCubeadooby+V.R'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER-TeamCubeadooby'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-TeamCubeadooby.cameo.V.R'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-TeamCubeadooby'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-TeamCubeadooby'), ''

    # TeamFuCK ######################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.ForAudioZ-TeamFuCK'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-TeamFuCK'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-FuCK'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-TeamFuCK'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-FuCK'), ''

    # SEnki #########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.SEnki'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-SEnki'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-SEnki'), ''

    # AiR ###########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER-AiR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.OSX-AiR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-AiR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-AiR'), ''

    # NeBULA ########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Proper-NeBULA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail-NeBULA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Team-NeBULA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-NeBULA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\sNeBULA$', ''

    # ArticStorm ####################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MacOS.LIN.Retail-ArticStorm'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST2-ArticStorm'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3.WIN-Articstorm'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3-Articstorm'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-ArticStorm'), ''

    # TCD ###########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace '\.Droputs\.Fixed\.REPACK\.v\d\.\d\.WIN-TCD', ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.PROPER-TCD'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.Fixed\.REPACK\.v\d\.\d\.WIN-TCD', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.REPACK\.v\d\.\d\.WIN-TCD', ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-TCD'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-TCD'), ''

    # 0TH3Rside #####################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.MAC-0TH3Rside'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('_0TH3Rside'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-0TH3Rside'), ''


    # DECiBEL #######################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.RETAiL.WiN.OSX-DECiBEL'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.AU.WiN.OSX-DECiBEL'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.HYBRiD-DECiBEL'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-DECiBEL'), ''

    # ARCADiA #######################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.WIN-ARCADiA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.WIN-ARCADiA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-ARCADiA'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-ARCADiA'), ''

    # NEMESiS #######################################################

    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST\.RTAS\.v\d\.\d\.\d\.Incl\.KeyGen\.x32\.x64\.WIN-NEMESiS', ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.KeyGen.x32.x64.WIN-NEMESiS'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-NEMESiS'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('-NEMESiS'), ''

    # OTHERS ########################################################

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Unlocked-r4e.FIXED'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER.MERRY.XMAS-CHAOS'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PROPER-peace-out'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.UNLOCKED.FLEXPACK-iNVINCIBLE'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.by.COLOVE.Products'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.by.COLOVE.Products.VST2.VST3.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.incl.KeyGen-BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MACOSX.PROPER.BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MAC.PROPER.BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Portable.Proper.BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.64Bit.Win-AUDIOWAREZ'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Complete.USB-BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.Repack.Read.iNFO'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.MacOS.Incl.Keygen-BTCR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.MacOSX.Incl Keygen-BTCR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Incl.KeyGen.READ.NFO-ViP'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x86.Multilingual.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x64.Multilingual.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x86.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x64.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VSTi.Crack.Only'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.x86.x64-MATRiX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('_MACOSX64-XFORCE'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.ISO-bobdule'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-bobdule'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Trial.Reset.macOS'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.PORTABLE-vkDanilov'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Team-BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.USB-BEAT'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Win.Repack-AUDIOWAREZ'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-AUDIOWAREZ'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-vkDanilov'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN-Troon'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN-TRAZOR'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-Troon$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-HEXWARS$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-UNION$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-TNT$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-DVT$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-TNT$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-F4CG$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-HCiSO$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-BEAT$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-BTCR$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-z3ro$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-vkDanilov$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-BLiZZARD$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-AUDIOWAREZ$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-HCiSO$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-XFORCE$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.HYBRiD$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-STUDIO$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-peace-out$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-bobdule$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '-iNVINCIBLE$', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.Purchased$', ''


    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST\.VST3\.AU\.AAX\.v\d\.\d\.\d\.WIN\.MAC', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST\.VST3\.AU\.v\d\.\d\.\d\.WIN\.MAC', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST\.VST3\.AU\.v\d\.\d\.\d\.WIN\.MAC', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST3\.AU\.AAX\.v\d\.\d\.MAC\.WiN', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST3\.AU\.AAX\.v\d\.\d\.WiN', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST3\.v\d\.\d\.WiN', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.Win\.Mac\.V\d\.\d\.\d', ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.VST\.VST3\.AU\.AAX\.v\d\.\d\.MAC\.WiN', ''


    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.64-BiT.VST2.VST3.AU.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.AU.x86.x64.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST2.VST3.AU.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.AAX.x64.WiN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.AU.AAX.x64.MAC.WiN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.AU.AAX.RTAS.MAC_WiN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.VST3.AU.AAX.LINUX.MAC.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.AU.VST.VST3.32.64bit.MacWin'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3.AU.M4L.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3.AU.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FULL.WIN.LINUX.OSX-RETAIL'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3.AU.WIN.OSX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST2.VST3.AAX.x64.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.x86.x64.PROPER'), ''

    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x64.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Regged.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FULL.WIN.FIXED'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.UPDATE.WIN.FIXED'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail.WiN.MAC.LINUX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.RETAIL.x64.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.RETAiL.WiN.OSX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.OSX.RETAiL'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail.VST.WIN.OSX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail.WIN.MAC'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.Retail.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.PROPER.FiXED'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST.Win64.Crack'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.FiXED.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST3.WIN.64'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x86.x64.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.VST2.VST3.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.MAC.LINUX'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.REGGED'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.Freeware'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.FREE'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.MAC$'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WiN.OSX$'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.MAC.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.WIN.FREE'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace [Regex]::Escape('.x64.WIN'), ''
    $FinalSearchTerm = $FinalSearchTerm -replace '\.WIN$', ''

    # Remove Version Strings
    $FinalSearchTerm = $FinalSearchTerm -replace '\s*v\d+(\.\d+)*\s*', ''

    # Convert periods and underscores into Spaces
    $FinalSearchTerm = $FinalSearchTerm -replace '\.', ' '
    $FinalSearchTerm = $FinalSearchTerm -replace '_', ' '

    Write-Host "`$FinalSearchTerm:" $FinalSearchTerm -ForegroundColor Green

    $List.Add($FinalSearchTerm)

}

if($ImageSearch){
    Search-GoogleIt -Query $List -ImageSearch -ImageSearchSize $ImageSearchSize
}else{
    Search-GoogleIt -Query $List
}

Remove-Item $FileList -Force