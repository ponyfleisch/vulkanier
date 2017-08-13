#import "window.h"

@implementation MyMetalWindow

NSAutoreleasePool * pool;

void* helloworld() {
    pool = [[NSAutoreleasePool alloc] init];
    [NSApplication sharedApplication];

    NSUInteger windowStyle = NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask;

    // Window bounds (x, y, width, height).
    NSRect windowRect = NSMakeRect(200, 200, 400, 400);
    NSWindow * window = [[NSWindow alloc] initWithContentRect:windowRect
                                          styleMask:windowStyle
                                          backing:NSBackingStoreBuffered
                                          defer:NO];
    [window autorelease];

    // Window controller:
    NSWindowController * windowController = [[NSWindowController alloc] initWithWindow:window];
    [windowController autorelease];

    MTKView* metalView = [[MTKView alloc] initWithFrame:windowRect device:MTLCreateSystemDefaultDevice()];

    [metalView setClearColor:MTLClearColorMake(0, 0, 0, 1)];
    [metalView setColorPixelFormat:MTLPixelFormatBGRA8Unorm];
    [metalView setDepthStencilPixelFormat:MTLPixelFormatDepth32Float];

    [window setContentView:metalView];

    // TODO: Create app delegate to handle system events.
    // TODO: Create menus (especially Quit!)

    [window orderFrontRegardless];

    return (void*)metalView;
}

void runLoop()
{
    NSEvent *event =
        [NSApp
            nextEventMatchingMask:NSAnyEventMask
            untilDate:nil
            inMode:NSDefaultRunLoopMode
            dequeue:YES];

    [NSApp sendEvent:event];
    [NSApp updateWindows];
}
@end