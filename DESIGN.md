---
name: CatalogStudio
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#434655'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#737686'
  outline-variant: '#c3c6d7'
  surface-tint: '#0053db'
  primary: '#004ac6'
  on-primary: '#ffffff'
  primary-container: '#2563eb'
  on-primary-container: '#eeefff'
  inverse-primary: '#b4c5ff'
  secondary: '#565e74'
  on-secondary: '#ffffff'
  secondary-container: '#dae2fd'
  on-secondary-container: '#5c647a'
  tertiary: '#943700'
  on-tertiary: '#ffffff'
  tertiary-container: '#bc4800'
  on-tertiary-container: '#ffede6'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dbe1ff'
  primary-fixed-dim: '#b4c5ff'
  on-primary-fixed: '#00174b'
  on-primary-fixed-variant: '#003ea8'
  secondary-fixed: '#dae2fd'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3f465c'
  tertiary-fixed: '#ffdbcd'
  tertiary-fixed-dim: '#ffb596'
  on-tertiary-fixed: '#360f00'
  on-tertiary-fixed-variant: '#7d2d00'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  title-sm:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.02em
  mono-label:
    fontFamily: JetBrains Mono
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  sidebar_width: 400px
  canvas_padding: 48px
  container_gap: 16px
  grid_unit: 4px
  margin-sm: 12px
  margin-md: 24px
---

## Brand & Style
The design system is engineered for high-productivity SaaS environments where information density and clarity are paramount. The brand personality is **Precise, Reliable, and Functional**, catering to catalog managers and creative directors who need a tool that stays out of the way while providing powerful editing capabilities.

The aesthetic follows a **SaaS-Professional** movement: a hybrid of clean minimalism and functional utility. It utilizes high-contrast interfaces to differentiate between the "Builder UI" (the tools) and the "Canvas" (the output). The goal is to evoke a sense of organized creativity—where the tool feels like a sophisticated instrument.

## Colors
The palette is anchored by **Catalog Blue (#2563eb)**, used strategically for primary actions and active states to guide the user's eye. 

- **Primary:** Catalog Blue is reserved for the most important interactive elements.
- **Neutral Stack:** A sophisticated range of Slate and Gray tones defines the UI structure. Deep slates (#0f172a) are used for text and high-contrast iconography, while lighter grays provide soft boundaries for sidebars and toolbars.
- **Canvas Distinction:** The "Page Preview" area utilizes a pure white surface against a light gray background to simulate a physical paper medium, creating a clear mental model between the editing interface and the final product.

## Typography
The UI typography relies exclusively on **Inter** for its exceptional legibility and systematic feel at small sizes. It uses a tight scale to maintain high information density without sacrificing readability.

- **UI Elements:** Use `label-sm` for sidebar items and property headers.
- **Catalog Content:** While the UI is Inter, the system supports **Roboto** and **Poppins** specifically for the catalog preview area to allow for diverse creative expressions in the end product.
- **Utility:** A monospaced font is used for technical metadata (SKUs, coordinates, and dimensions) to ensure character alignment in data-heavy views.

## Layout & Spacing
The layout is a rigid, two-column production environment designed for desktop-first workflows.

- **Sidebar (400px):** A fixed-width toolset containing the product hierarchy, property editors, and asset libraries. It uses a tabbed navigation system at the top for context switching.
- **Main Area (Flexible):** An expansive work area featuring a "Safe Zone" for the catalog preview. 
- **The Preview Area:** Uses a "Paper-like" model. It is centered in the flexible space with a minimum margin of 48px to allow for focus.
- **Rhythm:** All spacing is derived from a 4px baseline grid to ensure mathematical precision in element alignment.

## Elevation & Depth
Depth is used functionally to separate the "Tooling" from the "Result."

- **The Preview Surface:** Employs a "realistic" shadow (large blur, low opacity) to make the page appear as if it is floating slightly above the gray work surface. This focuses the user’s creative attention.
- **Interface Tiers:** The sidebar uses subtle tonal layering rather than shadows. Section headers use a slightly darker background than the primary sidebar surface to create a sense of containment.
- **Collapsible Cards:** When expanded for editing, cards use a thin, 1px neutral border and no shadow to maintain a flat, professional profile that doesn't clutter the workspace.

## Shapes
This design system uses a **Soft (0.25rem)** roundedness profile. This level of curvature provides a modern touch while maintaining the structured, professional look of a precision tool.

- **Controls:** Input fields, small buttons, and chips use the base 0.25rem radius.
- **Structural Elements:** Large containers like the Page Preview or Sidebar panels use `rounded-lg` (0.5rem) to soften the overall interface and frame the content elegantly.

## Components
- **Collapsible Cards:** Used for product attribute editing. Headers include a chevron icon on the left, a bold label, and a status indicator (e.g., "Draft" or "Live"). The body of the card should use a 12px internal padding with a subtle vertical line on the left to indicate scope.
- **Tabbed Sidebar:** Horizontal tabs at the very top of the sidebar using a high-contrast active state (Catalog Blue bottom border, 2px).
- **Input Fields:** Minimalist design with a 1px border. Focus states must use the Primary Blue for the border and a subtle 2px outer glow.
- **The Preview Canvas:** A white container with `rounded-sm` corners and a multi-layered box-shadow: `0 1px 3px rgba(0,0,0,0.1), 0 10px 20px rgba(0,0,0,0.05)`.
- **Action Buttons:** Primary buttons are solid Catalog Blue with white text. Secondary buttons are ghost-style with a Slate-700 text and border.
- **Property Labels:** All input labels should be uppercase, `label-sm`, and Slate-500 color for a professional "blueprint" feel.