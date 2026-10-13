# Motion + 3D Playbook

## Stack (pick the lightest that works)
| Need | Tool |
|---|---|
| Scroll reveals, pinning, scrub | GSAP + ScrollTrigger |
| Smooth scroll | Lenis, synced: lenis.on('scroll', ScrollTrigger.update); gsap.ticker.add(t => lenis.raf(t*1000)); gsap.ticker.lagSmoothing(0) |
| Text splitting | GSAP SplitText |
| 3D in plain HTML | three.js (pinned version) + GLTFLoader |
| 3D in React | @react-three/fiber + drei + postprocessing |
| Shaders / backgrounds | GLSL fragment shader on a full-screen plane, or OGL (lightweight) |
| Page transitions | View Transitions API, or GSAP / Framer Motion |
| Micro-interactions | CSS transitions, Framer Motion |
| Vector motion | Lottie (dotLottie), SVG + GSAP |
Native CSS scroll-driven animations (animation-timeline: view()) are fine for simple reveals with progressive enhancement.

## Signature moment recipes
1. **Pinned 3D product scroll**: pin a canvas; scrub camera position/rotation and material color with a ScrollTrigger timeline; swap copy panels per scene.
2. **Floating object hero**: GLB model (Draco-compressed, under 2 MB), slow rotation, mouse parallax, warm rim light, soft contact shadow.
3. **Shader hero**: warm flowing gradient/noise reacting to cursor; cap DPR at 1.5.
4. **Horizontal story**: pinned container, translate x with scrub, 3-5 panels.
5. **Text mask reveal + marquee**: huge headline revealed line by line; marquee of proof.
6. **Image sequence scrub**: 60-120 webp frames on canvas, scrubbed by scroll, preloaded progressively.

## Warm 3D lighting
Key light around #FFD9A0, fill from the palette accent, warm hemisphere light, ACESFilmic tone mapping, sRGB output, subtle bloom only. Prefer baked/soft shadows.

## Performance rules
- Cap devicePixelRatio at 1.5-2; pause the render loop when the canvas is offscreen (IntersectionObserver) or tab hidden.
- Animate transform/opacity only; use will-change sparingly.
- Compress: glTF-Transform/Draco/Meshopt, KTX2 textures, WebP/AVIF images, subset fonts.
- Lazy-load 3D after first paint; show a poster image meanwhile.
- Disable heavy effects on (pointer: coarse) or low navigator.hardwareConcurrency.
- gsap.matchMedia() for desktop/mobile/reduced-motion variants; kill ScrollTriggers on cleanup (React: useGSAP).

## Accessibility
Respect prefers-reduced-motion; never trap scroll; content readable without JS/WebGL; no flashing over 3 times per second; pause control for autoplay.

## No-asset 3D fallback
If no GLB is supplied: build procedural geometry (torus knot, icosahedron, lathe) with MeshPhysicalMaterial in palette colors, or a shader. Never ship a placeholder that looks broken.
