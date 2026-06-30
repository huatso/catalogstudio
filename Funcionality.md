# CatalogStudio

A React single-file application for building product catalogs and exporting them as PDF. Built as a single `.jsx` file with no external dependencies beyond React and Google Fonts.

---

## Stack

- **React** (hooks: `useState`, `useRef`, `useCallback`)
- Inline CSS via a `<style>` tag injected at render time
- SVG icons drawn inline — no icon library dependency
- Google Fonts via `@import` (Inter, Roboto, Poppins)
- PDF export via the browser's native `window.print()` with injected `@page` styles

---

## Application Layout

The UI is split into two panels:

- **Left sidebar** — all controls, split into three tabs: Products, Design, Layout
- **Right main area** — live preview of the catalog pages with zoom controls and export button

---

## Product Data Model

Each product has the following fields (all optional except `name`):

| Field | Type | Description |
|---|---|---|
| `id` | string | Auto-generated UID |
| `name` | string | Product name |
| `sku` | string | SKU or product code |
| `description` | string | Multi-line text description |
| `price` | string | Free-text price (e.g. `R$:25,00`) |
| `pcs` | string | Packaging info (e.g. `PCS/CX:100`) |
| `imageUrl` | string | Base64 data URL from file upload |
| `linkUrl` | string | Clickable URL (checkout, product page, WhatsApp, etc.) |
| `linkLabel` | string | Per-product link button text (overrides global default) |

---

## Sidebar Tabs

### Products Tab

- **Add product** — creates a new blank product and expands it for editing immediately
- **Import CSV** — opens the import modal
- **Product list** — each product is shown as a collapsible card with:
  - Thumbnail (image or placeholder icon)
  - Name and SKU preview
  - Up/down reorder buttons
  - Delete button
  - Expanded edit form (all fields above)
  - Image upload area (click to upload, renders preview)

### Design Tab

**Identity**
- Company name (displayed in header when no logo is set)
- Catalog title (displayed in header, right-aligned)
- Logo upload (replaces company name text in header)
- Footer text (shown at the bottom of every page)
- Price label (global label above the price, e.g. "Preço unitário")
- Default link label (fallback text for the link button when a product has no `linkLabel` set)

**Colors**
- Primary color — used for the header background, SKU bar, price bar, and link text
- Accent text color — text color used over the primary color (header, SKU bar, price bar)
- Page background color
- Card background color
- Body text color

**Typography**
- Font family selector: Inter, Roboto, Poppins, Georgia, Arial
- Font size slider: 8–14px (base size; name is +1px, description is −1px, PCS is −2px)

**Header style**
- `full` — solid primary-color background spanning the full width, company name left, catalog title right
- `minimal` — white background with a bottom border in the primary color
- `none` — no header rendered

**Cards**
- Border radius slider: 0–20px
- Image height slider: 80–280px
- Toggle: show/hide card borders

**Visible fields** — individual toggles for:
- SKU / Código
- Embalagem (PCS)
- Preço
- Descrição
- Link / Botão de acesso (also reveals the default link label field when enabled)

### Layout Tab

**Paper size**
- A4 (794×1123px)
- A3 (1123×1587px)
- Letter (816×1056px)

**Orientation**
- Portrait (vertical)
- Landscape (horizontal) — swaps width and height

**Grid**
- Columns per page: slider 1–6
- Rows per page: slider 1–8
- Live stat box: shows products-per-page and total page count

---

## Preview Area

- Renders all catalog pages as live DOM (same markup used for print)
- Zoom controls: −10%, +10%, Reset to 75%
- Pages are stacked vertically with a gap between them
- Page shadows give a paper-like appearance in preview

---

## Export PDF

Clicking **Exportar PDF**:
1. Injects a `<style>` tag with `@page { size: WxH; margin: 0 }` and print-specific rules that hide the app UI and show only the catalog pages
2. Clones the `#catalog-preview` element into a separate `#print-root` div appended to `<body>`
3. Calls `window.print()` — the browser opens its print dialog
4. Cleans up both the style tag and the cloned div after 1 second

The user selects **Save as PDF** in the print dialog. The output preserves clickable `<a>` links (visible in PDF viewers like Acrobat and Chrome's built-in viewer).

---

## CSV Import

Accessible via the **Importar CSV** button. Accepts `.csv` or `.txt` files.

Column name mapping (case-insensitive, spaces replaced with `_`):

| Product field | Accepted CSV column names |
|---|---|
| `sku` | `sku`, `codigo`, `code` |
| `name` | `name`, `nome`, `produto` |
| `description` | `description`, `descricao`, `desc` |
| `price` | `price`, `preco`, `valor` |
| `pcs` | `pcs`, `embalagem` |
| `imageUrl` | `image`, `imagem`, `image_url` |
| `linkUrl` | `link`, `url`, `link_url` |
| `linkLabel` | `link_label`, `link_texto` |

Columns can be in any order. Quoted values are supported. Imported products are appended to the existing list.

**Example CSV:**
```
sku,name,price,description,pcs,link
SUP-7478,"Suporte Starlink Mini",R$:60,"Material: alumínio",PCS/CX:42,https://loja.com/sup-7478
CAB-2205,"Cabo de áudio P2-P10",R$:3.5,"Tamanho: 1.5m",PCS/CX:300,
```

---

## Card Anatomy (in the PDF)

From top to bottom, each product card contains:

1. **SKU bar** — primary color background, white text, uppercase (hidden if `showSku` is off or SKU is empty)
2. **Product image** — fixed height, `object-fit: contain`, light gray background; shows a placeholder icon if no image
3. **Product info block:**
   - Product name (bold, font size + 1)
   - Description (gray, font size − 1, clamped to 4 lines) — hidden if `showDescription` is off
   - Packaging / PCS (lighter gray, font size − 2) — hidden if `showPcs` is off
4. **Price bar** — primary color background, white text, label on the left, value on the right — hidden if `showPrice` is off or price is empty
5. **Link** — text link in the primary color, centered, below a hairline border — only shown if `showLink` is on and the product has a `linkUrl`

---

## Pagination Logic

Products are split into pages based on `cols × rows`. If there are no products, one empty page is shown. Pages are numbered starting at `01` in the footer.

---

## Known Limitations & Extension Points

- **Images** are stored as base64 data URLs in React state — not persisted between sessions. A backend or `localStorage` layer would be needed for persistence.
- **CSV parsing** is a simple split on `,` — does not handle commas inside quoted fields that span multiple commas. A library like PapaParse would make this robust.
- **Print fidelity** depends on the browser. Chrome produces the most accurate output. Users should disable "Headers and footers" in the print dialog for a clean result.
- **QR codes** are a natural next step — each product's `linkUrl` could be rendered as a QR code inside the card using a library like `qrcode.react`.
- **State persistence** — saving/loading the catalog as JSON would make the tool usable across sessions.
- **Drag-and-drop reordering** — currently done with up/down buttons; could be replaced with a proper DnD library.
