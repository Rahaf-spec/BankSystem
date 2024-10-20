import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'logo_interface_model.dart';
export 'logo_interface_model.dart';

class LogoInterfaceWidget extends StatefulWidget {
  const LogoInterfaceWidget({super.key});

  @override
  State<LogoInterfaceWidget> createState() => _LogoInterfaceWidgetState();
}

class _LogoInterfaceWidgetState extends State<LogoInterfaceWidget>
    with TickerProviderStateMixin {
  late LogoInterfaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoInterfaceModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1580.0.ms,
            begin: 0.245,
            end: 0.755,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1690.0.ms,
            begin: 0.3,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1690.0.ms,
            begin: 0.245,
            end: 0.755,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1690.0.ms,
            begin: 0.52,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1690.0.ms,
            begin: 0.245,
            end: 0.755,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFEDF0F3),
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 100.0),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/Untitled337_20240502230140.PNG'
                          : 'assets/images/Untitled337_20240502225732.PNG',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0.0, -1.0),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation1']!),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 500.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.goNamed(
                                  'loginPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '5adeev3r' /* Get Started */,
                              ),
                              icon: const Icon(
                                Icons.not_started_outlined,
                                color: Color(0xB79489F5),
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                color: const Color(0x5B39D2C0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.5, 0.71),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/ed2cbdd637e8f18d2ee95d431a5aa4bc.gif'
                          : 'assets/images/ed2cbdd637e8f18d2ee95d431a5aa4bc.gif',
                      width: 133.0,
                      height: 69.0,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
