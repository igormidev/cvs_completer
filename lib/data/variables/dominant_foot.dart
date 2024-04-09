import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/dominant_body_part.pb.dart'
    as pb;

enum DominantFoot {
  unknown,
  left,
  right,
  both;

  factory DominantFoot.fromText(String text) {
    switch (text) {
      case 'left':
        return DominantFoot.left;
      case 'right':
        return DominantFoot.right;
      case 'both':
        return DominantFoot.both;
      default:
        return DominantFoot.unknown;
    }
  }

  factory DominantFoot.fromPb(pb.DominantFoot p) {
    switch (p) {
      case pb.DominantFoot.DOMINANT_FOOT_LEFT:
        return DominantFoot.left;
      case pb.DominantFoot.DOMINANT_FOOT_RIGHT:
        return DominantFoot.right;
      case pb.DominantFoot.DOMINANT_FOOT_BOTH:
        return DominantFoot.both;
      // ignore: no_default_cases
      default:
        return DominantFoot.unknown;
    }
  }
}
